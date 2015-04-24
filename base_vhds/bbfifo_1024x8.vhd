----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:02 11/12/2012 
-- Design Name: 
-- Module Name:    bbfifo_1024x8 - Behavioral 
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

entity bbfifo_1024x8 is
    Port (       
		data_in	: in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		reset		: in std_logic;               
		write		: in std_logic; 
		read		: in std_logic;
		full		: out std_logic;
		half_full: out std_logic;
		data_present : out std_logic;
		clk 		: in std_logic
	);
end bbfifo_1024x8;

architecture Behavioral of bbfifo_1024x8 is

	component bbfifo_16x8 is
		port (
			data_in	: in std_logic_vector(7 downto 0);
			data_out	: out std_logic_vector(7 downto 0);
			reset		: in std_logic;
			write		: in std_logic;
			read		: in std_logic;
			full		: out std_logic;
			half_full	: out std_logic;
			data_present: out std_logic;
			clk			: in std_logic
		);
	end component;

	type dat is array(64 downto 0) of std_logic_vector(7 downto 0);

	signal bb_data_in		: dat;
	signal bb_full			: std_logic_vector(63 downto 0);
	signal bb_data_present: std_logic_vector(63 downto 0);
	signal bb_read			: std_logic_vector(63 downto 0);
	signal bb_write		: std_logic_vector(63 downto 0);
	signal bb_half_full	: std_logic_vector(63 downto 0);
	
begin

	GEN_FIFO: for I in 0 to 63 generate

		bb_fifo : bbfifo_16x8
		port map (
			data_in	=> bb_data_in(I),
			data_out	=> bb_data_in(I+1),
			reset		=> reset,
			write		=> bb_write(I),
			read		=> bb_read(I),
			full		=> bb_full(I),
			half_full	=> bb_half_full(I),
			data_present=> bb_data_present(I),
			clk		  	=> clk
		);

		GEN_TOP: if I = 0 generate		
			bb_data_in(I)	<= data_in; -- first
			bb_write(I)		<= write; -- first
			full				<= bb_full(I); -- first
			bb_read(I) 		<= not bb_full(I+1);
			bb_write(I+1)	<= '1' when bb_data_present(I) = '1' and bb_full(I+1) = '0' else '0';
		end generate;
	
		GEN_MID: if ((I > 0) and (I < 63)) generate
			bb_read(I) <= not bb_full(I+1);
			bb_write(I+1) <= '1' when bb_data_present(I) = '1' and bb_full(I+1) = '0' else '0';
		end generate;

		GEN_BOT: if I = 63 generate
			bb_read(I)		<= read; -- last
			data_out			<= bb_data_in(I+1); -- last
			data_present	<= bb_data_present(I); -- last
		end generate;

	end generate;

end Behavioral;
