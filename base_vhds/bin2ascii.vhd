----------------------------------------------------------------------------------
-- Converts a 4-bit binary value to its hexadecimal ascii equivalent
-- by Gabriel Luca Nazar
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bin2ascii is
	Port ( bin	: in  STD_LOGIC_VECTOR(3 downto 0);
          ascii : out STD_LOGIC_VECTOR(7 downto 0));
end bin2ascii;

architecture Behavioral of bin2ascii is

begin
	ascii <= conv_std_logic_vector(48, 8) when bin="0000" else --0 = '0'
				conv_std_logic_vector(49, 8) when bin="0001" else --1 = '1'
				conv_std_logic_vector(50, 8) when bin="0010" else --2 = '2'
				conv_std_logic_vector(51, 8) when bin="0011" else --3 = '3'
				conv_std_logic_vector(52, 8) when bin="0100" else --4 = '4'
				conv_std_logic_vector(53, 8) when bin="0101" else --5 = '5'
				conv_std_logic_vector(54, 8) when bin="0110" else --6 = '6'
				conv_std_logic_vector(55, 8) when bin="0111" else --7 = '7'
				conv_std_logic_vector(56, 8) when bin="1000" else --8 = '8'
				conv_std_logic_vector(57, 8) when bin="1001" else --9 = '9'
				conv_std_logic_vector(65, 8) when bin="1010" else --10 = 'A'
				conv_std_logic_vector(66, 8) when bin="1011" else --11 = 'B'
				conv_std_logic_vector(67, 8) when bin="1100" else --12 = 'C'
				conv_std_logic_vector(68, 8) when bin="1101" else --13 = 'D'
				conv_std_logic_vector(69, 8) when bin="1110" else --14 = 'E'
				conv_std_logic_vector(70, 8); --15 = 'F'
end Behavioral;

