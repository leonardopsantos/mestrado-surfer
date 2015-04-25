----------------------------------------------------------------------------------
-- Fault injection controller
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.math_real.all;

library work;
use work.injector_pack.all;

--library UNISIM;
--use UNISIM.VComponents.all;

entity fault_inj_ctrl is
	port ( clk100MHz	: in  std_logic;
		clk_div_out		: out std_logic;
		rst   			: in  std_logic;
		uart_tx  		: out std_logic;
		uart_rx  		: in std_logic;
		start_button	: in std_logic;
		leds				: out std_logic_vector(7 downto 4);
		cut_inputs		: out std_logic_vector (CUT_INPUT_WIDTH-1 downto 0);
		cut_inputs2		: out std_logic_vector (CUT_INPUT_WIDTH-1 downto 0);
		cut_outputs		: in  std_logic_vector (CUT_OUTPUT_WIDTH-1 downto 0);
		errorVecPO		: in std_logic_vector(CUT_ERROR_BITS_PO_WIDTH-1 downto 0);
		errorVec			: in std_logic_vector(CUT_ERROR_BITS_WIDTH-1 downto 0)
	);
end fault_inj_ctrl;

architecture Behavioral of fault_inj_ctrl is

	component seu_injector is
		port ( clk		: in  std_logic;
			rst			: in  std_logic;
			inject		: in  std_logic;
			fix			: in  std_logic;
			injected		: out std_logic;
			inj_faddr	: out std_logic_vector (23 downto 0);
			inj_bitpos  : out std_logic_vector (BITPOS_LFSR_WIDTH-1 downto 0);
			tx_write		: out std_logic;
			tx_data		: out std_logic_vector(7 downto 0);
			tx_full		: in std_logic;
			req_send_cr : out std_logic;
			leds  		: out std_logic_vector(7 downto 4)
		);
	end component;
	
	component force_duplicate is
		 Generic (
					VEC_SIZE : integer := CUT_INPUT_WIDTH
		 );
		 Port ( inputVector : in  STD_LOGIC_VECTOR (VEC_SIZE-1 downto 0);
				  outputVector : out  STD_LOGIC_VECTOR (VEC_SIZE-1 downto 0));
	end component;

	component bbfifo_1024x8 is
		port ( data_in	: in std_logic_vector(7 downto 0);
			data_out		: out std_logic_vector(7 downto 0);
			reset			: in std_logic;
			write			: in std_logic;
			read			: in std_logic;
			full			: out std_logic;
			half_full	: out std_logic;
			data_present: out std_logic;
			clk			: in std_logic
		);
	end component;
	
	component bbfifo_16x8 is
		port ( data_in	: in std_logic_vector(7 downto 0);
			data_out		: out std_logic_vector(7 downto 0);
			reset			: in std_logic;
			write			: in std_logic;
			read			: in std_logic;
			full			: out std_logic;
			half_full	: out std_logic;
			data_present: out std_logic;
			clk			: in std_logic
		);
	end component;

	component kcuart_tx is
		port ( data_in		: in std_logic_vector(7 downto 0);
			send_character	: in std_logic;
			en_16_x_baud	: in std_logic;
			serial_out		: out std_logic;
			Tx_complete		: out std_logic;
			clk   			: in std_logic
		);
	end component;
	
	component kcuart_rx is
    Port (      serial_in : in std_logic;  
                 data_out : out std_logic_vector(7 downto 0);
              data_strobe : out std_logic;
             en_16_x_baud : in std_logic;
                      clk : in std_logic);
    end component;

	component in_out_ctrl is
		port ( clk		: in  std_logic;
			rst  			: in  std_logic;
			cut_inputs	: out std_logic_vector (CUT_INPUT_WIDTH-1 downto 0);
			cut_outputs	: in  std_logic_vector (CUT_OUTPUT_WIDTH-1 downto 0);
			error_present : out std_logic;
			new_seu 		: in  std_logic;
			running 		: in  std_logic
		);
	end component;

	component comb_benches_blif_seq is
		port ( outputVector : out std_logic_vector ( CUT_OUTPUT_WIDTH-1 downto 0 );
			inputVector  : in std_logic_vector ( CUT_INPUT_WIDTH-1 downto 0 )
		);
	end component;

	COMPONENT frame_mem
		PORT ( clka	: IN std_logic;
			wea		: IN std_logic_vector(0 DOWNTO 0);
			addra		: IN std_logic_vector(7 DOWNTO 0);
			dina		: IN std_logic_vector(31 DOWNTO 0);
			douta		: OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	--arrumar para multiplos de 8 (ceil)
	constant CUT_ERROR_BITS_WIDTH_REG 		: integer := integer(ceil(real(CUT_ERROR_BITS_WIDTH)/8.0))*8;
	constant CUT_ERROR_BITS_PO_WIDTH_REG	: integer := integer(ceil(real(CUT_ERROR_BITS_PO_WIDTH)/8.0))*8;
	constant CUT_ERROR_BITS_COUNT				: integer := integer(ceil(real(CUT_ERROR_BITS_WIDTH)/8.0)) - 1;
	constant CUT_ERROR_BITS_PO_COUNT			: integer := integer(ceil(real(CUT_ERROR_BITS_PO_WIDTH)/8.0)) - 1;

	type fault_inj_ctrl_state is (WAIT_SETUP, IDLE, REQ_INJ, WAIT_INJ, WAIT_EXEC, SEND_CR, REQ_FIX, WAIT_FIX,
		SEND_RESULT, SEND_FADDR, SEND_SIGNATURE_PO, SEND_SIGNATURE, WAIT_ACK, DONE, FLUSH_CNT, SEND_CNT, DONE_LOCK);

	signal clk			: std_logic := '0';
	signal state		: fault_inj_ctrl_state;
	signal inject, fix, injected, req_send_cr, error_det_flag, error_present_flag, det_before_po : std_logic;
	signal inj_faddr, inj_faddr_reg, inj_faddr_uartdata : std_logic_vector(23 downto 0);
	signal inj_bitpos	: std_logic_vector(BITPOS_LFSR_WIDTH-1 downto 0);
	signal unstuck_reg : std_logic;	
	signal cut_inputs_sig : std_logic_vector(CUT_INPUT_WIDTH-1 downto 0);
	
	signal has_run, rst_int : std_logic;

	signal exec_cycle_cnt  : std_logic_vector(CYCLE_CNT_WIDTH-1 downto 0);
	signal injected_faults : std_logic_vector(EV_CNT_WIDTH-1 downto 0);

	--In out ctrl signals
	signal running, new_seu, error_present : std_logic;

	--CUT state registers
	signal cut_outputs_reg	: std_logic_vector(CUT_OUTPUT_WIDTH-1 downto 0);
	signal error_detected, error_detected_reg : std_logic;

	signal errorVec_reg, errorVec_uartdata : std_logic_vector(CUT_ERROR_BITS_WIDTH_REG-1 downto 0);
	signal errorVecPO_reg, errorVecPO_uartdata : std_logic_vector(CUT_ERROR_BITS_PO_WIDTH_REG-1 downto 0);
	signal new_error_flag, errorVec_check, errorVecPO_check: std_logic;

	--UART
	signal tx_data_from_injector, tx_data_ctrl, result : std_logic_vector(7 downto 0);
	signal tx_write_from_injector, tx_write_ctrl 	: std_logic;
	signal transmit_cnt : std_logic_vector(15 downto 0);

	--ev_cnt signals
	signal inc_ev_cnt	: std_logic;
	signal ev_cnt_din, ev_cnt_dout, cnt_send_reg : std_logic_vector(31 downto 0);
	signal send_counter	: std_logic_vector(1 downto 0);

  --UART signals
	signal tx_fifo_data_out, tx_data, rx_uart_data_out, rx_data_from_buffer	: std_logic_vector(7 downto 0);
	signal tx_fifo_read, tx_full, tx_half_full, tx_fifo_data_present, tx_write : std_logic;
	signal read_from_uart, rx_full, rx_half_full, rx_data_present, rx_fifo_write : std_logic;
	signal uart_16_x_baud	: std_logic;
	signal baud_counter		: std_logic_vector(7 downto 0) := (others => '0'); --generates the baud rate clock
	signal signature_cnt : std_logic_vector(7 downto 0);

begin

	--clock divider to generate 50MHz clock
	process(clk100MHz)
	begin
		if clk100MHz'event and clk100MHz = '1' then
			clk <= not clk;
		end if;
	end process;
	clk_div_out <= clk;

	duplicate_inputs : force_duplicate
		port map (
			inputVector => cut_inputs_sig,
			outputVector => cut_inputs2
		);
	cut_inputs <= cut_inputs_sig;

	--Event counter memory
	--Only used to find out how many events occur at each simulation cycle
	--Allows finding out if the amount of input vectors used is enough. Not used when CNT_EV_PER_CYCLE = 0
	gen_ev_cnt_mem : if CNT_EV_PER_CYCLE = 1 generate
		ev_cnt_per_cycle : frame_mem
		PORT MAP ( clka => clk,
			wea(0)	=> inc_ev_cnt,
			addra	=> exec_cycle_cnt(17 downto 10),
			dina	=> ev_cnt_din,
			douta	=> ev_cnt_dout
		);
	end generate;

	ev_cnt_din <= ev_cnt_dout + conv_std_logic_vector(1, 32);

	--SEU injector - performs the actual fault injection
	seu_inj_inst : seu_injector
	port map ( clk	=> clk,
		rst			=> rst_int,
		inject		=> inject,
		fix			=> fix,
		injected	=> injected,
		inj_faddr	=> inj_faddr,
		inj_bitpos	=> inj_bitpos,
		tx_write	=> tx_write_from_injector,
		tx_data		=> tx_data_from_injector,
		tx_full		=> tx_full,
		req_send_cr	=> req_send_cr,
		leds		=> leds
	);
	fix <= '1' when state = REQ_FIX else '0'; --requests fault fixing
	inject <= '1' when state = REQ_INJ else '0'; --requests fault injection

	cut_io_ctrl : in_out_ctrl
	port map ( clk => clk,
		rst			=> rst_int,
		cut_inputs	=> cut_inputs_sig,
		cut_outputs	=> cut_outputs_reg,
		error_present=> error_present,
		new_seu		=> new_seu,
		running		=> running
	);
	new_seu <= '1' when state = REQ_INJ else '0'; --informs the IO ctrl that there is a new SEU injected (deprecated..)
	running <= '1' when (state = WAIT_EXEC and unstuck_reg = '1') or
		(state = WAIT_EXEC and error_detected_reg = '0') else '0'; --the CUT is running
	--error_detected <= '0' when errorVecPO = conv_std_logic_vector(0,CUT_ERROR_BITS_PO_WIDTH) and errorVec = conv_std_logic_vector(0,CUT_ERROR_BITS_WIDTH) else '1';
	error_detected_reg <= '0' when errorVecPO_reg = conv_std_logic_vector(0,CUT_ERROR_BITS_PO_WIDTH_REG) and errorVec_reg = conv_std_logic_vector(0,CUT_ERROR_BITS_WIDTH_REG) else '1';

	cut_outputs_reg <= cut_outputs; --Registering is done outside now
	process(clk)
	begin
		if clk'event and clk = '1' then
			--Registers the CUT outputs and the error detection signal to break the combinational path
			--cut_outputs_reg		<= cut_outputs; --Registering is done outside now
			errorVec_reg(CUT_ERROR_BITS_WIDTH_REG-1 downto CUT_ERROR_BITS_WIDTH) <= (others => '0');
			errorVecPO_reg(CUT_ERROR_BITS_PO_WIDTH_REG-1 downto CUT_ERROR_BITS_PO_WIDTH) <= (others => '0');
			
			errorVec_reg(CUT_ERROR_BITS_WIDTH-1 downto 0) <= errorVec(CUT_ERROR_BITS_WIDTH-1 downto 0);
			errorVecPO_reg(CUT_ERROR_BITS_PO_WIDTH-1 downto 0) <= errorVecPO(CUT_ERROR_BITS_PO_WIDTH-1 downto 0);
			
			inj_faddr_reg			<= inj_faddr;
		end if;
	end process;

	--FSM process
	process(clk)
	begin
		if clk'event and clk = '1' then
			if rst = '1' then
				state <= IDLE;
				inc_ev_cnt <= '0';
				has_run <= '0';
			else
				case state is
					when WAIT_SETUP => --waits for 3 seconds before starting the injection
						exec_cycle_cnt <= exec_cycle_cnt + conv_std_logic_vector(1, CYCLE_CNT_WIDTH);
						if exec_cycle_cnt = conv_std_logic_vector(150000000 - SIMULATION*149999000, CYCLE_CNT_WIDTH) and has_run = '0' then
							state <= IDLE;
							has_run <= '1';
							rst_int <= '0';
						else
							rst_int <= '1';
						end if;
				
					when IDLE => --waits the button to be pressed
						injected_faults <= (others => '0');
						unstuck_reg <= '0';
						--if start_button_deb = '1' then
							state <= REQ_INJ;
						--end if;

					when REQ_INJ => --requests an injection from the SEU injector
						exec_cycle_cnt <= (others => '0');
						error_det_flag <= '0';
						error_present_flag <= '0';
						det_before_po <= '0';
						signature_cnt <= (others => '0');
						new_error_flag <= '1';
						state <= WAIT_INJ;

					when WAIT_INJ => --waits until the injection is completed
						if injected = '1' then
							state <= WAIT_EXEC;
						end if;

					when WAIT_EXEC => --waits the execution cycles
						exec_cycle_cnt <= exec_cycle_cnt + conv_std_logic_vector(1, CYCLE_CNT_WIDTH); --execution counter
						error_det_flag <= error_det_flag or error_detected_reg; --stores that an error was detected
						error_present_flag <= error_present_flag or error_present; --stores that an error is present at a PO
						if error_detected_reg = '1' and error_present = '0' and error_present_flag = '0' then
							det_before_po <= '1'; --the error was detected before ever manifesting at a PO
						end if;
						if CNT_EV_PER_CYCLE = 1 then --controls if its time to find out if an event occurred as store it in the event memory
							--done every 1024 cycles
							if exec_cycle_cnt(9 downto 0) = conv_std_logic_vector(0, 10) and (error_det_flag = '1' or error_present_flag = '1') then
								inc_ev_cnt <= '1';
							else
								inc_ev_cnt <= '0';
							end if;
						end if;
						
						unstuck_reg <= '0';
						
						--if execution is over, goes to next state
						if exec_cycle_cnt = conv_std_logic_vector(EXEC_CYCLES-1, CYCLE_CNT_WIDTH) then
							state <= REQ_FIX;
						elsif signature_cnt = conv_std_logic_vector(20, 8) then
							state <= REQ_FIX;
						--if something interesting happened, send it
						elsif error_detected_reg = '1' then
						-- prepare UART data
							errorVec_uartdata		<= errorVec_reg;
							errorVecPO_uartdata	<= errorVecPO_reg;
							inj_faddr_uartdata	<= inj_faddr_reg;
							signature_cnt			<= signature_cnt + "00000001";
							state						<= SEND_RESULT;
						end if;

					when REQ_FIX => --request fault removal
						inc_ev_cnt <= '0';
						injected_faults <= injected_faults + conv_std_logic_vector(1, EV_CNT_WIDTH); --accounts the injected fault
						exec_cycle_cnt <= (others => '0');
                        state <= WAIT_FIX;

					when SEND_RESULT => --waits until the TX fifo has a slot for the result byte
						if tx_full = '0' then
							-- prepare UART data
							transmit_cnt <= (others => '0');
							new_error_flag <= '0';
							state <= SEND_FADDR;
						end if;

					when SEND_FADDR => --sends frame address
						if tx_full = '0' then
							inj_faddr_uartdata(23 downto 0) <= inj_faddr_uartdata(15 downto 0)&inj_faddr_uartdata(23 downto 16);
							
							if transmit_cnt = "0000000000000010" then
								state <= SEND_SIGNATURE_PO;
								transmit_cnt <= (others => '0');
							else
								transmit_cnt <= transmit_cnt + "0000000000000001";
							end if;
						end if;

					when SEND_SIGNATURE_PO => --signature of primary outputs
						if tx_full = '0' then
							if CUT_ERROR_BITS_PO_WIDTH_REG > 8 then
								errorVecPO_uartdata(CUT_ERROR_BITS_PO_WIDTH_REG-1 downto 0) <= errorVecPO_uartdata(CUT_ERROR_BITS_PO_WIDTH_REG-9 downto 0) & errorVecPO_uartdata(CUT_ERROR_BITS_PO_WIDTH_REG-1 downto CUT_ERROR_BITS_PO_WIDTH_REG-8);
								if transmit_cnt = conv_std_logic_vector(CUT_ERROR_BITS_PO_COUNT,16) then
									state <= SEND_SIGNATURE;
									transmit_cnt <= (others => '0');
								else
									transmit_cnt <= transmit_cnt + "0000000000000001";
								end if;
							else
								state <= SEND_SIGNATURE;
								transmit_cnt <= (others => '0');
							end if;
						end if;

					when SEND_SIGNATURE => 
						if tx_full = '0' then --waits until the TX fifo has a slot for the result byte
							errorVec_uartdata(CUT_ERROR_BITS_WIDTH_REG-1 downto 0) <= errorVec_uartdata(CUT_ERROR_BITS_WIDTH_REG-9 downto 0) & errorVec_uartdata(CUT_ERROR_BITS_WIDTH_REG-1 downto CUT_ERROR_BITS_WIDTH_REG-8);
							if transmit_cnt = conv_std_logic_vector(CUT_ERROR_BITS_COUNT,16) then
								if SAFE_COMM = 1 then
									state <= WAIT_ACK;
								else
									unstuck_reg <= '1';
									state <= WAIT_EXEC;
								end if;
							else
								transmit_cnt <= transmit_cnt + "0000000000000001";
							end if;
						end if;

					when WAIT_ACK =>
						if rx_data_present = '1' then
							if rx_data_from_buffer = conv_std_logic_vector(65, 8) then --Ack, returns to execution
								unstuck_reg <= '1';
								state <= WAIT_EXEC;
							elsif rx_data_from_buffer = conv_std_logic_vector(78, 8) then --Nack, retransmits the signature
								state <= SEND_RESULT;
							end if;
						end if;

					when WAIT_FIX => --waits until the fault is fixed
						if injected = '0' then
							if NO_FADDR = 1 then --if the frame address is not to be transmitted, it's time to find out if execution is over
								if EXHAUSTIVE_INJECTION = 1 then --if we're performing exhaustive injection
									if inj_faddr = FINAL_FADDR and inj_bitpos = conv_std_logic_vector(BITS_PER_FRAME-1, BITPOS_LFSR_WIDTH) then
										state <= DONE; --final frame address reached, execution is over
									else
										state <= REQ_INJ; --final frame address not yet reached, inject next fault
									end if;
								else
									if injected_faults = conv_std_logic_vector(FAULTS_TO_INJECT, EV_CNT_WIDTH) then
										state <= DONE; --injected the requested amount of faults, execution is over
									else
										state <= REQ_INJ; --more faults have to be injected
									end if;
								end if;
							else
								state <= SEND_CR; --sends a carriage return
							end if;
						end if;

					when SEND_CR =>
						if tx_full = '0' then --TX fifo is not full, CR is being sent. find out if execution is over
							if EXHAUSTIVE_INJECTION = 1 then --if we're performing exhaustive injection
								if inj_faddr = FINAL_FADDR and inj_bitpos = conv_std_logic_vector(BITS_PER_FRAME-1, BITPOS_LFSR_WIDTH) then
									state <= DONE;  --final frame address reached, execution is over
								else
									state <= REQ_INJ; --final frame address not yet reached, inject next fault
								end if;
							else
								if injected_faults = conv_std_logic_vector(FAULTS_TO_INJECT, EV_CNT_WIDTH) then
									state <= DONE; --injected the requested amount of faults, execution is over
								else
									state <= REQ_INJ; --more faults have to be injected
								end if;
							end if;
						end if;

					when DONE => --DONE! awaits until the button is released (important for VERY short injection times)
						--if start_button_deb = '0' then
							if CNT_EV_PER_CYCLE = 1 then
								state <= FLUSH_CNT; --time to flush the event per cycle counters!
							else
								state <= DONE_LOCK;
							end if;
						--end if;

					when FLUSH_CNT => --flushes the event per cycle counters in the memory
						cnt_send_reg <= ev_cnt_dout; --counter to be sent
						send_counter <= "00"; --sent bytes counter
						--adds 1024 to the cycle counter, to increase the address by of the ev_cnt_per_cycle memory
						exec_cycle_cnt <= exec_cycle_cnt + conv_std_logic_vector(1024, CYCLE_CNT_WIDTH);
						if exec_cycle_cnt(17 downto 10) = conv_std_logic_vector(200, 8) then --sent all positions of the memory?
							state <= IDLE;
						else
							state <= SEND_CNT;
						end if;

					--sends one position
					when SEND_CNT =>
						if tx_full = '0' then --if the TX fifo is not full, a byte is being written at this cycle
							cnt_send_reg <= cnt_send_reg(23 downto 0) & conv_std_logic_vector(0, 8); --shifts the registers
							send_counter <= send_counter + "01"; --counts the transmission
							if send_counter = "11" then --sent all bytes?
								state <= DONE_LOCK;
							end if;
						end if;
					
					when DONE_LOCK =>
						state <= DONE_LOCK;
						
				end case;
			end if;
		end if;
	end process;

	--geraï¿½ï¿½o do baud rate clock
	process(clk)
	begin
		if clk'event and clk = '1' then
			if uart_16_x_baud = '1' then
				baud_counter <= (others => '0');
			else
				baud_counter <= baud_counter + conv_std_logic_vector(1, 8);
			end if;
		end if;
	end process;
	--50MHz / (16*27) = 115740.7 ~= 115200
	--uart_16_x_baud <= '1' when (baud_counter = conv_std_logic_vector(26, 5)) else '0';
	uart_16_x_baud <= '1' when (baud_counter = conv_std_logic_vector(26, 8)) else '0';

  --TX block, consumes bytes from the fifo						  
	uart_transmit : kcuart_tx
	port map ( data_in	=> tx_fifo_data_out,
		send_character	=> tx_fifo_data_present,
		en_16_x_baud	=> uart_16_x_baud,
		serial_out		=> uart_tx, --serial TX
		Tx_complete		=> tx_fifo_read,
		clk				=> clk
	);

  --The result of an injected fault on circuit behavior
	result <=conv_std_logic_vector(78, 8) when error_present_flag = '0' and error_det_flag = '0' else --N - no event
				conv_std_logic_vector(79, 8) when error_present_flag = '0' and error_det_flag = '1' else --O - only detected
				conv_std_logic_vector(85, 8) when error_present_flag = '1' and error_det_flag = '0' else --U - undetected
				conv_std_logic_vector(88, 8) when det_before_po = '0' 								 		else --X - detected and present, but didn't detect early
				conv_std_logic_vector(77, 8);																				  --M - manisfested before detection

  --TX data from the control unit:
	tx_data_ctrl <=	new_error_flag&result(6 downto 0)	when state = SEND_RESULT			else --fault injection result
							inj_faddr_uartdata(23 downto 16)		when state = SEND_FADDR				else -- frame address
							errorVecPO_uartdata(CUT_ERROR_BITS_PO_WIDTH_REG-1 downto CUT_ERROR_BITS_PO_WIDTH_REG-8) when state = SEND_SIGNATURE_PO else --fault signature
							errorVec_uartdata(CUT_ERROR_BITS_WIDTH_REG-1 downto CUT_ERROR_BITS_WIDTH_REG-8) when state = SEND_SIGNATURE else --fault signature
							cnt_send_reg(31 downto 24)				when state = SEND_CNT				else --the event counter per cycle
							conv_std_logic_vector(13, 8); 														  --a carriage return

--	tx_data_ctrl <=	conv_std_logic_vector(78, 8)			when state = SEND_RESULT			else --fault injection result
--							transmit_cnt								when state = SEND_FADDR				else -- frame address
--							"10100101"									when state = SEND_SIGNATURE_PO	else --fault signature
--							transmit_cnt								when state = SEND_SIGNATURE		else --fault signature
--							cnt_send_reg(31 downto 24)				when state = SEND_CNT				else --the event counter per cycle
--							conv_std_logic_vector(13, 8); 														  --a carriage return



	tx_write_ctrl <= '1' when (state = SEND_CR or state = SEND_RESULT or state = SEND_CNT or state = SEND_FADDR or state = SEND_SIGNATURE_PO or state = SEND_SIGNATURE) 
		and tx_full = '0' else '0'; --tx_write from the control unit

  --the tx_data may come from the control FSM or the seu injector
	tx_data <= tx_data_ctrl when state = SEND_CR or state = SEND_RESULT or state = SEND_CNT or state = SEND_FADDR or state=SEND_SIGNATURE_PO or state = SEND_SIGNATURE or req_send_cr = '1' 
		else tx_data_from_injector;
  --the tx_write may also come from the FSM or the seu injector
	tx_write <= tx_write_ctrl when state = SEND_CR or state = SEND_RESULT or state = SEND_FADDR or state=SEND_SIGNATURE_PO or state = SEND_SIGNATURE or state = SEND_CNT else tx_write_from_injector;

	gen_real_tx : if SIMULATION = 0 generate
		transmit_fifo : bbfifo_1024x8
		port map ( data_in => tx_data, --data to be transmitted
			data_out		=> tx_fifo_data_out,
			reset			=> '0',
			write			=> tx_write, --writes a byte to the fifo
			read		 	=> tx_fifo_read,
			full		 	=> tx_full, --the fifo is full
			half_full	=> tx_half_full,
			data_present=> tx_fifo_data_present,
			clk		  	=> clk
		);
	end generate;

	--the TX fifo never gets full during a simulation
	gen_sim_tx : if SIMULATION = 1 generate
		tx_full <= '0';
	end generate;
	
	gen_uart_rx : if SAFE_COMM = 1 generate
	  read_from_uart <= '1' when state = WAIT_ACK and rx_data_present = '1' else '0';
		
	  uart_receive: kcuart_rx
	  port map (     serial_in => uart_rx, --entrada de dados serial
							data_out => rx_uart_data_out,
						data_strobe => rx_fifo_write,
					  en_16_x_baud => uart_16_x_baud,
								  clk => clk );

	  receive_fifo: bbfifo_16x8 
	  port map (       data_in => rx_uart_data_out,
							data_out => rx_data_from_buffer, --saída de dados
								reset => '0',             
								write => rx_fifo_write,
								 read => read_from_uart, --lê um dado da fifo de recepção
								 full => rx_full,
						  half_full => rx_half_full,
					  data_present => rx_data_present, --tem dados na fifo de rx
								  clk => clk);
	end generate;

end Behavioral;
