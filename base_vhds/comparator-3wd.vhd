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
	
	gen_cmp_luts : for i in 0 to IN_WIDTH/3-1 generate
		cmp_lut : LUT6
			 generic map (
				INIT => X"6FF6FFFFFFFF6FF6"
			 )
			 port map (
				I0 => inVecA(i*3),
				I1 => inVecB(i*3),
				I2 => inVecA(i*3+1),
				I3 => inVecB(i*3+1),
				I4 => inVecA(i*3+2),
				I5 => inVecB(i*3+2),
				O => errors(i)
			 );
	end generate;
	
	gen_mod_2 : if IN_WIDTH mod 3 = 2 generate
		cmp_lut_mod_2 : LUT4
			 generic map (
				INIT => X"6FF6"
			 )
			 port map (
				I0 => inVecA(IN_WIDTH-2),
				I1 => inVecB(IN_WIDTH-2),
				I2 => inVecA(IN_WIDTH-1),
				I3 => inVecB(IN_WIDTH-1),
				O => errors(OUT_WIDTH-1)
			 );
	end generate;
	
	gen_mod_1 : if IN_WIDTH mod 3 = 1 generate
		cmp_lut_mod_1 : LUT2
			 generic map (
				INIT => X"6"
			 )
			 port map (
				I0 => inVecA(IN_WIDTH-1),
				I1 => inVecB(IN_WIDTH-1),
				O => errors(OUT_WIDTH-1)
			 );
	end generate;
	
end Behavioral;

