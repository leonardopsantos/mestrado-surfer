library IEEE;
use IEEE.STD_LOGIC_1164.all;

package injector_pack is

	--constant MAX_FADDR : integer := 9286; --maximum frame number that maps to the top half
	--constant MIN_FADDR : integer := 2321; --minimum frame number that maps to the top 3/8
	--constant MIN_FADDR : integer := 6967; --minimum frame number that maps to the top 1/8
	
	constant MAX_FADDR : integer := 2319; --maximum frame number that maps to the third row in the top half
	--constant MIN_FADDR : integer := 4643; --minimum frame number that maps to the third row in the top half
	
	constant ROW_TO_INJECT : integer := 3;
	
	constant BITS_PER_FRAME : integer := 1312; --amount of bits in a frame
	constant BITPOS_LFSR_WIDTH : integer := 11;
	constant FADDR_LFSR_WIDTH : integer := 13;
	
	constant EV_CNT_WIDTH : integer := 26; --event counter width (try to keep it a multiple of 4)
	constant CYCLE_CNT_WIDTH : integer := 26; --execution cicle counter width

	constant EXEC_CYCLES : integer := 100000; --how many cycles should the CUT be executed
	constant FAULTS_TO_INJECT : integer := 50000; -- how many faults should be injected (sequentially, not at the same time...)
	constant INPUT_LFSR_WIDTH : integer := 100; --width of the stimuli generator
	constant CUT_OUTPUT_WIDTH : integer := OUTWIDTH;
	constant CUT_INPUT_WIDTH : integer := INWIDTH;
	
	constant CUT_ERROR_BITS_WIDTH : integer := ERRORSINTWIDTH;
	constant CUT_ERROR_BITS_PO_WIDTH : integer := ERRORSPOWIDTH;
	
	constant MEM_ADDR_SIZE : integer := 12;
	constant MEM_SIZE : integer := 2**MEM_ADDR_SIZE;
	
	constant FINAL_FADDR : std_logic_vector(23 downto 0) := X"019CA3";
	
	constant VERBOSE : integer := 0;
	constant SIMULATION : integer := 0;
	constant CNT_EV_PER_CYCLE : integer := 0; --1 to account how many events were occurred in each simulation cycle
	constant EXHAUSTIVE_INJECTION : integer := 1;
	constant NO_FADDR : integer := 1;
	constant SAFE_COMM : integer := 0;
	
end injector_pack;
