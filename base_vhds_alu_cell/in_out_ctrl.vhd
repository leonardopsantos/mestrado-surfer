----------------------------------------------------------------------------------
-- Input/output control module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.injector_pack.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity in_out_ctrl is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           cut_inputs : out  STD_LOGIC_VECTOR (CUT_INPUT_WIDTH-1 downto 0);
           cut_outputs : in  STD_LOGIC_VECTOR (CUT_OUTPUT_WIDTH-1 downto 0);
           error_present : out  STD_LOGIC;
           new_seu : in  STD_LOGIC;
			  running : in STD_LOGIC);
end in_out_ctrl;

architecture Behavioral of in_out_ctrl is
	
	component alu_cell is
	  port (
		overflow : out STD_LOGIC; 
		res : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
		op_ctrl : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
		op1 : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
		op2 : in STD_LOGIC_VECTOR ( 31 downto 0 ) 
	  );
	end component;
	
	component lfsr is
	 Generic ( LFSR_WIDTH : integer := INPUT_LFSR_WIDTH;
				  SEED : STD_LOGIC_VECTOR(INPUT_LFSR_WIDTH-1 downto 0)
	 );
	 Port ( clk : in  STD_LOGIC;
           next_num : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           rand_out : out  STD_LOGIC_VECTOR (LFSR_WIDTH-1 downto 0));
	end component;
	
	signal error_present_seu : std_logic;
	signal cut_stimuli : std_logic_vector(CUT_INPUT_WIDTH-1 downto 0);
	signal golden_outputs, golden_outputs_reg : std_logic_vector(CUT_OUTPUT_WIDTH-1 downto 0);
	signal last_lfsr_stimuli : std_logic_vector(INPUT_LFSR_WIDTH-1 downto 0);
	
begin

	cut_inputs <= cut_stimuli;
	--CUT x Golden outputs comparator
	error_present <= '1' when cut_outputs /= golden_outputs_reg else '0';

	--golden copy to generate the correct outputs
	golden_copy : alu_cell
		port map (
			op_ctrl => cut_stimuli(4 downto 0),
			op1 => cut_stimuli(36 downto 5),
			op2 => cut_stimuli(68 downto 37),
			overflow => golden_outputs(0),
			res => golden_outputs(32 downto 1)
	);
	
	--the golden copy outputs are also registered, so that they match those from the CUT
	process(clk)
	begin
		if clk'event and clk = '1' then
			golden_outputs_reg <= golden_outputs;
		end if;
	end process;

--	process(clk)
--	begin
--		if clk'event and clk = '1' then
--			if new_seu = '1' then
--				error_present_seu <= '0';
--			else
--				if running = '1' and golden_outputs /= cut_outputs then
--					error_present_seu <= '1';
--				end if;
--			end if;
--		end if;
--	end process;
	
	--generates large LFSR for CUTs with many inputs
	--gen_lfsr_large_input : if CUT_INPUT_WIDTH > 16 generate
		gen_lfsrs : for i in 0 to CUT_INPUT_WIDTH / INPUT_LFSR_WIDTH generate
			gen_full_used : if (i+1)*INPUT_LFSR_WIDTH <= CUT_INPUT_WIDTH generate
				lfsr_inputs_full : lfsr
					generic map (
						SEED => conv_std_logic_vector(i+1, INPUT_LFSR_WIDTH)
				)
					port map (
						clk => clk,
						next_num => running,
						rst => rst,
						rand_out => cut_stimuli((i+1)*INPUT_LFSR_WIDTH - 1 downto INPUT_LFSR_WIDTH*i)
				);
			end generate;
			gen_partially_used : if (i+1)*INPUT_LFSR_WIDTH > CUT_INPUT_WIDTH generate
				lfsr_inputs_partial : lfsr
					generic map (
						SEED => conv_std_logic_vector(i+1, INPUT_LFSR_WIDTH)
				)
					port map (
						clk => clk,
						next_num => running,
						rst => rst,
						rand_out => last_lfsr_stimuli
				);
				cut_stimuli(CUT_INPUT_WIDTH-1 downto INPUT_LFSR_WIDTH*i) <= last_lfsr_stimuli(CUT_INPUT_WIDTH-(INPUT_LFSR_WIDTH*i+1) downto 0);
			end generate;
		end generate;
	--end generate;
	
	--cuts with few inputs allow exhaustive stimulation
--	gen_counter_small_input : if CUT_INPUT_WIDTH <= 16 generate
--		process(clk)
--		begin
--			if clk'event and clk='1' then
--				if rst = '1' then
--					cut_stimuli <= (others => '0');
--				elsif running = '1' then
--					cut_stimuli <= cut_stimuli + conv_std_logic_vector(1, CUT_INPUT_WIDTH);
--				end if;
--			end if;
--		end process;
--	end generate;

end Behavioral;

