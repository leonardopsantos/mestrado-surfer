----------------------------------------------------------------------------------
-- Multiple input OR gate for PLA design
-- Gabriel Luca Nazar (glnazar@inf.ufrgs.br)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity multiple_input_or is
	 Generic (
			  GATE_INPUT_SIZE : integer := 12;
			  LOG_GATE_INPUT_SIZE : integer := 4);
    Port ( input_vec : in  STD_LOGIC_VECTOR(GATE_INPUT_SIZE-1 downto 0);
           output : out  STD_LOGIC);
end multiple_input_or;

architecture Behavioral of multiple_input_or is
	
	constant POWER_TWO : integer := 2**LOG_GATE_INPUT_SIZE;
	
	signal internal_values : STD_LOGIC_VECTOR(POWER_TWO-2 downto 0);
	
begin
	
	--First gate layer generation
	gen_first_layer : for i in 0 to POWER_TWO/2-1 generate
		--This layer may not be full, some inputs are bypassed to the next layer
		gen_gate_first_layer : if i < GATE_INPUT_SIZE - POWER_TWO/2 generate
			internal_values(i) <= input_vec(i*2) or input_vec(i*2+1);
		end generate;
		bypass_first_layer : if i >= GATE_INPUT_SIZE - POWER_TWO/2 generate
			internal_values(i) <= input_vec(i + (GATE_INPUT_SIZE - POWER_TWO/2));
		end generate;
	end generate;


	gen_gates_1 : for i in 2 to LOG_GATE_INPUT_SIZE generate
		gen_gates_2 : for j in POWER_TWO-2**(LOG_GATE_INPUT_SIZE+1-i) to POWER_TWO-2**(LOG_GATE_INPUT_SIZE-i)-1 generate
			internal_values(j) <= internal_values(2*j-POWER_TWO) or internal_values(2*j-POWER_TWO+1);
		end generate;
	end generate;

	output <= internal_values(POWER_TWO-2);
end Behavioral;

