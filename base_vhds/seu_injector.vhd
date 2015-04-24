----------------------------------------------------------------------------------
-- Fault injector
-- Wraps ICAP and randomly selects frame address and bit position
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.injector_pack.all;

entity seu_injector is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           inject : in  STD_LOGIC;
           fix : in  STD_LOGIC;
           injected : out  STD_LOGIC;
           inj_faddr : out  STD_LOGIC_VECTOR (23 downto 0);
           inj_bitpos : out  STD_LOGIC_VECTOR (BITPOS_LFSR_WIDTH-1 downto 0);
			  tx_write : out STD_LOGIC;
			  tx_data : out STD_LOGIC_VECTOR(7 downto 0);
			  tx_full : in STD_LOGIC;
			  req_send_cr : out STD_LOGIC;
			  leds : out STD_LOGIC_VECTOR(7 downto 4));
end seu_injector;

architecture Behavioral of seu_injector is

	component faddrGen is
		 Port ( clk : in  STD_LOGIC;
				  next_faddr : in  STD_LOGIC;
				  rst : in  STD_LOGIC;
				  valid_faddr : out STD_LOGIC;
				  critical_frame : out STD_LOGIC;
				  critical_frame_1e : out STD_LOGIC;
				  faddr : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component lfsr is
		 Generic ( LFSR_WIDTH : integer := BITPOS_LFSR_WIDTH;
					  SEED : STD_LOGIC_VECTOR (BITPOS_LFSR_WIDTH-1 downto 0) := "10101010101"
		 );
		 Port ( clk : in  STD_LOGIC;
				  next_num : in  STD_LOGIC;
				  rst : in  STD_LOGIC;
				  rand_out : out  STD_LOGIC_VECTOR (LFSR_WIDTH-1 downto 0));
	end component;
	
	component icap_virtex5_fake is
			generic(
					ICAP_WIDTH : string := "X32"
			 );
		 Port ( BUSY : out  STD_LOGIC;
				  O : out  STD_LOGIC_VECTOR (31 downto 0);
				  CE : in  STD_LOGIC;
				  I : in  STD_LOGIC_VECTOR (31 downto 0);
				  WRITE : in  STD_LOGIC;
				  CLK : in  STD_LOGIC);
	end component;
	
	COMPONENT frame_mem
	  PORT (
		 clka : IN STD_LOGIC;
		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	  );
	END COMPONENT;
	
	component bin2ascii is
		Port ( bin	: in  STD_LOGIC_VECTOR(3 downto 0);
				 ascii : out STD_LOGIC_VECTOR(7 downto 0));
	end component;

	type state_seu_injector is (IDLE, WAIT_RANGE, SEND_CR_NEW_FADDR, LOWER_ICAP_CE, READ_CMD, SKIP_DUMMY_FRAME, READ_FRAME,
									RAISE_ICAP_WRITE, FLIP_BIT, LOWER_ICAP_CE_2, WRITE_CMD, WRITE_FRAME,
									WRITE_DUMMY_FRAME, READ_CONFIRM, RAISE_ICAP_WRITE_2, SKIP_DUMMY_FRAME_CONFIRM,
									WAIT_MEM_READ, READ_FRAME_CONFIRM, DONE, TRANSMIT_MEM, TRANSMIT_WORD,
									TRANSMIT_CONFIRM, TRANSMIT_WORD_CONFIRM, WAIT_MEM_2, SEND_FADDR,
									SEND_BITPOS, SEND_CR);
	
	
	signal state : state_seu_injector := IDLE;
	signal out_of_range, next_bit_req, next_bit : std_logic;
	signal bit_pos : std_logic_vector(BITPOS_LFSR_WIDTH-1 downto 0);
	signal next_faddr, valid_faddr, not_first_inj : std_logic;
	signal new_frame_flag : std_logic := '1';
	signal faddr, faddr_reg, word_to_flip : std_logic_vector(31 downto 0);
	signal frame_word_addr, words_to_read : std_logic_vector(7 downto 0);
	signal mem_icap_cmp : std_logic;
	signal injected_int : std_logic;
	signal hex_digit : std_logic_vector(3 downto 0);
	signal send_reg : std_logic_vector(23 downto 0);
	
	signal transmit_cnt : std_logic_vector(2 downto 0);
	signal difference_flag : std_logic;
	signal critical_frame, stop_cmp, critical_frame_1e : std_logic;
	
	--ICAP Signals
	signal icap_busy, icap_ce_b, icap_write_b : std_logic;
	signal icap_o_unswapped, icap_i_unswapped : std_logic_vector(31 downto 0);
	signal icap_o, icap_i : std_logic_vector(31 downto 0); 
	signal read_seq, write_seq : std_logic_vector(31 downto 0);
	signal cmd_cnt : std_logic_vector(7 downto 0);

	--Frame Memory Signals
	signal frame_mem_din, frame_mem_dout, frame_mem_dout_reg, confirm_mem_dout : std_logic_vector (31 downto 0);
	signal frame_mem_wr, confirm_mem_wr : std_logic;
	signal frame_mem_addr : std_logic_vector(7 downto 0);
	
begin
	
	leds <= (others => '0');
	
	b2a : bin2ascii
		port map(
			bin => hex_digit,
			ascii => tx_data
	);
	hex_digit <=  send_reg(23 downto 20) when state = SEND_FADDR or state = SEND_BITPOS else
					  frame_mem_dout_reg(31 downto 28);
	
	tx_write <= '1' when (state = SEND_FADDR or state = SEND_CR or  state = SEND_CR_NEW_FADDR or
								state = SEND_BITPOS or state = TRANSMIT_WORD	or state = TRANSMIT_WORD_CONFIRM) and tx_full = '0' else '0';
									
	req_send_cr <= '1' when state = SEND_CR or state = SEND_CR_NEW_FADDR else '0';
	
	inj_bitpos <= bit_pos;
	inj_faddr <= faddr(23 downto 0);
	
	injected <= injected_int;
	next_bit <= out_of_range or next_bit_req;
	
	gen_bitpos_lfsr : if EXHAUSTIVE_INJECTION = 0 generate
		out_of_range <= '1' when bit_pos >= conv_std_logic_vector(BITS_PER_FRAME, BITPOS_LFSR_WIDTH) or (bit_pos >= "01010010000" and bit_pos <= "01010011111" ) else '0';
		bitpos_lfsr : lfsr
			port map (
				clk => clk,
				next_num => next_bit,
				rst => rst,
				rand_out => bit_pos
		);
	end generate;
	
	gen_bitpos_adder : if EXHAUSTIVE_INJECTION = 1 generate
		out_of_range <= '0';
		process(clk)
		begin
			if clk'event and clk = '1' then
				if rst = '1' then
					bit_pos <= (others => '0');
				else
					if next_bit = '1' then
						if bit_pos = conv_std_logic_vector(BITS_PER_FRAME-1, BITPOS_LFSR_WIDTH) then
							bit_pos <= (others => '0');
						elsif bit_pos = "01010001111" then --skips unused bits
							bit_pos <= "01010100000";
						else
							bit_pos <= bit_pos + conv_std_logic_vector(1, BITPOS_LFSR_WIDTH);
						end if;
					end if;
				end if;
			end if;
		end process;
	end generate;
	
	faddr_generator : faddrGen
		port map (
			clk => clk,
			next_faddr => next_faddr,
			rst => rst,
			valid_faddr => valid_faddr,
			critical_frame => critical_frame,
			critical_frame_1e => critical_frame_1e,
			faddr => faddr
	);

	process(clk)
	begin
		if clk'event and clk = '1' then
			if rst = '1' then
				state <= idle;
				injected_int <= '0';
				icap_ce_b <= '1';
				icap_write_b <= '1';
				difference_flag <= '0';
				not_first_inj <= '0';
				new_frame_flag <= '1';
			else
				case state is
					when IDLE => --waits 'inject' or 'fix' commands
						icap_ce_b <= '1';
						icap_write_b <= '1';
						if inject = '1' then --fault injection
							state <= WAIT_RANGE;
							if EXHAUSTIVE_INJECTION = 0 then --if fault injection is NOT exhaustive, the faddr always changes
								next_faddr <= '1';
							else --if it is exhaustive, faddr changes only when the last bit was flipped
								if bit_pos = conv_std_logic_vector(BITS_PER_FRAME-1, BITPOS_LFSR_WIDTH) then
									next_faddr <= '1';
								end if;								
							end if;
							next_bit_req <= not_first_inj; --the bit is incremented only if this is not the first injection
						end if;
						if fix = '1' then --fault removal request
							state <= FLIP_BIT;
						end if;
					
					when WAIT_RANGE =>
						not_first_inj <= '1'; --the next fault will no longer be the first
						--t1 <= time_cnt;
						next_faddr <= '0';
						next_bit_req <= '0';
						if next_faddr = '1' and EXHAUSTIVE_INJECTION = 1 then
							new_frame_flag <= '1';
							--state <= SEND_CR_NEW_FADDR;
						elsif valid_faddr = '1' and out_of_range = '0' then --we have a valid frame address
							state <= LOWER_ICAP_CE;
							cmd_cnt <= (others => '0');
							icap_write_b <= '0';
							faddr_reg <= faddr;
						end if;
						
					when SEND_CR_NEW_FADDR => --sends a CR to indicate that it's a new frame
						new_frame_flag <= '1';
						if tx_full = '0' then
							state <= WAIT_RANGE;
						end if;
						
					
					when LOWER_ICAP_CE =>
						cmd_cnt <= (others => '0');
						icap_ce_b <= '0';
						state <= READ_CMD;
						--some frames may modify multiple frames - we have to make sure that the fault correction will be able to restore them
						--more detail can be found at "Fast Single FPGA Fault Injection Platform"
						if critical_frame = '1' then
							words_to_read <= conv_std_logic_vector(205, 8);
						elsif critical_frame_1e = '1' then
							words_to_read <= conv_std_logic_vector(246, 8);
						else
							words_to_read <= conv_std_logic_vector(41, 8);
						end if;
					
					when READ_CMD => --sends the read command
						cmd_cnt <= cmd_cnt + conv_std_logic_vector(1, 8);
						frame_word_addr <= (others => '0');
						if cmd_cnt = conv_std_logic_vector(17, 8) then
							state <= RAISE_ICAP_WRITE;
							icap_ce_b <= '1';
						end if;
						
					when RAISE_ICAP_WRITE => --raises icap_write to start reading the frame
						icap_write_b <= '1';
						state <= SKIP_DUMMY_FRAME;
					
					when SKIP_DUMMY_FRAME => --skips the dummy frame
						icap_ce_b <= '0';
						if icap_busy = '0' then
							if frame_word_addr = conv_std_logic_vector(41, 8) then
								state <= READ_FRAME;
								frame_word_addr <= (others => '0');
							else
								frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
							end if;
						end if;
						
					when READ_FRAME => --reads the actual frame data
						cmd_cnt <= (others => '0');
						if icap_busy = '0' then
							if frame_word_addr = bit_pos(BITPOS_LFSR_WIDTH-1 downto 5) then
								word_to_flip <= icap_o;
							end if;
							if frame_word_addr = words_to_read - conv_std_logic_vector(1, 8) then
								if NO_FADDR = 1  or (EXHAUSTIVE_INJECTION = 1 and new_frame_flag = '0') then
								   --if no frame address is to be sent...
									state <= FLIP_BIT;
									icap_ce_b <= '1';
								else
									new_frame_flag <= '0';
									state <= SEND_FADDR;
								end if;
								transmit_cnt <= (others => '0');
								send_reg <= faddr_reg(23 downto 0);
								frame_word_addr <= (others => '0');
							else
								frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
							end if;
						end if;
					
					when SEND_FADDR => --sends frame address
						if tx_full = '0' then
							if transmit_cnt = "101" then
								state <= SEND_BITPOS;
								send_reg <= "0" & bit_pos & X"000"; 
								transmit_cnt <= (others => '0');
							else
								send_reg <= send_reg(19 downto 0) & "0000";
								transmit_cnt <= transmit_cnt + "001";
							end if;
						end if;
					
					when SEND_BITPOS => --and bit position
						if tx_full = '0' then
							send_reg <= send_reg(19 downto 0) & "0000";
							transmit_cnt <= transmit_cnt + "001";
							if transmit_cnt = "010" then
								state <= SEND_CR;
							end if;
						end if;
					
					when SEND_CR => --sends a carriage return
						if tx_full = '0' then
							if VERBOSE = 1 then
								state <= TRANSMIT_MEM;
							else
								state <= FLIP_BIT;
								icap_ce_b <= '1';
							end if;
						end if;
					
					when TRANSMIT_MEM => --transmits the configuration memory content
						frame_mem_dout_reg <= frame_mem_dout;
						frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
						transmit_cnt <= (others => '0');
						state <= TRANSMIT_WORD;
					
					when TRANSMIT_WORD =>
						if tx_full = '0' then
							frame_mem_dout_reg <= frame_mem_dout_reg(27 downto 0) & "0000";
							transmit_cnt <= transmit_cnt + "001";
							if transmit_cnt = "111" then
								if frame_word_addr = words_to_read then
									state <= FLIP_BIT;
									icap_ce_b <= '1';
									frame_word_addr <= (others => '0');
								else
									state <= TRANSMIT_MEM;
								end if;
							end if;
						end if;
					
					when FLIP_BIT => --actually flips the bit to inject (or remove) a fault
						word_to_flip(conv_integer(unsigned(bit_pos(4 downto 0)))) <= not word_to_flip(conv_integer(unsigned(bit_pos(4 downto 0))));
						icap_write_b <= '0';
						cmd_cnt <= (others => '0');
						state <= LOWER_ICAP_CE_2;
						
					when LOWER_ICAP_CE_2 =>
						icap_ce_b <= '0';
						frame_word_addr <= (others => '0');
						state <= WRITE_CMD;
						
					when WRITE_CMD => --sends the write command
						cmd_cnt <= cmd_cnt + conv_std_logic_vector(1, 8);
						if cmd_cnt = conv_std_logic_vector(22, 8) then
							state <= WRITE_FRAME;
							frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
						end if;
						
					when WRITE_FRAME => --writes the frame data
						if frame_word_addr = words_to_read then
							state <= WRITE_DUMMY_FRAME;
							frame_word_addr <= (others => '0');
							cmd_cnt <= (others => '0');
						else
							frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
						end if;
					
					when WRITE_DUMMY_FRAME => --writes a dummy frame (required by ICAP)
						cmd_cnt <= (others => '0');
						if frame_word_addr = conv_std_logic_vector(41, 8) then	
							state <= READ_CONFIRM;
							frame_word_addr <= (others => '0');
						else
							frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
						end if;
						
					when READ_CONFIRM => --reads the frame to confirm that a fault was successfully injected
						cmd_cnt <= cmd_cnt + conv_std_logic_vector(1, 8);
						frame_word_addr <= (others => '0');
						if cmd_cnt = conv_std_logic_vector(17, 8) then
							state <= RAISE_ICAP_WRITE_2;
							icap_ce_b <= '1';
						end if;
						
					when RAISE_ICAP_WRITE_2 =>
						icap_write_b <= '1';
						state <= SKIP_DUMMY_FRAME_CONFIRM;
					
					when SKIP_DUMMY_FRAME_CONFIRM =>
						icap_ce_b <= '0';
						if icap_busy = '0' then
							if frame_word_addr = conv_std_logic_vector(40, 8) then
								state <= WAIT_MEM_READ;
								frame_word_addr <= (others => '0');
							else
								frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
							end if;
						end if;
					
					when WAIT_MEM_READ =>
						stop_cmp <= '0';
						if icap_busy = '0' then
							state <= READ_FRAME_CONFIRM;
							frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
						end if;
						
					when READ_FRAME_CONFIRM =>
						cmd_cnt <= (others => '0');
						if icap_busy = '0' then
							if mem_icap_cmp = '1' and stop_cmp = '0' then
								difference_flag <= '1';
							end if;
							if frame_word_addr = conv_std_logic_vector(41, 8) then
								stop_cmp <= '1';
							end if;
							if frame_word_addr = words_to_read then
								icap_ce_b <= '1';
								if VERBOSE = 0 then
									frame_word_addr <= (others => '0');
									if (mem_icap_cmp = '1' and stop_cmp = '0') or difference_flag = '1' then
										if EXHAUSTIVE_INJECTION = 0 then
											next_faddr <= '1';
										else
											if bit_pos = conv_std_logic_vector(BITS_PER_FRAME-1, BITPOS_LFSR_WIDTH) then
												next_faddr <= '1';
											end if;								
										end if;
										next_bit_req <= not_first_inj;
										difference_flag <= '0';
										state <= WAIT_RANGE; --failed to inject
									else
										state <= DONE; --successfully injected
									end if;
								else
									frame_word_addr <= conv_std_logic_vector(1, 8); --sends the frame data if VERBOSE = 1
									state <= WAIT_MEM_2;
								end if;
							else
								frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
							end if;
						end if;
					
					when WAIT_MEM_2 =>
						state <= TRANSMIT_CONFIRM;
						
					when TRANSMIT_CONFIRM =>
						frame_mem_dout_reg <= confirm_mem_dout;
						frame_word_addr <= frame_word_addr + conv_std_logic_vector(1, 8);
						transmit_cnt <= (others => '0');
						state <= TRANSMIT_WORD_CONFIRM;
					
					when TRANSMIT_WORD_CONFIRM =>
						if tx_full = '0' then
							frame_mem_dout_reg <= frame_mem_dout_reg(27 downto 0) & "0000";
							transmit_cnt <= transmit_cnt + "001";
							if transmit_cnt = "111" then
								if frame_word_addr = words_to_read + conv_std_logic_vector(1, 8) then
									if difference_flag = '1' then
										if EXHAUSTIVE_INJECTION = 0 then
											next_faddr <= '1';
										else
											if bit_pos = conv_std_logic_vector(BITS_PER_FRAME-1, BITPOS_LFSR_WIDTH) then
												next_faddr <= '1';
											end if;								
										end if;
										next_bit_req <= not_first_inj;
										state <= WAIT_RANGE;
										difference_flag <= '0';
									else
										state <= DONE; --successfully injected
									end if;
									icap_ce_b <= '1';
									frame_word_addr <= (others => '0');
								else
									state <= TRANSMIT_CONFIRM;
								end if;
							end if;
						end if;
					
					when DONE => --done! injection state is toggled
						injected_int <= not injected_int;
						state <= IDLE;
						
				end case;
			end if;
		end if;
	end process;
	
  gen_real_icap : if SIMULATION = 0 generate
	  mem_icap_cmp <= '0' when icap_o = frame_mem_dout else '1';
	  icap_port: icap_virtex5
		  generic map( ICAP_WIDTH => "X32")
		  port map(   BUSY => icap_busy, --active high, only used during read
							  O => icap_o_unswapped,
							 CE => icap_ce_b, --clock enable (active low) (CS_B for SelectMAP)
							  I => icap_i_unswapped,
						 WRITE => icap_write_b, --0 = write, 1 = read (RDWR_B for SelectMAP)
							CLK => clk );
	end generate;
  
  
  gen_sim_icap : if SIMULATION = 1 generate
	  mem_icap_cmp <= '0';
	  icap_port: icap_virtex5_fake --fake ICAP for simulation purposes only
		  generic map( ICAP_WIDTH => "X32")
		  port map(   BUSY => icap_busy, --active high, only used during read
							  O => icap_o_unswapped,
							 CE => icap_ce_b, --clock enable (active low) (CS_B for SelectMAP)
							  I => icap_i_unswapped,
						 WRITE => icap_write_b, --0 = write, 1 = read (RDWR_B for SelectMAP)
							CLK => clk );
	end generate;

	frame_mem_wr <= '1' when state = READ_FRAME or state = LOWER_ICAP_CE_2 else '0';
	
	frame_mem_addr <= "00" & bit_pos(BITPOS_LFSR_WIDTH-1 downto 5) when state = LOWER_ICAP_CE_2 else frame_word_addr;
	frame_mem_din <= word_to_flip when state = LOWER_ICAP_CE_2 else icap_o;
	
	--stores the data of the frame read
	frame_memory : frame_mem
	  PORT MAP (
		 clka => clk,
		 wea(0) => frame_mem_wr,
		 addra => frame_mem_addr,
		 dina => frame_mem_din,
		 douta => frame_mem_dout
	  );
	
	--this memory is used only to transmit configuration content (iff VERBOSE = 1)
	confirm_mem_wr <= '1' when state = READ_FRAME_CONFIRM else '0';
	gen_confirm_mem : if VERBOSE = 1 generate
		confirm_mem : frame_mem
			port map (
			clka => clk,
			wea(0) => confirm_mem_wr,
			addra => frame_mem_addr,
			dina => frame_mem_din,
			douta => confirm_mem_dout
		);
	end generate;
					
	--icap input may be the write command (followed by the frame to be written) or a read command
	icap_i <= write_seq when state = WRITE_CMD or state = WRITE_FRAME else read_seq;
	--write command
	write_seq <= X"FFFFFFFF" when cmd_cnt = conv_std_logic_vector(0, 8) else --dummy
					X"000000BB" when cmd_cnt = conv_std_logic_vector(1, 8) else --bus width sync
					X"11220044" when cmd_cnt = conv_std_logic_vector(2, 8) else --width auto detect
					X"FFFFFFFF" when cmd_cnt = conv_std_logic_vector(3, 8) else --dummy
					X"AA995566" when cmd_cnt = conv_std_logic_vector(4, 8) else --sync
					X"20000000" when cmd_cnt = conv_std_logic_vector(5, 8) else --noop
					X"30008001" when cmd_cnt = conv_std_logic_vector(6, 8) else --write to CMD
					X"00000007" when cmd_cnt = conv_std_logic_vector(7, 8) else --RCRC (reset CRC)
					X"20000000" when cmd_cnt = conv_std_logic_vector(8, 8) else --noop
					X"30018001" when cmd_cnt = conv_std_logic_vector(9, 8) else --write to IDCODE register
					X"72AD6093" when cmd_cnt = conv_std_logic_vector(10, 8) else --IDCODE XC5VLX110T
					X"20000000" when cmd_cnt = conv_std_logic_vector(11, 8) else --noop
					X"3000a001" when cmd_cnt = conv_std_logic_vector(12, 8) else --write to CTL0
					X"20000001" when cmd_cnt = conv_std_logic_vector(13, 8) else --zero to GLUTMASK_B
					X"20000000" when cmd_cnt = conv_std_logic_vector(14, 8) else --noop
					X"30002001" when cmd_cnt = conv_std_logic_vector(15, 8) else --write to FAR
					faddr_reg when cmd_cnt = conv_std_logic_vector(16, 8) else --frame address to write
					X"20000000" when cmd_cnt = conv_std_logic_vector(17, 8) else --noop
					X"30008001" when cmd_cnt = conv_std_logic_vector(18, 8) else --write to CMD
					X"00000001" when cmd_cnt = conv_std_logic_vector(19, 8) else --WCFG (write configuration)
					X"20000000" when cmd_cnt = conv_std_logic_vector(20, 8) else --noop
					X"30004000" when cmd_cnt = conv_std_logic_vector(21, 8) else --write to FDRI
					X"50000052" when cmd_cnt = conv_std_logic_vector(22, 8) and critical_frame = '0' and critical_frame_1e = '0' else --type 2: 82 words
					X"500000F6" when cmd_cnt = conv_std_logic_vector(22, 8) and critical_frame = '1' else --type 2: 246 words
					X"5000011F" when cmd_cnt = conv_std_logic_vector(22, 8) and critical_frame_1e = '1' else --type 2: 287 words
					frame_mem_dout;
					--X"800000" & "00" & (frame_word_addr + conv_std_logic_vector(1, 6));
	--read command
	read_seq <= X"FFFFFFFF" when cmd_cnt = conv_std_logic_vector(0, 8) else --dummy
				X"000000BB" when cmd_cnt = conv_std_logic_vector(1, 8) else --bus width sync
				X"11220044" when cmd_cnt = conv_std_logic_vector(2, 8) else --width auto detect
				X"FFFFFFFF" when cmd_cnt = conv_std_logic_vector(3, 8) else --dummy
				X"AA995566" when cmd_cnt = conv_std_logic_vector(4, 8) else --sync
				X"20000000" when cmd_cnt = conv_std_logic_vector(5, 8) else --noop
				X"30008001" when cmd_cnt = conv_std_logic_vector(6, 8) else --write to CMD
				X"00000007" when cmd_cnt = conv_std_logic_vector(7, 8) else --RCRC (reset CRC)
				X"20000000" when cmd_cnt = conv_std_logic_vector(8, 8) else --noop
				X"20000000" when cmd_cnt = conv_std_logic_vector(9, 8) else --noop
				X"30008001" when cmd_cnt = conv_std_logic_vector(10, 8) else --write to CMD
				X"00000004" when cmd_cnt = conv_std_logic_vector(11, 8) else --RCFG (read configuration)
				X"30002001" when cmd_cnt = conv_std_logic_vector(12, 8) else --write to FAR
				faddr_reg  when cmd_cnt = conv_std_logic_vector(13, 8) else --frame address to read
				X"20000000" when cmd_cnt = conv_std_logic_vector(14, 8) else --noop
				X"20000000" when cmd_cnt = conv_std_logic_vector(15, 8) else --noop
				X"28006053" when cmd_cnt = conv_std_logic_vector(16, 8) and critical_frame = '0' and critical_frame_1e = '0' else --read 83 words from FDRO
				X"280060F7" when cmd_cnt = conv_std_logic_vector(16, 8) and critical_frame = '1' else --read 247 words from FDRO
				X"28006120" when cmd_cnt = conv_std_logic_vector(16, 8) and critical_frame_1e = '1' else --read 288 words from FDRO
				X"20000000"; --noop

  --ICAP bits have a reversed endianess, which must be corrected by the user circuit
  --Data to ICAP  
  icap_i_unswapped(0) <= icap_i(7);
  icap_i_unswapped(1) <= icap_i(6);
  icap_i_unswapped(2) <= icap_i(5);
  icap_i_unswapped(3) <= icap_i(4);
  icap_i_unswapped(4) <= icap_i(3);
  icap_i_unswapped(5) <= icap_i(2);
  icap_i_unswapped(6) <= icap_i(1);
  icap_i_unswapped(7) <= icap_i(0);

  icap_i_unswapped(8) <= icap_i(15);
  icap_i_unswapped(9) <= icap_i(14);
  icap_i_unswapped(10) <= icap_i(13);
  icap_i_unswapped(11) <= icap_i(12);
  icap_i_unswapped(12) <= icap_i(11);
  icap_i_unswapped(13) <= icap_i(10);
  icap_i_unswapped(14) <= icap_i(9);
  icap_i_unswapped(15) <= icap_i(8);

  icap_i_unswapped(16) <= icap_i(23);
  icap_i_unswapped(17) <= icap_i(22);
  icap_i_unswapped(18) <= icap_i(21);
  icap_i_unswapped(19) <= icap_i(20);
  icap_i_unswapped(20) <= icap_i(19);
  icap_i_unswapped(21) <= icap_i(18);
  icap_i_unswapped(22) <= icap_i(17);
  icap_i_unswapped(23) <= icap_i(16);

  icap_i_unswapped(24) <= icap_i(31);
  icap_i_unswapped(25) <= icap_i(30);
  icap_i_unswapped(26) <= icap_i(29);
  icap_i_unswapped(27) <= icap_i(28);
  icap_i_unswapped(28) <= icap_i(27);
  icap_i_unswapped(29) <= icap_i(26);
  icap_i_unswapped(30) <= icap_i(25);
  icap_i_unswapped(31) <= icap_i(24);

  -- Data from ICAP  
  icap_o(0) <= icap_o_unswapped(7);  
  icap_o(1) <= icap_o_unswapped(6);  
  icap_o(2) <= icap_o_unswapped(5);  
  icap_o(3) <= icap_o_unswapped(4);  
  icap_o(4) <= icap_o_unswapped(3);  
  icap_o(5) <= icap_o_unswapped(2);  
  icap_o(6) <= icap_o_unswapped(1);  
  icap_o(7) <= icap_o_unswapped(0);
  
  icap_o(8) <= icap_o_unswapped(15);  
  icap_o(9) <= icap_o_unswapped(14);  
  icap_o(10) <= icap_o_unswapped(13);  
  icap_o(11) <= icap_o_unswapped(12);  
  icap_o(12) <= icap_o_unswapped(11);  
  icap_o(13) <= icap_o_unswapped(10);  
  icap_o(14) <= icap_o_unswapped(9);  
  icap_o(15) <= icap_o_unswapped(8); 
 
  icap_o(16) <= icap_o_unswapped(23);  
  icap_o(17) <= icap_o_unswapped(22);  
  icap_o(18) <= icap_o_unswapped(21);  
  icap_o(19) <= icap_o_unswapped(20);  
  icap_o(20) <= icap_o_unswapped(19);  
  icap_o(21) <= icap_o_unswapped(18);  
  icap_o(22) <= icap_o_unswapped(17);  
  icap_o(23) <= icap_o_unswapped(16); 
 
  icap_o(24) <= icap_o_unswapped(31);  
  icap_o(25) <= icap_o_unswapped(30);  
  icap_o(26) <= icap_o_unswapped(29);  
  icap_o(27) <= icap_o_unswapped(28);  
  icap_o(28) <= icap_o_unswapped(27);  
  icap_o(29) <= icap_o_unswapped(26);  
  icap_o(30) <= icap_o_unswapped(25);  
  icap_o(31) <= icap_o_unswapped(24); 
end Behavioral;

