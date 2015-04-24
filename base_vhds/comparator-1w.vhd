----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:02 11/06/2012 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity comparator is
	 Generic ( IN_WIDTH : integer;
				  OUT_WIDTH : integer
	 );
    Port ( inVecA : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);
			  inVecB : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);
           errors : out  STD_LOGIC_VECTOR (OUT_WIDTH-1 downto 0));
end comparator;

architecture Behavioral of comparator is

begin

	gen_cmp_luts : for i in 0 to IN_WIDTH-1 generate
		cmp_lut_mod_1 : LUT2
			 generic map (
				INIT => X"6"
			 )
			 port map (
				I0 => inVecA(i),
				I1 => inVecB(i),
				O => errors(i)
			 );
	end generate;

end Behavioral;

