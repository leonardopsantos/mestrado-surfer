
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity force_duplicate is
	 Generic (
				VEC_SIZE : integer
	 );
    Port ( inputVector : in  STD_LOGIC_VECTOR (VEC_SIZE-1 downto 0);
           outputVector : out  STD_LOGIC_VECTOR (VEC_SIZE-1 downto 0));
end force_duplicate;

architecture Behavioral of force_duplicate is
	signal zero : std_logic;
begin

	zero <= '0';
	
	gen_bypass_luts : for i in 0 to VEC_SIZE-1 generate
		bypass_lut : LUT2
			 generic map (
				INIT => X"A"
			 )
			 port map (
				I0 => inputVector(i),
				I1 => zero,
				O => outputVector(i)
			 );
	end generate;


end Behavioral;

