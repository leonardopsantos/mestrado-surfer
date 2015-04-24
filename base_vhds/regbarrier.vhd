----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:06:05 11/06/2012 
-- Design Name: 
-- Module Name:    regbarrier - Behavioral 
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

entity regbarrier is
	 Generic ( WIDTH : integer
	 );
    Port ( clk : in  STD_LOGIC;
           inVec : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           outVec : out  STD_LOGIC_VECTOR (WIDTH-1 downto 0)
			  );
end regbarrier;

architecture Behavioral of regbarrier is

	signal regs : std_logic_vector(WIDTH-1 downto 0) := (others => '0');

begin

	process(clk)
	begin
		if clk'event and clk = '1' then
			regs <= inVec;
		end if;
	end process;
	
	outVec <= regs;

end Behavioral;

