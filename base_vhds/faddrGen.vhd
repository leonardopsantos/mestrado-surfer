----------------------------------------------------------------------------------
-- Randomly chooses one frame address in the FPGA row specified by ROW_TO_INJECT
-- Functional only for XC5VLX110T devices
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.injector_pack.all;

entity faddrGen is
    Port ( clk : in  STD_LOGIC;
           next_faddr : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  valid_faddr : out STD_LOGIC;
			  critical_frame : out STD_LOGIC;
			  critical_frame_1e : out STD_LOGIC;
           faddr : out  STD_LOGIC_VECTOR (31 downto 0));
end faddrGen;

architecture Behavioral of faddrGen is

	component lfsr is
		 Generic ( LFSR_WIDTH : integer := FADDR_LFSR_WIDTH;
					  SEED : STD_LOGIC_VECTOR (FADDR_LFSR_WIDTH-1 downto 0) := "1010101010101"
		 );
		 Port ( clk : in  STD_LOGIC;
				  next_num : in  STD_LOGIC;
				  rst : in  STD_LOGIC;
				  rand_out : out  STD_LOGIC_VECTOR (LFSR_WIDTH-1 downto 0));
	end component;

	type state_faddrGen is (IDLE, WAIT_RANGE, SAMPLE_NUM, CALC_MAJ_MIN, DONE);

	signal frame_num, rand_reg, max_min_per_maj : std_logic_vector(FADDR_LFSR_WIDTH-1 downto 0);
	signal next_num, out_of_range, req_next_num : std_logic;
	signal state : state_faddrGen := IDLE;
	signal major_addr : std_logic_vector(7 downto 0);
	signal minor_addr : std_logic_vector(6 downto 0);
	signal row_addr : std_logic_vector(4 downto 0);
	
begin

	next_num <= out_of_range or req_next_num;

	req_next_num <= '1' when state = WAIT_RANGE and out_of_range = '0' else '0';
	valid_faddr <= '1' when (state = IDLE and next_faddr = '0') or state = DONE else '0';
	
	--8 unused, 3 block type, 1 top/bottom, 5 row addr, 8 major addr, 7 minor addr = 32 bits
	faddr <= X"00" & "000" & '0' & row_addr & major_addr & minor_addr;
	
	row_addr <= conv_std_logic_vector(ROW_TO_INJECT, 5);

	gen_faddr_lfsr : if EXHAUSTIVE_INJECTION = 0 generate
		out_of_range <= '1' when frame_num > conv_std_logic_vector(MAX_FADDR, FADDR_LFSR_WIDTH) else '0';
		faddr_lfsr : lfsr
			port map(
				clk => clk,
				next_num => next_num,
				rst => rst,
				rand_out => frame_num
		);
	end generate;
	
	gen_faddr_counter : if EXHAUSTIVE_INJECTION = 1 generate
		out_of_range <= '0';
		process(clk)
		begin
			if clk'event and clk = '1' then
				if rst = '1' then
					frame_num <= (others => '0');
				else
					if next_num = '1' then
						if frame_num = conv_std_logic_vector(MAX_FADDR, FADDR_LFSR_WIDTH) then
							frame_num <= (others => '0');
						else
							frame_num <= frame_num + conv_std_logic_vector(1, FADDR_LFSR_WIDTH);
						end if;
					end if;
				end if;
			end if;
		end process;
	end generate;
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			if rst = '1' then
				state <= idle;
				major_addr <= (others => '0');
				minor_addr <= (others => '0');
			else
				case state is
					when IDLE =>
						if next_faddr = '1' then
							state <= WAIT_RANGE;
							critical_frame <= '0';
							critical_frame_1e <= '0';
						end if;
						
					when WAIT_RANGE =>
						major_addr <= (others => '0');
						minor_addr <= (others => '0');
						if out_of_range = '0' then
							state <= SAMPLE_NUM;
						end if;
					
					when SAMPLE_NUM =>
						rand_reg <= frame_num;
						state <= CALC_MAJ_MIN;
						
					when CALC_MAJ_MIN =>
						if rand_reg > max_min_per_maj then
							rand_reg <= rand_reg - (max_min_per_maj + conv_std_logic_vector(1, FADDR_LFSR_WIDTH));
							major_addr <= major_addr + conv_std_logic_vector(1, 8); 
						else
							if max_min_per_maj = conv_std_logic_vector(35, FADDR_LFSR_WIDTH) then
								if rand_reg(6 downto 0) = "0011111" then
									critical_frame <= '1';
								elsif rand_reg(6 downto 0) = "0011110" then
									critical_frame_1e <= '1';
								end if;	
							end if;
							minor_addr <= rand_reg(6 downto 0);
							state <= DONE;
						end if;
						
					when DONE =>
						state <= IDLE;
						
				end case;
			end if;
		end if;
	end process;
	
	max_min_per_maj <= conv_std_logic_vector(53, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(0, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(1, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(2, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(3, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(4, 8) else
							conv_std_logic_vector(29, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(5, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(6, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(7, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(8, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(9, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(10, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(11, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(12, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(13, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(14, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(15, 8) else
							conv_std_logic_vector(29, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(16, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(17, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(18, 8) else
							conv_std_logic_vector(27, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(19, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(20, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(21, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(22, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(23, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(24, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(25, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(26, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(27, 8) else
							conv_std_logic_vector(53, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(28, 8) else
							conv_std_logic_vector(3,  FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(29, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(30, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(31, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(32, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(33, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(34, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(35, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(36, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(37, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(38, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(39, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(40, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(41, 8) else
							conv_std_logic_vector(29, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(42, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(43, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(44, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(45, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(46, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(47, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(48, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(49, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(50, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(51, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(52, 8) else
							conv_std_logic_vector(29, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(53, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(54, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(55, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(56, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(57, 8) else
							conv_std_logic_vector(53, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(58, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(59, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(60, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(61, 8) else
							conv_std_logic_vector(35, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(62, 8) else
							conv_std_logic_vector(29, FADDR_LFSR_WIDTH) when major_addr = conv_std_logic_vector(63, 8) else
							conv_std_logic_vector(31, FADDR_LFSR_WIDTH);

end Behavioral;

