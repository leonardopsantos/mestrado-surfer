----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:04 08/09/2011 
-- Design Name: 
-- Module Name:    lfsr - Behavioral 
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

entity lfsr is
	 Generic ( LFSR_WIDTH : integer;
				  SEED : STD_LOGIC_VECTOR
	 );
	 Port ( clk : in  STD_LOGIC;
           next_num : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           rand_out : out  STD_LOGIC_VECTOR (LFSR_WIDTH-1 downto 0));
end lfsr;

architecture Behavioral of lfsr is
	signal shift_in_bit : STD_LOGIC;
	signal rand_reg : STD_LOGIC_VECTOR(LFSR_WIDTH-1 downto 0);
begin

	gen_poly_100 : if LFSR_WIDTH = 100 generate --100,63
		shift_in_bit <= rand_reg(99) xnor rand_reg(62);
	end generate;
	
	gen_poly_14 : if LFSR_WIDTH = 14 generate --14,5,3,1 (with xors: never in "all 0" state, used for framenum)
		shift_in_bit <= rand_reg(13) xor rand_reg(4) xor rand_reg(2) xor rand_reg(0);
	end generate;
	
	gen_poly_13 : if LFSR_WIDTH = 13 generate --13,4,3,1
		shift_in_bit <= rand_reg(12) xnor rand_reg(3) xnor rand_reg(2) xnor rand_reg(0);
	end generate;
	
	gen_poly_12 : if LFSR_WIDTH = 12 generate --12,6,4,1 (with xnors: never in "all 1" state)
		shift_in_bit <= rand_reg(11) xnor rand_reg(5) xnor rand_reg(3) xnor rand_reg(0);
	end generate;
	
	gen_poly_11 : if LFSR_WIDTH = 11 generate --11,9 (with xnors: never in "all 1" state, used for bitpos)
		shift_in_bit <= rand_reg(10) xnor rand_reg(8);
	end generate;
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			if rst = '1' then
				rand_reg <= seed;
			elsif next_num = '1' then
				rand_reg <= rand_reg(LFSR_WIDTH-2 downto 0) & shift_in_bit;
			end if;
		end if;
	end process;
	
	rand_out <= rand_reg;

end Behavioral;

