----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:19:33 04/24/2012 
-- Design Name: 
-- Module Name:    icap_virtex5_fake - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity icap_virtex5_fake is
	 generic(
			ICAP_WIDTH : string
    );
    Port ( BUSY : out  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (31 downto 0);
           CE : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (31 downto 0);
           WRITE : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end icap_virtex5_fake;

architecture Behavioral of icap_virtex5_fake is

begin

	BUSY <= '0';
	O <= X"00000000";

end Behavioral;

