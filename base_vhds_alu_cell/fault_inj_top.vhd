----------------------------------------------------------------------------------
-- Top unit of the fault injection platform
-- Instatiate the fault injection controller and the circuit under test
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.injector_pack.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fault_inj_top is
	Port ( clk100MHz	: in  STD_LOGIC;
		rst				: in  STD_LOGIC;
		uart_tx			: out  STD_LOGIC;
		uart_rx  		: in std_logic;
		start_button	: in STD_LOGIC;
		leds			: out STD_LOGIC_VECTOR(7 downto 4)
	);
end fault_inj_top;

architecture Behavioral of fault_inj_top is

	component fault_inj_ctrl is
		port ( clk100MHz	: in  std_logic;
			clk_div_out		: out std_logic;
			rst   			: in  std_logic;
			uart_tx  		: out std_logic;
			uart_rx  		: in std_logic;
			start_button	: in std_logic;
			leds				: out std_logic_vector(7 downto 4);
			cut_inputs		: out std_logic_vector (CUT_INPUT_WIDTH-1 downto 0);
			cut_inputs2		: out std_logic_vector (CUT_INPUT_WIDTH-1 downto 0);
			cut_outputs		: in  std_logic_vector (CUT_OUTPUT_WIDTH-1 downto 0);
			errorVecPO		: in std_logic_vector(CUT_ERROR_BITS_PO_WIDTH-1 downto 0);
			errorVec			: in std_logic_vector(CUT_ERROR_BITS_WIDTH-1 downto 0)
		);
	end component;

	component regbarrier is
		 Generic ( WIDTH : integer := CUT_OUTPUT_WIDTH
		 );
		 Port ( clk : in  STD_LOGIC;
				  inVec : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
				  outVec : out  STD_LOGIC_VECTOR (WIDTH-1 downto 0)
				  );
	end component;

	component alu_cell_ft is
	  port (
		op_ctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
		op1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
		op2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
		inputs_copy : in STD_LOGIC_VECTOR ( 68 downto 0 );
		overflow : out STD_LOGIC;
		res : out STD_LOGIC_VECTOR ( 31 downto 0 );
		errorVecPO : out STD_LOGIC_VECTOR ( CUT_ERROR_BITS_PO_WIDTH-1 downto 0 );
		errorVec : out STD_LOGIC_VECTOR ( CUT_ERROR_BITS_WIDTH-1 downto 0 )
	  );
	end component;

	signal cut_inputs, cut_inputs2	: std_logic_vector(CUT_INPUT_WIDTH-1 downto 0);
	signal cut_outputs, cut_outputs_reg	: std_logic_vector(CUT_OUTPUT_WIDTH-1 downto 0);
	signal clk : std_logic;
	signal cut_errorVecPO	: std_logic_vector(CUT_ERROR_BITS_PO_WIDTH-1 downto 0);
	signal cut_errorVec		: std_logic_vector(CUT_ERROR_BITS_WIDTH-1 downto 0);

begin

	fi_ctrl : fault_inj_ctrl
	port map ( clk100MHz		=> clk100MHz,
				  clk_div_out	=> clk,
				  rst				=> rst,
				  uart_rx		=> uart_rx,
				  uart_tx		=> uart_tx,
				  start_button	=> start_button,
				  leds			=> leds,
				  cut_inputs	=> cut_inputs,
				  cut_inputs2	=> cut_inputs2,
				  cut_outputs	=> cut_outputs_reg,
				  errorVecPO	=> cut_errorVecPO,
				  errorVec		=> cut_errorVec
	);

	cut : alu_cell_ft
	port map ( op_ctrl => cut_inputs(4 downto 0),
			op1 => cut_inputs(36 downto 5),
			op2 => cut_inputs(68 downto 37),
			inputs_copy => cut_inputs2,
			overflow => cut_outputs(0),
			res => cut_outputs(32 downto 1),
				  errorVecPO	=> cut_errorVecPO,
				  errorVec		=> cut_errorVec
	);

	out_regs : regbarrier
	port map ( clk => clk,
				  inVec => cut_outputs,
				  outVec => cut_outputs_reg
	);
	

end Behavioral;
