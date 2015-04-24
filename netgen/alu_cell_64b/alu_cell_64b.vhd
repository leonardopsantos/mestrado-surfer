--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: alu_cell_synthesis.vhd
-- /___/   /\     Timestamp: Mon Nov 05 17:08:50 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm alu_cell -w -dir netgen/synthesis -ofmt vhdl -sim alu_cell.ngc alu_cell_synthesis.vhd 
-- Device	: xc5vlx110t-1-ff1136
-- Input file	: alu_cell.ngc
-- Output file	: D:\ISE Projects\alu_behavioral\netgen\synthesis\alu_cell_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: alu_cell
-- Xilinx	: C:\Xilinx\13.2\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity alu_cell is
  port (
    overflow : out STD_LOGIC; 
    res : out STD_LOGIC_VECTOR ( 63 downto 0 ); 
    op_ctrl : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    op1 : in STD_LOGIC_VECTOR ( 63 downto 0 ); 
    op2 : in STD_LOGIC_VECTOR ( 63 downto 0 ) 
  );
end alu_cell;

architecture Structure of alu_cell is
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N200 : STD_LOGIC; 
  signal N204 : STD_LOGIC; 
  signal N210 : STD_LOGIC; 
  signal N220 : STD_LOGIC; 
  signal N232 : STD_LOGIC; 
  signal N234 : STD_LOGIC; 
  signal N236 : STD_LOGIC; 
  signal N238 : STD_LOGIC; 
  signal N240 : STD_LOGIC; 
  signal N242 : STD_LOGIC; 
  signal N244 : STD_LOGIC; 
  signal N246 : STD_LOGIC; 
  signal N248 : STD_LOGIC; 
  signal N250 : STD_LOGIC; 
  signal N252 : STD_LOGIC; 
  signal N254 : STD_LOGIC; 
  signal N256 : STD_LOGIC; 
  signal N257 : STD_LOGIC; 
  signal N258 : STD_LOGIC; 
  signal N259 : STD_LOGIC; 
  signal N260 : STD_LOGIC; 
  signal N261 : STD_LOGIC; 
  signal N262 : STD_LOGIC; 
  signal N263 : STD_LOGIC; 
  signal N264 : STD_LOGIC; 
  signal N265 : STD_LOGIC; 
  signal N266 : STD_LOGIC; 
  signal N267 : STD_LOGIC; 
  signal N268 : STD_LOGIC; 
  signal N269 : STD_LOGIC; 
  signal N270 : STD_LOGIC; 
  signal N271 : STD_LOGIC; 
  signal N272 : STD_LOGIC; 
  signal N273 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal comp_op2 : STD_LOGIC; 
  signal inst_shifter_N01 : STD_LOGIC; 
  signal inst_shifter_N10 : STD_LOGIC; 
  signal inst_shifter_buf_1_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_12_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_13_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_14_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_15_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_16_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_1_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_20_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_21_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_22_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_23_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_24_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_25_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_26_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_27_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_28_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_29_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_2_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_32_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_33_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_34_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_35_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_36_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_37_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_38_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_39_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_40_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_41_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_42_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_43_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_44_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_45_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_46_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_47_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_48_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_49_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_50_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_51_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_52_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_53_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_54_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_55_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_56_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_57_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_58_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_59_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_5_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_60_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_61_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_62_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_63_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_12_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_13_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_14_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_15_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_16_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_20_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_21_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_22_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_23_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_24_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_25_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_26_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_27_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_28_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_29_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_2_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_32_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_33_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_34_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_35_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_36_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_37_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_38_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_39_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_40_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_41_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_42_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_43_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_44_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_45_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_46_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_47_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_48_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_49_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_50_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_51_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_52_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_53_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_54_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_55_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_56_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_57_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_58_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_59_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_5_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_60_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_61_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_62_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_63_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_0_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_12_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_13_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_14_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_15_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_16_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_20_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_21_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_22_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_23_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_24_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_25_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_26_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_27_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_28_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_29_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_2_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_32_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_33_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_34_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_35_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_36_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_37_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_38_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_39_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_40_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_41_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_42_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_43_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_44_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_45_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_46_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_47_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_48_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_49_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_50_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_51_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_52_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_53_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_54_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_55_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_56_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_57_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_58_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_59_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_5_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_60_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_61_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_62_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_63_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_12_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_13_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_14_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_15_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_16_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_20_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_21_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_22_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_23_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_24_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_25_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_26_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_27_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_28_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_29_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_32_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_33_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_34_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_35_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_36_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_37_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_38_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_39_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_40_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_41_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_42_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_43_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_44_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_45_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_46_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_47_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_48_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_49_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_50_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_51_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_52_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_53_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_54_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_55_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_56_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_57_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_58_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_59_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_60_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_61_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_62_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_63_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_0_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_12_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_13_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_14_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_15_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_16_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_1_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_20_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_21_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_22_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_23_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_24_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_25_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_26_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_27_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_28_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_29_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_2_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_32_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_33_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_34_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_35_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_36_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_37_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_38_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_39_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_40_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_41_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_42_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_43_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_44_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_45_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_46_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_47_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_48_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_49_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_50_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_51_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_52_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_53_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_54_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_55_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_56_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_57_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_58_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_59_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_5_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_60_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_61_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_62_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_63_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_mux0000_12_1_486 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_9_1_488 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_0_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_0_11_490 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_1_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_1_11_492 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_2_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_2_11_494 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_3_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_3_11_496 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_5_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_5_11_498 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_6_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_6_11_500 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_7_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_7_11_502 : STD_LOGIC; 
  signal nul : STD_LOGIC; 
  signal res_0_1_661 : STD_LOGIC; 
  signal res_0_130_662 : STD_LOGIC; 
  signal res_0_184 : STD_LOGIC; 
  signal res_0_1841_664 : STD_LOGIC; 
  signal res_0_1842_665 : STD_LOGIC; 
  signal res_0_294 : STD_LOGIC; 
  signal res_0_2941_667 : STD_LOGIC; 
  signal res_0_2942_668 : STD_LOGIC; 
  signal res_0_325 : STD_LOGIC; 
  signal res_0_43_670 : STD_LOGIC; 
  signal res_10_57_672 : STD_LOGIC; 
  signal res_10_72_673 : STD_LOGIC; 
  signal res_10_89_674 : STD_LOGIC; 
  signal res_11_41_676 : STD_LOGIC; 
  signal res_11_63_677 : STD_LOGIC; 
  signal res_11_87_678 : STD_LOGIC; 
  signal res_12_41_680 : STD_LOGIC; 
  signal res_12_63_681 : STD_LOGIC; 
  signal res_12_87_682 : STD_LOGIC; 
  signal res_13_41_684 : STD_LOGIC; 
  signal res_13_63_685 : STD_LOGIC; 
  signal res_13_87_686 : STD_LOGIC; 
  signal res_14_41_688 : STD_LOGIC; 
  signal res_14_63_689 : STD_LOGIC; 
  signal res_14_87_690 : STD_LOGIC; 
  signal res_15_41_692 : STD_LOGIC; 
  signal res_15_63_693 : STD_LOGIC; 
  signal res_15_87_694 : STD_LOGIC; 
  signal res_16_41_696 : STD_LOGIC; 
  signal res_16_63_697 : STD_LOGIC; 
  signal res_16_87_698 : STD_LOGIC; 
  signal res_17_57_700 : STD_LOGIC; 
  signal res_17_86 : STD_LOGIC; 
  signal res_17_861_702 : STD_LOGIC; 
  signal res_17_862_703 : STD_LOGIC; 
  signal res_18_57_705 : STD_LOGIC; 
  signal res_18_86 : STD_LOGIC; 
  signal res_18_861_707 : STD_LOGIC; 
  signal res_18_862_708 : STD_LOGIC; 
  signal res_19_57_710 : STD_LOGIC; 
  signal res_19_86 : STD_LOGIC; 
  signal res_19_861_712 : STD_LOGIC; 
  signal res_19_862_713 : STD_LOGIC; 
  signal res_1_57_715 : STD_LOGIC; 
  signal res_1_72_716 : STD_LOGIC; 
  signal res_1_89_717 : STD_LOGIC; 
  signal res_20_111 : STD_LOGIC; 
  signal res_20_1111_720 : STD_LOGIC; 
  signal res_20_74 : STD_LOGIC; 
  signal res_20_741_722 : STD_LOGIC; 
  signal res_20_742_723 : STD_LOGIC; 
  signal res_21_57_725 : STD_LOGIC; 
  signal res_21_86 : STD_LOGIC; 
  signal res_21_861_727 : STD_LOGIC; 
  signal res_21_862_728 : STD_LOGIC; 
  signal res_22_57_730 : STD_LOGIC; 
  signal res_22_86 : STD_LOGIC; 
  signal res_22_861_732 : STD_LOGIC; 
  signal res_22_862_733 : STD_LOGIC; 
  signal res_23_57_735 : STD_LOGIC; 
  signal res_23_86 : STD_LOGIC; 
  signal res_23_861_737 : STD_LOGIC; 
  signal res_23_862_738 : STD_LOGIC; 
  signal res_24_111 : STD_LOGIC; 
  signal res_24_1111_741 : STD_LOGIC; 
  signal res_24_74 : STD_LOGIC; 
  signal res_24_741_743 : STD_LOGIC; 
  signal res_24_742_744 : STD_LOGIC; 
  signal res_25_49_746 : STD_LOGIC; 
  signal res_25_62_747 : STD_LOGIC; 
  signal res_25_77_748 : STD_LOGIC; 
  signal res_26_57_750 : STD_LOGIC; 
  signal res_26_86 : STD_LOGIC; 
  signal res_26_861_752 : STD_LOGIC; 
  signal res_26_862_753 : STD_LOGIC; 
  signal res_27_57_755 : STD_LOGIC; 
  signal res_27_86 : STD_LOGIC; 
  signal res_27_861_757 : STD_LOGIC; 
  signal res_27_862_758 : STD_LOGIC; 
  signal res_28_57_760 : STD_LOGIC; 
  signal res_28_86 : STD_LOGIC; 
  signal res_28_861_762 : STD_LOGIC; 
  signal res_28_862_763 : STD_LOGIC; 
  signal res_29_57_765 : STD_LOGIC; 
  signal res_29_86 : STD_LOGIC; 
  signal res_29_861_767 : STD_LOGIC; 
  signal res_29_862_768 : STD_LOGIC; 
  signal res_2_57_770 : STD_LOGIC; 
  signal res_2_72_771 : STD_LOGIC; 
  signal res_2_89_772 : STD_LOGIC; 
  signal res_30_57_774 : STD_LOGIC; 
  signal res_30_86 : STD_LOGIC; 
  signal res_30_861_776 : STD_LOGIC; 
  signal res_30_862_777 : STD_LOGIC; 
  signal res_31_57_779 : STD_LOGIC; 
  signal res_31_86 : STD_LOGIC; 
  signal res_31_861_781 : STD_LOGIC; 
  signal res_31_862_782 : STD_LOGIC; 
  signal res_32_111 : STD_LOGIC; 
  signal res_32_50 : STD_LOGIC; 
  signal res_32_501_786 : STD_LOGIC; 
  signal res_32_502_787 : STD_LOGIC; 
  signal res_32_84_788 : STD_LOGIC; 
  signal res_33_111_790 : STD_LOGIC; 
  signal res_33_29_791 : STD_LOGIC; 
  signal res_33_42_792 : STD_LOGIC; 
  signal res_33_71_793 : STD_LOGIC; 
  signal res_34_111_795 : STD_LOGIC; 
  signal res_34_29_796 : STD_LOGIC; 
  signal res_34_42_797 : STD_LOGIC; 
  signal res_34_71_798 : STD_LOGIC; 
  signal res_35_111_800 : STD_LOGIC; 
  signal res_35_29_801 : STD_LOGIC; 
  signal res_35_42_802 : STD_LOGIC; 
  signal res_35_71_803 : STD_LOGIC; 
  signal res_36_29_805 : STD_LOGIC; 
  signal res_36_42_806 : STD_LOGIC; 
  signal res_36_71_807 : STD_LOGIC; 
  signal res_37_111_809 : STD_LOGIC; 
  signal res_37_29_810 : STD_LOGIC; 
  signal res_37_42_811 : STD_LOGIC; 
  signal res_37_71_812 : STD_LOGIC; 
  signal res_38_111_814 : STD_LOGIC; 
  signal res_38_29_815 : STD_LOGIC; 
  signal res_38_42_816 : STD_LOGIC; 
  signal res_38_71_817 : STD_LOGIC; 
  signal res_39_111_819 : STD_LOGIC; 
  signal res_39_29_820 : STD_LOGIC; 
  signal res_39_42_821 : STD_LOGIC; 
  signal res_39_71_822 : STD_LOGIC; 
  signal res_3_57_824 : STD_LOGIC; 
  signal res_3_72_825 : STD_LOGIC; 
  signal res_3_89_826 : STD_LOGIC; 
  signal res_40_112_828 : STD_LOGIC; 
  signal res_40_50 : STD_LOGIC; 
  signal res_40_501_830 : STD_LOGIC; 
  signal res_40_502_831 : STD_LOGIC; 
  signal res_40_84_832 : STD_LOGIC; 
  signal res_41_112_834 : STD_LOGIC; 
  signal res_41_29_835 : STD_LOGIC; 
  signal res_41_42_836 : STD_LOGIC; 
  signal res_41_71_837 : STD_LOGIC; 
  signal res_42_111_839 : STD_LOGIC; 
  signal res_42_29_840 : STD_LOGIC; 
  signal res_42_42_841 : STD_LOGIC; 
  signal res_42_71_842 : STD_LOGIC; 
  signal res_43_100_844 : STD_LOGIC; 
  signal res_43_33_845 : STD_LOGIC; 
  signal res_43_71_846 : STD_LOGIC; 
  signal res_43_73_847 : STD_LOGIC; 
  signal res_43_97_848 : STD_LOGIC; 
  signal res_44_105_850 : STD_LOGIC; 
  signal res_44_33_851 : STD_LOGIC; 
  signal res_44_71_852 : STD_LOGIC; 
  signal res_44_73_853 : STD_LOGIC; 
  signal res_45_100_855 : STD_LOGIC; 
  signal res_45_33_856 : STD_LOGIC; 
  signal res_45_71_857 : STD_LOGIC; 
  signal res_45_73_858 : STD_LOGIC; 
  signal res_45_97_859 : STD_LOGIC; 
  signal res_46_100_861 : STD_LOGIC; 
  signal res_46_33_862 : STD_LOGIC; 
  signal res_46_71_863 : STD_LOGIC; 
  signal res_46_73_864 : STD_LOGIC; 
  signal res_46_97_865 : STD_LOGIC; 
  signal res_47_100_867 : STD_LOGIC; 
  signal res_47_33_868 : STD_LOGIC; 
  signal res_47_71_869 : STD_LOGIC; 
  signal res_47_73_870 : STD_LOGIC; 
  signal res_47_97_871 : STD_LOGIC; 
  signal res_48_100_873 : STD_LOGIC; 
  signal res_48_33_874 : STD_LOGIC; 
  signal res_48_71_875 : STD_LOGIC; 
  signal res_48_73_876 : STD_LOGIC; 
  signal res_49_111_878 : STD_LOGIC; 
  signal res_49_29_879 : STD_LOGIC; 
  signal res_49_42_880 : STD_LOGIC; 
  signal res_49_71_881 : STD_LOGIC; 
  signal res_4_57_883 : STD_LOGIC; 
  signal res_4_72_884 : STD_LOGIC; 
  signal res_4_89_885 : STD_LOGIC; 
  signal res_50_33_887 : STD_LOGIC; 
  signal res_50_71_888 : STD_LOGIC; 
  signal res_50_73_889 : STD_LOGIC; 
  signal res_51_33_891 : STD_LOGIC; 
  signal res_51_71_892 : STD_LOGIC; 
  signal res_51_73_893 : STD_LOGIC; 
  signal res_52_105_895 : STD_LOGIC; 
  signal res_52_33_896 : STD_LOGIC; 
  signal res_52_71_897 : STD_LOGIC; 
  signal res_52_73_898 : STD_LOGIC; 
  signal res_53_33_900 : STD_LOGIC; 
  signal res_53_71_901 : STD_LOGIC; 
  signal res_53_73_902 : STD_LOGIC; 
  signal res_54_33_904 : STD_LOGIC; 
  signal res_54_71_905 : STD_LOGIC; 
  signal res_54_73_906 : STD_LOGIC; 
  signal res_55_33_908 : STD_LOGIC; 
  signal res_55_71_909 : STD_LOGIC; 
  signal res_55_73_910 : STD_LOGIC; 
  signal res_56_33_912 : STD_LOGIC; 
  signal res_56_71_913 : STD_LOGIC; 
  signal res_56_73_914 : STD_LOGIC; 
  signal res_57_112_916 : STD_LOGIC; 
  signal res_57_29_917 : STD_LOGIC; 
  signal res_57_42_918 : STD_LOGIC; 
  signal res_57_71_919 : STD_LOGIC; 
  signal res_58_33_921 : STD_LOGIC; 
  signal res_58_71_922 : STD_LOGIC; 
  signal res_58_73_923 : STD_LOGIC; 
  signal res_59_33_925 : STD_LOGIC; 
  signal res_59_71_926 : STD_LOGIC; 
  signal res_59_73_927 : STD_LOGIC; 
  signal res_5_57_929 : STD_LOGIC; 
  signal res_5_72_930 : STD_LOGIC; 
  signal res_5_89_931 : STD_LOGIC; 
  signal res_60_33_933 : STD_LOGIC; 
  signal res_60_71_934 : STD_LOGIC; 
  signal res_60_73_935 : STD_LOGIC; 
  signal res_60_93_936 : STD_LOGIC; 
  signal res_61_33_938 : STD_LOGIC; 
  signal res_61_71_939 : STD_LOGIC; 
  signal res_61_73_940 : STD_LOGIC; 
  signal res_62_33_942 : STD_LOGIC; 
  signal res_62_71_943 : STD_LOGIC; 
  signal res_62_73_944 : STD_LOGIC; 
  signal res_63_33_946 : STD_LOGIC; 
  signal res_63_71_947 : STD_LOGIC; 
  signal res_63_73_948 : STD_LOGIC; 
  signal res_6_57_950 : STD_LOGIC; 
  signal res_6_72_951 : STD_LOGIC; 
  signal res_6_89_952 : STD_LOGIC; 
  signal res_7_57_954 : STD_LOGIC; 
  signal res_7_72_955 : STD_LOGIC; 
  signal res_7_89_956 : STD_LOGIC; 
  signal res_8_57_958 : STD_LOGIC; 
  signal res_8_72_959 : STD_LOGIC; 
  signal res_8_89_960 : STD_LOGIC; 
  signal res_9_49_962 : STD_LOGIC; 
  signal res_9_62_963 : STD_LOGIC; 
  signal res_9_77_964 : STD_LOGIC; 
  signal shift_dir : STD_LOGIC; 
  signal shift_type : STD_LOGIC; 
  signal signe : STD_LOGIC; 
  signal Madd_res_add_Madd_cy : STD_LOGIC_VECTOR ( 63 downto 0 ); 
  signal Madd_res_add_Madd_lut : STD_LOGIC_VECTOR ( 64 downto 0 ); 
  signal efct_op2 : STD_LOGIC_VECTOR ( 63 downto 63 ); 
  signal inst_shifter_buf_3_mux0000 : STD_LOGIC_VECTOR ( 12 downto 12 ); 
  signal inst_shifter_buf_4_mux0000 : STD_LOGIC_VECTOR ( 9 downto 9 ); 
  signal inst_shifter_sign_extd : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal nul_cmp_eq0000_wg_cy : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal nul_cmp_eq0000_wg_lut : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal res_add : STD_LOGIC_VECTOR ( 64 downto 0 ); 
  signal shifter_out : STD_LOGIC_VECTOR ( 0 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  Madd_res_add_Madd_cy_0_Q : MUXCY
    port map (
      CI => comp_op2,
      DI => op1(0),
      S => Madd_res_add_Madd_lut(0),
      O => Madd_res_add_Madd_cy(0)
    );
  Madd_res_add_Madd_xor_0_Q : XORCY
    port map (
      CI => comp_op2,
      LI => Madd_res_add_Madd_lut(0),
      O => res_add(0)
    );
  Madd_res_add_Madd_cy_1_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(0),
      DI => op1(1),
      S => Madd_res_add_Madd_lut(1),
      O => Madd_res_add_Madd_cy(1)
    );
  Madd_res_add_Madd_xor_1_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(0),
      LI => Madd_res_add_Madd_lut(1),
      O => res_add(1)
    );
  Madd_res_add_Madd_cy_2_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(1),
      DI => op1(2),
      S => Madd_res_add_Madd_lut(2),
      O => Madd_res_add_Madd_cy(2)
    );
  Madd_res_add_Madd_xor_2_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(1),
      LI => Madd_res_add_Madd_lut(2),
      O => res_add(2)
    );
  Madd_res_add_Madd_cy_3_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(2),
      DI => op1(3),
      S => Madd_res_add_Madd_lut(3),
      O => Madd_res_add_Madd_cy(3)
    );
  Madd_res_add_Madd_xor_3_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(2),
      LI => Madd_res_add_Madd_lut(3),
      O => res_add(3)
    );
  Madd_res_add_Madd_cy_4_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(3),
      DI => op1(4),
      S => Madd_res_add_Madd_lut(4),
      O => Madd_res_add_Madd_cy(4)
    );
  Madd_res_add_Madd_xor_4_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(3),
      LI => Madd_res_add_Madd_lut(4),
      O => res_add(4)
    );
  Madd_res_add_Madd_cy_5_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(4),
      DI => op1(5),
      S => Madd_res_add_Madd_lut(5),
      O => Madd_res_add_Madd_cy(5)
    );
  Madd_res_add_Madd_xor_5_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(4),
      LI => Madd_res_add_Madd_lut(5),
      O => res_add(5)
    );
  Madd_res_add_Madd_cy_6_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(5),
      DI => op1(6),
      S => Madd_res_add_Madd_lut(6),
      O => Madd_res_add_Madd_cy(6)
    );
  Madd_res_add_Madd_xor_6_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(5),
      LI => Madd_res_add_Madd_lut(6),
      O => res_add(6)
    );
  Madd_res_add_Madd_cy_7_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(6),
      DI => op1(7),
      S => Madd_res_add_Madd_lut(7),
      O => Madd_res_add_Madd_cy(7)
    );
  Madd_res_add_Madd_xor_7_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(6),
      LI => Madd_res_add_Madd_lut(7),
      O => res_add(7)
    );
  Madd_res_add_Madd_cy_8_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(7),
      DI => op1(8),
      S => Madd_res_add_Madd_lut(8),
      O => Madd_res_add_Madd_cy(8)
    );
  Madd_res_add_Madd_xor_8_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(7),
      LI => Madd_res_add_Madd_lut(8),
      O => res_add(8)
    );
  Madd_res_add_Madd_cy_9_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(8),
      DI => op1(9),
      S => Madd_res_add_Madd_lut(9),
      O => Madd_res_add_Madd_cy(9)
    );
  Madd_res_add_Madd_xor_9_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(8),
      LI => Madd_res_add_Madd_lut(9),
      O => res_add(9)
    );
  Madd_res_add_Madd_cy_10_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(9),
      DI => op1(10),
      S => Madd_res_add_Madd_lut(10),
      O => Madd_res_add_Madd_cy(10)
    );
  Madd_res_add_Madd_xor_10_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(9),
      LI => Madd_res_add_Madd_lut(10),
      O => res_add(10)
    );
  Madd_res_add_Madd_cy_11_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(10),
      DI => op1(11),
      S => Madd_res_add_Madd_lut(11),
      O => Madd_res_add_Madd_cy(11)
    );
  Madd_res_add_Madd_xor_11_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(10),
      LI => Madd_res_add_Madd_lut(11),
      O => res_add(11)
    );
  Madd_res_add_Madd_cy_12_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(11),
      DI => op1(12),
      S => Madd_res_add_Madd_lut(12),
      O => Madd_res_add_Madd_cy(12)
    );
  Madd_res_add_Madd_xor_12_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(11),
      LI => Madd_res_add_Madd_lut(12),
      O => res_add(12)
    );
  Madd_res_add_Madd_cy_13_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(12),
      DI => op1(13),
      S => Madd_res_add_Madd_lut(13),
      O => Madd_res_add_Madd_cy(13)
    );
  Madd_res_add_Madd_xor_13_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(12),
      LI => Madd_res_add_Madd_lut(13),
      O => res_add(13)
    );
  Madd_res_add_Madd_cy_14_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(13),
      DI => op1(14),
      S => Madd_res_add_Madd_lut(14),
      O => Madd_res_add_Madd_cy(14)
    );
  Madd_res_add_Madd_xor_14_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(13),
      LI => Madd_res_add_Madd_lut(14),
      O => res_add(14)
    );
  Madd_res_add_Madd_cy_15_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(14),
      DI => op1(15),
      S => Madd_res_add_Madd_lut(15),
      O => Madd_res_add_Madd_cy(15)
    );
  Madd_res_add_Madd_xor_15_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(14),
      LI => Madd_res_add_Madd_lut(15),
      O => res_add(15)
    );
  Madd_res_add_Madd_cy_16_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(15),
      DI => op1(16),
      S => Madd_res_add_Madd_lut(16),
      O => Madd_res_add_Madd_cy(16)
    );
  Madd_res_add_Madd_xor_16_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(15),
      LI => Madd_res_add_Madd_lut(16),
      O => res_add(16)
    );
  Madd_res_add_Madd_cy_17_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(16),
      DI => op1(17),
      S => Madd_res_add_Madd_lut(17),
      O => Madd_res_add_Madd_cy(17)
    );
  Madd_res_add_Madd_xor_17_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(16),
      LI => Madd_res_add_Madd_lut(17),
      O => res_add(17)
    );
  Madd_res_add_Madd_cy_18_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(17),
      DI => op1(18),
      S => Madd_res_add_Madd_lut(18),
      O => Madd_res_add_Madd_cy(18)
    );
  Madd_res_add_Madd_xor_18_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(17),
      LI => Madd_res_add_Madd_lut(18),
      O => res_add(18)
    );
  Madd_res_add_Madd_cy_19_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(18),
      DI => op1(19),
      S => Madd_res_add_Madd_lut(19),
      O => Madd_res_add_Madd_cy(19)
    );
  Madd_res_add_Madd_xor_19_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(18),
      LI => Madd_res_add_Madd_lut(19),
      O => res_add(19)
    );
  Madd_res_add_Madd_cy_20_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(19),
      DI => op1(20),
      S => Madd_res_add_Madd_lut(20),
      O => Madd_res_add_Madd_cy(20)
    );
  Madd_res_add_Madd_xor_20_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(19),
      LI => Madd_res_add_Madd_lut(20),
      O => res_add(20)
    );
  Madd_res_add_Madd_cy_21_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(20),
      DI => op1(21),
      S => Madd_res_add_Madd_lut(21),
      O => Madd_res_add_Madd_cy(21)
    );
  Madd_res_add_Madd_xor_21_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(20),
      LI => Madd_res_add_Madd_lut(21),
      O => res_add(21)
    );
  Madd_res_add_Madd_cy_22_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(21),
      DI => op1(22),
      S => Madd_res_add_Madd_lut(22),
      O => Madd_res_add_Madd_cy(22)
    );
  Madd_res_add_Madd_xor_22_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(21),
      LI => Madd_res_add_Madd_lut(22),
      O => res_add(22)
    );
  Madd_res_add_Madd_cy_23_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(22),
      DI => op1(23),
      S => Madd_res_add_Madd_lut(23),
      O => Madd_res_add_Madd_cy(23)
    );
  Madd_res_add_Madd_xor_23_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(22),
      LI => Madd_res_add_Madd_lut(23),
      O => res_add(23)
    );
  Madd_res_add_Madd_cy_24_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(23),
      DI => op1(24),
      S => Madd_res_add_Madd_lut(24),
      O => Madd_res_add_Madd_cy(24)
    );
  Madd_res_add_Madd_xor_24_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(23),
      LI => Madd_res_add_Madd_lut(24),
      O => res_add(24)
    );
  Madd_res_add_Madd_cy_25_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(24),
      DI => op1(25),
      S => Madd_res_add_Madd_lut(25),
      O => Madd_res_add_Madd_cy(25)
    );
  Madd_res_add_Madd_xor_25_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(24),
      LI => Madd_res_add_Madd_lut(25),
      O => res_add(25)
    );
  Madd_res_add_Madd_cy_26_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(25),
      DI => op1(26),
      S => Madd_res_add_Madd_lut(26),
      O => Madd_res_add_Madd_cy(26)
    );
  Madd_res_add_Madd_xor_26_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(25),
      LI => Madd_res_add_Madd_lut(26),
      O => res_add(26)
    );
  Madd_res_add_Madd_cy_27_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(26),
      DI => op1(27),
      S => Madd_res_add_Madd_lut(27),
      O => Madd_res_add_Madd_cy(27)
    );
  Madd_res_add_Madd_xor_27_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(26),
      LI => Madd_res_add_Madd_lut(27),
      O => res_add(27)
    );
  Madd_res_add_Madd_cy_28_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(27),
      DI => op1(28),
      S => Madd_res_add_Madd_lut(28),
      O => Madd_res_add_Madd_cy(28)
    );
  Madd_res_add_Madd_xor_28_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(27),
      LI => Madd_res_add_Madd_lut(28),
      O => res_add(28)
    );
  Madd_res_add_Madd_cy_29_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(28),
      DI => op1(29),
      S => Madd_res_add_Madd_lut(29),
      O => Madd_res_add_Madd_cy(29)
    );
  Madd_res_add_Madd_xor_29_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(28),
      LI => Madd_res_add_Madd_lut(29),
      O => res_add(29)
    );
  Madd_res_add_Madd_cy_30_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(29),
      DI => op1(30),
      S => Madd_res_add_Madd_lut(30),
      O => Madd_res_add_Madd_cy(30)
    );
  Madd_res_add_Madd_xor_30_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(29),
      LI => Madd_res_add_Madd_lut(30),
      O => res_add(30)
    );
  Madd_res_add_Madd_cy_31_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(30),
      DI => op1(31),
      S => Madd_res_add_Madd_lut(31),
      O => Madd_res_add_Madd_cy(31)
    );
  Madd_res_add_Madd_xor_31_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(30),
      LI => Madd_res_add_Madd_lut(31),
      O => res_add(31)
    );
  Madd_res_add_Madd_cy_32_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(31),
      DI => op1(32),
      S => Madd_res_add_Madd_lut(32),
      O => Madd_res_add_Madd_cy(32)
    );
  Madd_res_add_Madd_xor_32_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(31),
      LI => Madd_res_add_Madd_lut(32),
      O => res_add(32)
    );
  Madd_res_add_Madd_cy_33_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(32),
      DI => op1(33),
      S => Madd_res_add_Madd_lut(33),
      O => Madd_res_add_Madd_cy(33)
    );
  Madd_res_add_Madd_xor_33_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(32),
      LI => Madd_res_add_Madd_lut(33),
      O => res_add(33)
    );
  Madd_res_add_Madd_cy_34_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(33),
      DI => op1(34),
      S => Madd_res_add_Madd_lut(34),
      O => Madd_res_add_Madd_cy(34)
    );
  Madd_res_add_Madd_xor_34_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(33),
      LI => Madd_res_add_Madd_lut(34),
      O => res_add(34)
    );
  Madd_res_add_Madd_cy_35_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(34),
      DI => op1(35),
      S => Madd_res_add_Madd_lut(35),
      O => Madd_res_add_Madd_cy(35)
    );
  Madd_res_add_Madd_xor_35_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(34),
      LI => Madd_res_add_Madd_lut(35),
      O => res_add(35)
    );
  Madd_res_add_Madd_cy_36_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(35),
      DI => op1(36),
      S => Madd_res_add_Madd_lut(36),
      O => Madd_res_add_Madd_cy(36)
    );
  Madd_res_add_Madd_xor_36_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(35),
      LI => Madd_res_add_Madd_lut(36),
      O => res_add(36)
    );
  Madd_res_add_Madd_cy_37_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(36),
      DI => op1(37),
      S => Madd_res_add_Madd_lut(37),
      O => Madd_res_add_Madd_cy(37)
    );
  Madd_res_add_Madd_xor_37_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(36),
      LI => Madd_res_add_Madd_lut(37),
      O => res_add(37)
    );
  Madd_res_add_Madd_cy_38_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(37),
      DI => op1(38),
      S => Madd_res_add_Madd_lut(38),
      O => Madd_res_add_Madd_cy(38)
    );
  Madd_res_add_Madd_xor_38_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(37),
      LI => Madd_res_add_Madd_lut(38),
      O => res_add(38)
    );
  Madd_res_add_Madd_cy_39_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(38),
      DI => op1(39),
      S => Madd_res_add_Madd_lut(39),
      O => Madd_res_add_Madd_cy(39)
    );
  Madd_res_add_Madd_xor_39_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(38),
      LI => Madd_res_add_Madd_lut(39),
      O => res_add(39)
    );
  Madd_res_add_Madd_cy_40_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(39),
      DI => op1(40),
      S => Madd_res_add_Madd_lut(40),
      O => Madd_res_add_Madd_cy(40)
    );
  Madd_res_add_Madd_xor_40_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(39),
      LI => Madd_res_add_Madd_lut(40),
      O => res_add(40)
    );
  Madd_res_add_Madd_cy_41_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(40),
      DI => op1(41),
      S => Madd_res_add_Madd_lut(41),
      O => Madd_res_add_Madd_cy(41)
    );
  Madd_res_add_Madd_xor_41_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(40),
      LI => Madd_res_add_Madd_lut(41),
      O => res_add(41)
    );
  Madd_res_add_Madd_cy_42_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(41),
      DI => op1(42),
      S => Madd_res_add_Madd_lut(42),
      O => Madd_res_add_Madd_cy(42)
    );
  Madd_res_add_Madd_xor_42_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(41),
      LI => Madd_res_add_Madd_lut(42),
      O => res_add(42)
    );
  Madd_res_add_Madd_cy_43_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(42),
      DI => op1(43),
      S => Madd_res_add_Madd_lut(43),
      O => Madd_res_add_Madd_cy(43)
    );
  Madd_res_add_Madd_xor_43_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(42),
      LI => Madd_res_add_Madd_lut(43),
      O => res_add(43)
    );
  Madd_res_add_Madd_cy_44_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(43),
      DI => op1(44),
      S => Madd_res_add_Madd_lut(44),
      O => Madd_res_add_Madd_cy(44)
    );
  Madd_res_add_Madd_xor_44_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(43),
      LI => Madd_res_add_Madd_lut(44),
      O => res_add(44)
    );
  Madd_res_add_Madd_cy_45_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(44),
      DI => op1(45),
      S => Madd_res_add_Madd_lut(45),
      O => Madd_res_add_Madd_cy(45)
    );
  Madd_res_add_Madd_xor_45_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(44),
      LI => Madd_res_add_Madd_lut(45),
      O => res_add(45)
    );
  Madd_res_add_Madd_cy_46_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(45),
      DI => op1(46),
      S => Madd_res_add_Madd_lut(46),
      O => Madd_res_add_Madd_cy(46)
    );
  Madd_res_add_Madd_xor_46_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(45),
      LI => Madd_res_add_Madd_lut(46),
      O => res_add(46)
    );
  Madd_res_add_Madd_cy_47_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(46),
      DI => op1(47),
      S => Madd_res_add_Madd_lut(47),
      O => Madd_res_add_Madd_cy(47)
    );
  Madd_res_add_Madd_xor_47_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(46),
      LI => Madd_res_add_Madd_lut(47),
      O => res_add(47)
    );
  Madd_res_add_Madd_cy_48_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(47),
      DI => op1(48),
      S => Madd_res_add_Madd_lut(48),
      O => Madd_res_add_Madd_cy(48)
    );
  Madd_res_add_Madd_xor_48_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(47),
      LI => Madd_res_add_Madd_lut(48),
      O => res_add(48)
    );
  Madd_res_add_Madd_cy_49_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(48),
      DI => op1(49),
      S => Madd_res_add_Madd_lut(49),
      O => Madd_res_add_Madd_cy(49)
    );
  Madd_res_add_Madd_xor_49_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(48),
      LI => Madd_res_add_Madd_lut(49),
      O => res_add(49)
    );
  Madd_res_add_Madd_cy_50_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(49),
      DI => op1(50),
      S => Madd_res_add_Madd_lut(50),
      O => Madd_res_add_Madd_cy(50)
    );
  Madd_res_add_Madd_xor_50_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(49),
      LI => Madd_res_add_Madd_lut(50),
      O => res_add(50)
    );
  Madd_res_add_Madd_cy_51_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(50),
      DI => op1(51),
      S => Madd_res_add_Madd_lut(51),
      O => Madd_res_add_Madd_cy(51)
    );
  Madd_res_add_Madd_xor_51_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(50),
      LI => Madd_res_add_Madd_lut(51),
      O => res_add(51)
    );
  Madd_res_add_Madd_cy_52_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(51),
      DI => op1(52),
      S => Madd_res_add_Madd_lut(52),
      O => Madd_res_add_Madd_cy(52)
    );
  Madd_res_add_Madd_xor_52_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(51),
      LI => Madd_res_add_Madd_lut(52),
      O => res_add(52)
    );
  Madd_res_add_Madd_cy_53_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(52),
      DI => op1(53),
      S => Madd_res_add_Madd_lut(53),
      O => Madd_res_add_Madd_cy(53)
    );
  Madd_res_add_Madd_xor_53_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(52),
      LI => Madd_res_add_Madd_lut(53),
      O => res_add(53)
    );
  Madd_res_add_Madd_cy_54_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(53),
      DI => op1(54),
      S => Madd_res_add_Madd_lut(54),
      O => Madd_res_add_Madd_cy(54)
    );
  Madd_res_add_Madd_xor_54_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(53),
      LI => Madd_res_add_Madd_lut(54),
      O => res_add(54)
    );
  Madd_res_add_Madd_cy_55_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(54),
      DI => op1(55),
      S => Madd_res_add_Madd_lut(55),
      O => Madd_res_add_Madd_cy(55)
    );
  Madd_res_add_Madd_xor_55_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(54),
      LI => Madd_res_add_Madd_lut(55),
      O => res_add(55)
    );
  Madd_res_add_Madd_cy_56_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(55),
      DI => op1(56),
      S => Madd_res_add_Madd_lut(56),
      O => Madd_res_add_Madd_cy(56)
    );
  Madd_res_add_Madd_xor_56_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(55),
      LI => Madd_res_add_Madd_lut(56),
      O => res_add(56)
    );
  Madd_res_add_Madd_cy_57_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(56),
      DI => op1(57),
      S => Madd_res_add_Madd_lut(57),
      O => Madd_res_add_Madd_cy(57)
    );
  Madd_res_add_Madd_xor_57_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(56),
      LI => Madd_res_add_Madd_lut(57),
      O => res_add(57)
    );
  Madd_res_add_Madd_cy_58_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(57),
      DI => op1(58),
      S => Madd_res_add_Madd_lut(58),
      O => Madd_res_add_Madd_cy(58)
    );
  Madd_res_add_Madd_xor_58_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(57),
      LI => Madd_res_add_Madd_lut(58),
      O => res_add(58)
    );
  Madd_res_add_Madd_cy_59_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(58),
      DI => op1(59),
      S => Madd_res_add_Madd_lut(59),
      O => Madd_res_add_Madd_cy(59)
    );
  Madd_res_add_Madd_xor_59_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(58),
      LI => Madd_res_add_Madd_lut(59),
      O => res_add(59)
    );
  Madd_res_add_Madd_cy_60_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(59),
      DI => op1(60),
      S => Madd_res_add_Madd_lut(60),
      O => Madd_res_add_Madd_cy(60)
    );
  Madd_res_add_Madd_xor_60_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(59),
      LI => Madd_res_add_Madd_lut(60),
      O => res_add(60)
    );
  Madd_res_add_Madd_cy_61_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(60),
      DI => op1(61),
      S => Madd_res_add_Madd_lut(61),
      O => Madd_res_add_Madd_cy(61)
    );
  Madd_res_add_Madd_xor_61_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(60),
      LI => Madd_res_add_Madd_lut(61),
      O => res_add(61)
    );
  Madd_res_add_Madd_cy_62_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(61),
      DI => op1(62),
      S => Madd_res_add_Madd_lut(62),
      O => Madd_res_add_Madd_cy(62)
    );
  Madd_res_add_Madd_xor_62_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(61),
      LI => Madd_res_add_Madd_lut(62),
      O => res_add(62)
    );
  Madd_res_add_Madd_cy_63_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(62),
      DI => op1(63),
      S => Madd_res_add_Madd_lut(63),
      O => Madd_res_add_Madd_cy(63)
    );
  Madd_res_add_Madd_xor_63_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(62),
      LI => Madd_res_add_Madd_lut(63),
      O => res_add(63)
    );
  Madd_res_add_Madd_xor_64_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(63),
      LI => Madd_res_add_Madd_lut(64),
      O => res_add(64)
    );
  nul_cmp_eq0000_wg_lut_0_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => res_add(52),
      I1 => res_add(51),
      I2 => res_add(53),
      I3 => res_add(50),
      O => nul_cmp_eq0000_wg_lut(0)
    );
  nul_cmp_eq0000_wg_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(0),
      O => nul_cmp_eq0000_wg_cy(0)
    );
  nul_cmp_eq0000_wg_lut_1_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(49),
      I1 => res_add(48),
      I2 => res_add(47),
      I3 => res_add(46),
      I4 => res_add(54),
      I5 => res_add(45),
      O => nul_cmp_eq0000_wg_lut(1)
    );
  nul_cmp_eq0000_wg_cy_1_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(0),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(1),
      O => nul_cmp_eq0000_wg_cy(1)
    );
  nul_cmp_eq0000_wg_lut_2_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(44),
      I1 => res_add(43),
      I2 => res_add(42),
      I3 => res_add(41),
      I4 => res_add(55),
      I5 => res_add(40),
      O => nul_cmp_eq0000_wg_lut(2)
    );
  nul_cmp_eq0000_wg_cy_2_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(1),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(2),
      O => nul_cmp_eq0000_wg_cy(2)
    );
  nul_cmp_eq0000_wg_lut_3_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(39),
      I1 => res_add(38),
      I2 => res_add(37),
      I3 => res_add(36),
      I4 => res_add(56),
      I5 => res_add(35),
      O => nul_cmp_eq0000_wg_lut(3)
    );
  nul_cmp_eq0000_wg_cy_3_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(2),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(3),
      O => nul_cmp_eq0000_wg_cy(3)
    );
  nul_cmp_eq0000_wg_lut_4_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(34),
      I1 => res_add(33),
      I2 => res_add(32),
      I3 => res_add(31),
      I4 => res_add(57),
      I5 => res_add(30),
      O => nul_cmp_eq0000_wg_lut(4)
    );
  nul_cmp_eq0000_wg_cy_4_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(3),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(4),
      O => nul_cmp_eq0000_wg_cy(4)
    );
  nul_cmp_eq0000_wg_lut_5_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(29),
      I1 => res_add(28),
      I2 => res_add(27),
      I3 => res_add(26),
      I4 => res_add(58),
      I5 => res_add(25),
      O => nul_cmp_eq0000_wg_lut(5)
    );
  nul_cmp_eq0000_wg_cy_5_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(4),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(5),
      O => nul_cmp_eq0000_wg_cy(5)
    );
  nul_cmp_eq0000_wg_lut_6_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(24),
      I1 => res_add(23),
      I2 => res_add(22),
      I3 => res_add(21),
      I4 => res_add(59),
      I5 => res_add(20),
      O => nul_cmp_eq0000_wg_lut(6)
    );
  nul_cmp_eq0000_wg_cy_6_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(5),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(6),
      O => nul_cmp_eq0000_wg_cy(6)
    );
  nul_cmp_eq0000_wg_lut_7_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(19),
      I1 => res_add(18),
      I2 => res_add(17),
      I3 => res_add(16),
      I4 => res_add(60),
      I5 => res_add(15),
      O => nul_cmp_eq0000_wg_lut(7)
    );
  nul_cmp_eq0000_wg_cy_7_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(6),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(7),
      O => nul_cmp_eq0000_wg_cy(7)
    );
  nul_cmp_eq0000_wg_lut_8_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(14),
      I1 => res_add(13),
      I2 => res_add(12),
      I3 => res_add(11),
      I4 => res_add(61),
      I5 => res_add(10),
      O => nul_cmp_eq0000_wg_lut(8)
    );
  nul_cmp_eq0000_wg_cy_8_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(7),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(8),
      O => nul_cmp_eq0000_wg_cy(8)
    );
  nul_cmp_eq0000_wg_lut_9_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(9),
      I1 => res_add(8),
      I2 => res_add(7),
      I3 => res_add(6),
      I4 => res_add(62),
      I5 => res_add(5),
      O => nul_cmp_eq0000_wg_lut(9)
    );
  nul_cmp_eq0000_wg_cy_9_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(8),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(9),
      O => nul_cmp_eq0000_wg_cy(9)
    );
  nul_cmp_eq0000_wg_lut_10_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(4),
      I1 => res_add(3),
      I2 => res_add(2),
      I3 => res_add(1),
      I4 => res_add(63),
      I5 => res_add(0),
      O => nul_cmp_eq0000_wg_lut(10)
    );
  nul_cmp_eq0000_wg_cy_10_Q : MUXCY
    port map (
      CI => nul_cmp_eq0000_wg_cy(9),
      DI => N0,
      S => nul_cmp_eq0000_wg_lut(10),
      O => nul
    );
  res_32_101 : LUT5
    generic map(
      INIT => X"04400400"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => N82
    );
  res_32_121 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      O => N84
    );
  res_32_51 : LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(1),
      O => N72
    );
  res_32_71 : LUT5
    generic map(
      INIT => X"00110110"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => N78
    );
  res_32_61 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(4),
      I2 => op_ctrl(3),
      O => N76
    );
  signe_or00001 : LUT5
    generic map(
      INIT => X"00E0012A"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(3),
      I3 => op_ctrl(4),
      I4 => op_ctrl(2),
      O => signe
    );
  res_8_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_8_57_958,
      I1 => N71,
      I2 => op2(8),
      I3 => N78,
      I4 => res_add(8),
      I5 => res_8_72_959,
      O => res_8_89_960
    );
  inst_shifter_buf_5_mux0000_44_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_60_Q,
      I4 => inst_shifter_buf_4_44_Q,
      O => inst_shifter_buf_5_44_Q
    );
  inst_shifter_buf_5_mux0000_40_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_56_Q,
      I4 => inst_shifter_buf_4_40_Q,
      O => inst_shifter_buf_5_40_Q
    );
  inst_shifter_buf_5_mux0000_26_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_10_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_42_Q,
      I4 => inst_shifter_buf_4_26_Q,
      O => inst_shifter_buf_5_26_Q
    );
  inst_shifter_buf_4_mux0000_52_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_60_Q,
      I4 => inst_shifter_buf_3_52_Q,
      O => inst_shifter_buf_4_52_Q
    );
  inst_shifter_buf_4_mux0000_42_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_50_Q,
      I4 => inst_shifter_buf_3_42_Q,
      O => inst_shifter_buf_4_42_Q
    );
  inst_shifter_buf_4_mux0000_41_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_33_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_49_Q,
      I4 => inst_shifter_buf_3_41_Q,
      O => inst_shifter_buf_4_41_Q
    );
  inst_shifter_buf_4_mux0000_39_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_47_Q,
      I4 => inst_shifter_buf_3_39_Q,
      O => inst_shifter_buf_4_39_Q
    );
  inst_shifter_buf_4_mux0000_38_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_46_Q,
      I4 => inst_shifter_buf_3_38_Q,
      O => inst_shifter_buf_4_38_Q
    );
  inst_shifter_buf_4_mux0000_37_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_45_Q,
      I4 => inst_shifter_buf_3_37_Q,
      O => inst_shifter_buf_4_37_Q
    );
  inst_shifter_buf_4_mux0000_36_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_44_Q,
      I4 => inst_shifter_buf_3_36_Q,
      O => inst_shifter_buf_4_36_Q
    );
  inst_shifter_buf_4_mux0000_35_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_43_Q,
      I4 => inst_shifter_buf_3_35_Q,
      O => inst_shifter_buf_4_35_Q
    );
  inst_shifter_buf_4_mux0000_34_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_42_Q,
      I4 => inst_shifter_buf_3_34_Q,
      O => inst_shifter_buf_4_34_Q
    );
  inst_shifter_buf_4_mux0000_33_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_41_Q,
      I4 => inst_shifter_buf_3_33_Q,
      O => inst_shifter_buf_4_33_Q
    );
  inst_shifter_buf_4_mux0000_28_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_36_Q,
      I4 => inst_shifter_buf_3_28_Q,
      O => inst_shifter_buf_4_28_Q
    );
  inst_shifter_buf_4_mux0000_26_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_34_Q,
      I4 => inst_shifter_buf_3_26_Q,
      O => inst_shifter_buf_4_26_Q
    );
  inst_shifter_buf_4_mux0000_25_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_33_Q,
      I4 => inst_shifter_buf_3_25_Q,
      O => inst_shifter_buf_4_25_Q
    );
  inst_shifter_buf_4_mux0000_24_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_16_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_32_Q,
      I4 => inst_shifter_buf_3_24_Q,
      O => inst_shifter_buf_4_24_Q
    );
  inst_shifter_buf_4_mux0000_23_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_15_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_31_Q,
      I4 => inst_shifter_buf_3_23_Q,
      O => inst_shifter_buf_4_23_Q
    );
  inst_shifter_buf_4_mux0000_22_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_14_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_30_Q,
      I4 => inst_shifter_buf_3_22_Q,
      O => inst_shifter_buf_4_22_Q
    );
  inst_shifter_buf_4_mux0000_21_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_13_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_29_Q,
      I4 => inst_shifter_buf_3_21_Q,
      O => inst_shifter_buf_4_21_Q
    );
  inst_shifter_buf_4_mux0000_19_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_11_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_27_Q,
      I4 => inst_shifter_buf_3_19_Q,
      O => inst_shifter_buf_4_19_Q
    );
  inst_shifter_buf_4_mux0000_18_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_10_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_26_Q,
      I4 => inst_shifter_buf_3_18_Q,
      O => inst_shifter_buf_4_18_Q
    );
  inst_shifter_buf_4_mux0000_17_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_25_Q,
      I4 => inst_shifter_buf_3_17_Q,
      O => inst_shifter_buf_4_17_Q
    );
  inst_shifter_buf_3_mux0000_9_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_5_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_13_Q,
      I4 => inst_shifter_buf_2_9_Q,
      O => inst_shifter_buf_3_9_Q
    );
  inst_shifter_buf_3_mux0000_50_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_54_Q,
      I4 => inst_shifter_buf_2_50_Q,
      O => inst_shifter_buf_3_50_Q
    );
  inst_shifter_buf_3_mux0000_49_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_53_Q,
      I4 => inst_shifter_buf_2_49_Q,
      O => inst_shifter_buf_3_49_Q
    );
  inst_shifter_buf_3_mux0000_42_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_46_Q,
      I4 => inst_shifter_buf_2_42_Q,
      O => inst_shifter_buf_3_42_Q
    );
  inst_shifter_buf_3_mux0000_41_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_45_Q,
      I4 => inst_shifter_buf_2_41_Q,
      O => inst_shifter_buf_3_41_Q
    );
  inst_shifter_buf_3_mux0000_34_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_38_Q,
      I4 => inst_shifter_buf_2_34_Q,
      O => inst_shifter_buf_3_34_Q
    );
  inst_shifter_buf_3_mux0000_33_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_37_Q,
      I4 => inst_shifter_buf_2_33_Q,
      O => inst_shifter_buf_3_33_Q
    );
  inst_shifter_buf_3_mux0000_28_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_32_Q,
      I4 => inst_shifter_buf_2_28_Q,
      O => inst_shifter_buf_3_28_Q
    );
  inst_shifter_buf_3_mux0000_26_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_30_Q,
      I4 => inst_shifter_buf_2_26_Q,
      O => inst_shifter_buf_3_26_Q
    );
  inst_shifter_buf_3_mux0000_25_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_29_Q,
      I4 => inst_shifter_buf_2_25_Q,
      O => inst_shifter_buf_3_25_Q
    );
  inst_shifter_buf_3_mux0000_20_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_16_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_24_Q,
      I4 => inst_shifter_buf_2_20_Q,
      O => inst_shifter_buf_3_20_Q
    );
  inst_shifter_buf_3_mux0000_18_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_14_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_22_Q,
      I4 => inst_shifter_buf_2_18_Q,
      O => inst_shifter_buf_3_18_Q
    );
  inst_shifter_buf_3_mux0000_10_2 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_6_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_14_Q,
      I4 => inst_shifter_buf_2_10_Q,
      O => inst_shifter_buf_3_10_Q
    );
  res_5_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_5_57_929,
      I1 => N71,
      I2 => op2(5),
      I3 => N78,
      I4 => res_add(5),
      I5 => res_5_72_930,
      O => res_5_89_931
    );
  res_7_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_7_57_954,
      I1 => N71,
      I2 => op2(7),
      I3 => N78,
      I4 => res_add(7),
      I5 => res_7_72_955,
      O => res_7_89_956
    );
  res_6_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_6_57_950,
      I1 => N71,
      I2 => op2(6),
      I3 => N78,
      I4 => res_add(6),
      I5 => res_6_72_951,
      O => res_6_89_952
    );
  res_4_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_4_57_883,
      I1 => N71,
      I2 => op2(4),
      I3 => N78,
      I4 => res_add(4),
      I5 => res_4_72_884,
      O => res_4_89_885
    );
  res_3_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_3_57_824,
      I1 => N71,
      I2 => op2(3),
      I3 => N78,
      I4 => res_add(3),
      I5 => res_3_72_825,
      O => res_3_89_826
    );
  res_2_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_2_57_770,
      I1 => N71,
      I2 => op2(2),
      I3 => N78,
      I4 => res_add(2),
      I5 => res_2_72_771,
      O => res_2_89_772
    );
  res_1_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_1_57_715,
      I1 => N71,
      I2 => op2(1),
      I3 => N78,
      I4 => res_add(1),
      I5 => res_1_72_716,
      O => res_1_89_717
    );
  res_10_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_10_57_672,
      I1 => N71,
      I2 => op2(10),
      I3 => N78,
      I4 => res_add(10),
      I5 => res_10_72_673,
      O => res_10_89_674
    );
  res_32_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(32),
      I1 => N70,
      I2 => N83,
      I3 => op2(32),
      I4 => N71,
      I5 => res_32_50,
      O => res_32_84_788
    );
  res_40_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(40),
      I1 => N70,
      I2 => N83,
      I3 => op2(40),
      I4 => N71,
      I5 => res_40_50,
      O => res_40_84_832
    );
  res_40_123 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_40_84_832,
      I1 => N78,
      I2 => res_add(40),
      I3 => N82,
      I4 => res_40_112_828,
      O => res(40)
    );
  inst_shifter_buf_5_mux0000_47_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_63_Q,
      I4 => inst_shifter_buf_4_47_Q,
      O => inst_shifter_buf_5_47_Q
    );
  inst_shifter_buf_5_mux0000_46_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_62_Q,
      I4 => inst_shifter_buf_4_46_Q,
      O => inst_shifter_buf_5_46_Q
    );
  inst_shifter_buf_5_mux0000_45_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_61_Q,
      I4 => inst_shifter_buf_4_45_Q,
      O => inst_shifter_buf_5_45_Q
    );
  inst_shifter_buf_5_mux0000_43_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_59_Q,
      I4 => inst_shifter_buf_4_43_Q,
      O => inst_shifter_buf_5_43_Q
    );
  inst_shifter_buf_5_mux0000_42_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_58_Q,
      I4 => inst_shifter_buf_4_42_Q,
      O => inst_shifter_buf_5_42_Q
    );
  inst_shifter_buf_5_mux0000_39_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_55_Q,
      I4 => inst_shifter_buf_4_39_Q,
      O => inst_shifter_buf_5_39_Q
    );
  inst_shifter_buf_5_mux0000_38_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_54_Q,
      I4 => inst_shifter_buf_4_38_Q,
      O => inst_shifter_buf_5_38_Q
    );
  inst_shifter_buf_5_mux0000_37_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_53_Q,
      I4 => inst_shifter_buf_4_37_Q,
      O => inst_shifter_buf_5_37_Q
    );
  inst_shifter_buf_5_mux0000_36_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_52_Q,
      I4 => inst_shifter_buf_4_36_Q,
      O => inst_shifter_buf_5_36_Q
    );
  inst_shifter_buf_5_mux0000_35_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_51_Q,
      I4 => inst_shifter_buf_4_35_Q,
      O => inst_shifter_buf_5_35_Q
    );
  inst_shifter_buf_5_mux0000_34_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_50_Q,
      I4 => inst_shifter_buf_4_34_Q,
      O => inst_shifter_buf_5_34_Q
    );
  inst_shifter_buf_5_mux0000_33_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_49_Q,
      I4 => inst_shifter_buf_4_33_Q,
      O => inst_shifter_buf_5_33_Q
    );
  inst_shifter_buf_5_mux0000_31_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_15_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_47_Q,
      I4 => inst_shifter_buf_4_31_Q,
      O => inst_shifter_buf_5_31_Q
    );
  inst_shifter_buf_5_mux0000_30_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_14_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_46_Q,
      I4 => inst_shifter_buf_4_30_Q,
      O => inst_shifter_buf_5_30_Q
    );
  inst_shifter_buf_5_mux0000_29_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_13_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_45_Q,
      I4 => inst_shifter_buf_4_29_Q,
      O => inst_shifter_buf_5_29_Q
    );
  inst_shifter_buf_5_mux0000_27_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_11_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_43_Q,
      I4 => inst_shifter_buf_4_27_Q,
      O => inst_shifter_buf_5_27_Q
    );
  inst_shifter_buf_5_mux0000_24_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_8_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_40_Q,
      I4 => inst_shifter_buf_4_24_Q,
      O => inst_shifter_buf_5_24_Q
    );
  inst_shifter_buf_4_mux0000_8_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_0_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_16_Q,
      I4 => inst_shifter_buf_3_8_Q,
      O => inst_shifter_buf_4_8_Q
    );
  inst_shifter_buf_4_mux0000_55_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_63_Q,
      I4 => inst_shifter_buf_3_55_Q,
      O => inst_shifter_buf_4_55_Q
    );
  inst_shifter_buf_4_mux0000_54_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_62_Q,
      I4 => inst_shifter_buf_3_54_Q,
      O => inst_shifter_buf_4_54_Q
    );
  inst_shifter_buf_4_mux0000_53_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_61_Q,
      I4 => inst_shifter_buf_3_53_Q,
      O => inst_shifter_buf_4_53_Q
    );
  inst_shifter_buf_4_mux0000_51_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_59_Q,
      I4 => inst_shifter_buf_3_51_Q,
      O => inst_shifter_buf_4_51_Q
    );
  inst_shifter_buf_4_mux0000_50_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_58_Q,
      I4 => inst_shifter_buf_3_50_Q,
      O => inst_shifter_buf_4_50_Q
    );
  inst_shifter_buf_4_mux0000_49_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_57_Q,
      I4 => inst_shifter_buf_3_49_Q,
      O => inst_shifter_buf_4_49_Q
    );
  inst_shifter_buf_4_mux0000_47_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_55_Q,
      I4 => inst_shifter_buf_3_47_Q,
      O => inst_shifter_buf_4_47_Q
    );
  inst_shifter_buf_4_mux0000_46_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_54_Q,
      I4 => inst_shifter_buf_3_46_Q,
      O => inst_shifter_buf_4_46_Q
    );
  inst_shifter_buf_4_mux0000_45_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_53_Q,
      I4 => inst_shifter_buf_3_45_Q,
      O => inst_shifter_buf_4_45_Q
    );
  inst_shifter_buf_4_mux0000_44_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_52_Q,
      I4 => inst_shifter_buf_3_44_Q,
      O => inst_shifter_buf_4_44_Q
    );
  inst_shifter_buf_4_mux0000_43_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_51_Q,
      I4 => inst_shifter_buf_3_43_Q,
      O => inst_shifter_buf_4_43_Q
    );
  inst_shifter_buf_4_mux0000_40_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_48_Q,
      I4 => inst_shifter_buf_3_40_Q,
      O => inst_shifter_buf_4_40_Q
    );
  inst_shifter_buf_4_mux0000_31_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_39_Q,
      I4 => inst_shifter_buf_3_31_Q,
      O => inst_shifter_buf_4_31_Q
    );
  inst_shifter_buf_4_mux0000_30_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_38_Q,
      I4 => inst_shifter_buf_3_30_Q,
      O => inst_shifter_buf_4_30_Q
    );
  inst_shifter_buf_4_mux0000_29_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_37_Q,
      I4 => inst_shifter_buf_3_29_Q,
      O => inst_shifter_buf_4_29_Q
    );
  inst_shifter_buf_4_mux0000_27_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_35_Q,
      I4 => inst_shifter_buf_3_27_Q,
      O => inst_shifter_buf_4_27_Q
    );
  inst_shifter_buf_4_mux0000_15_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_7_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_23_Q,
      I4 => inst_shifter_buf_3_15_Q,
      O => inst_shifter_buf_4_15_Q
    );
  inst_shifter_buf_4_mux0000_14_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_6_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_22_Q,
      I4 => inst_shifter_buf_3_14_Q,
      O => inst_shifter_buf_4_14_Q
    );
  inst_shifter_buf_4_mux0000_13_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_5_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_21_Q,
      I4 => inst_shifter_buf_3_13_Q,
      O => inst_shifter_buf_4_13_Q
    );
  inst_shifter_buf_3_mux0000_7_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_3_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_11_Q,
      I4 => inst_shifter_buf_2_7_Q,
      O => inst_shifter_buf_3_7_Q
    );
  inst_shifter_buf_3_mux0000_6_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_2_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_10_Q,
      I4 => inst_shifter_buf_2_6_Q,
      O => inst_shifter_buf_3_6_Q
    );
  inst_shifter_buf_3_mux0000_58_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_54_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_62_Q,
      I4 => inst_shifter_buf_2_58_Q,
      O => inst_shifter_buf_3_58_Q
    );
  inst_shifter_buf_3_mux0000_55_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_51_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_59_Q,
      I4 => inst_shifter_buf_2_55_Q,
      O => inst_shifter_buf_3_55_Q
    );
  inst_shifter_buf_3_mux0000_54_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_50_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_58_Q,
      I4 => inst_shifter_buf_2_54_Q,
      O => inst_shifter_buf_3_54_Q
    );
  inst_shifter_buf_3_mux0000_53_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_49_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_57_Q,
      I4 => inst_shifter_buf_2_53_Q,
      O => inst_shifter_buf_3_53_Q
    );
  inst_shifter_buf_3_mux0000_52_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_48_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_56_Q,
      I4 => inst_shifter_buf_2_52_Q,
      O => inst_shifter_buf_3_52_Q
    );
  inst_shifter_buf_3_mux0000_51_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_55_Q,
      I4 => inst_shifter_buf_2_51_Q,
      O => inst_shifter_buf_3_51_Q
    );
  inst_shifter_buf_3_mux0000_47_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_51_Q,
      I4 => inst_shifter_buf_2_47_Q,
      O => inst_shifter_buf_3_47_Q
    );
  inst_shifter_buf_3_mux0000_46_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_50_Q,
      I4 => inst_shifter_buf_2_46_Q,
      O => inst_shifter_buf_3_46_Q
    );
  inst_shifter_buf_3_mux0000_45_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_49_Q,
      I4 => inst_shifter_buf_2_45_Q,
      O => inst_shifter_buf_3_45_Q
    );
  inst_shifter_buf_3_mux0000_44_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_48_Q,
      I4 => inst_shifter_buf_2_44_Q,
      O => inst_shifter_buf_3_44_Q
    );
  inst_shifter_buf_3_mux0000_43_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_47_Q,
      I4 => inst_shifter_buf_2_43_Q,
      O => inst_shifter_buf_3_43_Q
    );
  inst_shifter_buf_3_mux0000_39_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_43_Q,
      I4 => inst_shifter_buf_2_39_Q,
      O => inst_shifter_buf_3_39_Q
    );
  inst_shifter_buf_3_mux0000_38_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_42_Q,
      I4 => inst_shifter_buf_2_38_Q,
      O => inst_shifter_buf_3_38_Q
    );
  inst_shifter_buf_3_mux0000_37_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_33_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_41_Q,
      I4 => inst_shifter_buf_2_37_Q,
      O => inst_shifter_buf_3_37_Q
    );
  inst_shifter_buf_3_mux0000_36_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_40_Q,
      I4 => inst_shifter_buf_2_36_Q,
      O => inst_shifter_buf_3_36_Q
    );
  inst_shifter_buf_3_mux0000_35_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_39_Q,
      I4 => inst_shifter_buf_2_35_Q,
      O => inst_shifter_buf_3_35_Q
    );
  inst_shifter_buf_3_mux0000_31_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_35_Q,
      I4 => inst_shifter_buf_2_31_Q,
      O => inst_shifter_buf_3_31_Q
    );
  inst_shifter_buf_3_mux0000_30_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_34_Q,
      I4 => inst_shifter_buf_2_30_Q,
      O => inst_shifter_buf_3_30_Q
    );
  inst_shifter_buf_3_mux0000_29_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_33_Q,
      I4 => inst_shifter_buf_2_29_Q,
      O => inst_shifter_buf_3_29_Q
    );
  inst_shifter_buf_3_mux0000_27_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_31_Q,
      I4 => inst_shifter_buf_2_27_Q,
      O => inst_shifter_buf_3_27_Q
    );
  inst_shifter_buf_3_mux0000_23_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_27_Q,
      I4 => inst_shifter_buf_2_23_Q,
      O => inst_shifter_buf_3_23_Q
    );
  inst_shifter_buf_3_mux0000_22_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_26_Q,
      I4 => inst_shifter_buf_2_22_Q,
      O => inst_shifter_buf_3_22_Q
    );
  inst_shifter_buf_3_mux0000_21_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_25_Q,
      I4 => inst_shifter_buf_2_21_Q,
      O => inst_shifter_buf_3_21_Q
    );
  inst_shifter_buf_3_mux0000_19_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_15_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_23_Q,
      I4 => inst_shifter_buf_2_19_Q,
      O => inst_shifter_buf_3_19_Q
    );
  inst_shifter_buf_3_mux0000_17_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_13_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_21_Q,
      I4 => inst_shifter_buf_2_17_Q,
      O => inst_shifter_buf_3_17_Q
    );
  inst_shifter_buf_3_mux0000_15_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_11_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_19_Q,
      I4 => inst_shifter_buf_2_15_Q,
      O => inst_shifter_buf_3_15_Q
    );
  inst_shifter_buf_3_mux0000_14_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_10_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_18_Q,
      I4 => inst_shifter_buf_2_14_Q,
      O => inst_shifter_buf_3_14_Q
    );
  inst_shifter_buf_3_mux0000_13_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_17_Q,
      I4 => inst_shifter_buf_2_13_Q,
      O => inst_shifter_buf_3_13_Q
    );
  inst_shifter_buf_3_mux0000_11_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_7_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_15_Q,
      I4 => inst_shifter_buf_2_11_Q,
      O => inst_shifter_buf_3_11_Q
    );
  inst_shifter_buf_2_mux0000_9_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_7_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_11_Q,
      I4 => inst_shifter_buf_1_9_Q,
      O => inst_shifter_buf_2_9_Q
    );
  inst_shifter_buf_2_mux0000_7_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_5_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_9_Q,
      I4 => inst_shifter_buf_1_7_Q,
      O => inst_shifter_buf_2_7_Q
    );
  inst_shifter_buf_2_mux0000_6_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_4_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_8_Q,
      I4 => inst_shifter_buf_1_6_Q,
      O => inst_shifter_buf_2_6_Q
    );
  inst_shifter_buf_2_mux0000_5_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_3_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_7_Q,
      I4 => inst_shifter_buf_1_5_Q,
      O => inst_shifter_buf_2_5_Q
    );
  inst_shifter_buf_2_mux0000_59_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_57_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_61_Q,
      I4 => inst_shifter_buf_1_59_Q,
      O => inst_shifter_buf_2_59_Q
    );
  inst_shifter_buf_2_mux0000_58_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_56_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_60_Q,
      I4 => inst_shifter_buf_1_58_Q,
      O => inst_shifter_buf_2_58_Q
    );
  inst_shifter_buf_2_mux0000_57_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_55_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_59_Q,
      I4 => inst_shifter_buf_1_57_Q,
      O => inst_shifter_buf_2_57_Q
    );
  inst_shifter_buf_2_mux0000_55_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_53_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_57_Q,
      I4 => inst_shifter_buf_1_55_Q,
      O => inst_shifter_buf_2_55_Q
    );
  inst_shifter_buf_2_mux0000_54_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_52_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_56_Q,
      I4 => inst_shifter_buf_1_54_Q,
      O => inst_shifter_buf_2_54_Q
    );
  inst_shifter_buf_2_mux0000_53_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_51_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_55_Q,
      I4 => inst_shifter_buf_1_53_Q,
      O => inst_shifter_buf_2_53_Q
    );
  inst_shifter_buf_2_mux0000_51_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_49_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_53_Q,
      I4 => inst_shifter_buf_1_51_Q,
      O => inst_shifter_buf_2_51_Q
    );
  inst_shifter_buf_2_mux0000_50_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_48_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_52_Q,
      I4 => inst_shifter_buf_1_50_Q,
      O => inst_shifter_buf_2_50_Q
    );
  inst_shifter_buf_2_mux0000_49_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_51_Q,
      I4 => inst_shifter_buf_1_49_Q,
      O => inst_shifter_buf_2_49_Q
    );
  inst_shifter_buf_2_mux0000_47_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_49_Q,
      I4 => inst_shifter_buf_1_47_Q,
      O => inst_shifter_buf_2_47_Q
    );
  inst_shifter_buf_2_mux0000_46_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_48_Q,
      I4 => inst_shifter_buf_1_46_Q,
      O => inst_shifter_buf_2_46_Q
    );
  inst_shifter_buf_2_mux0000_45_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_47_Q,
      I4 => inst_shifter_buf_1_45_Q,
      O => inst_shifter_buf_2_45_Q
    );
  inst_shifter_buf_2_mux0000_43_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_45_Q,
      I4 => inst_shifter_buf_1_43_Q,
      O => inst_shifter_buf_2_43_Q
    );
  inst_shifter_buf_2_mux0000_42_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_44_Q,
      I4 => inst_shifter_buf_1_42_Q,
      O => inst_shifter_buf_2_42_Q
    );
  inst_shifter_buf_2_mux0000_41_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_43_Q,
      I4 => inst_shifter_buf_1_41_Q,
      O => inst_shifter_buf_2_41_Q
    );
  inst_shifter_buf_2_mux0000_3_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_1_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_5_Q,
      I4 => inst_shifter_buf_1_3_Q,
      O => inst_shifter_buf_2_3_Q
    );
  inst_shifter_buf_2_mux0000_39_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_41_Q,
      I4 => inst_shifter_buf_1_39_Q,
      O => inst_shifter_buf_2_39_Q
    );
  inst_shifter_buf_2_mux0000_38_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_40_Q,
      I4 => inst_shifter_buf_1_38_Q,
      O => inst_shifter_buf_2_38_Q
    );
  inst_shifter_buf_2_mux0000_37_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_39_Q,
      I4 => inst_shifter_buf_1_37_Q,
      O => inst_shifter_buf_2_37_Q
    );
  inst_shifter_buf_2_mux0000_35_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_33_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_37_Q,
      I4 => inst_shifter_buf_1_35_Q,
      O => inst_shifter_buf_2_35_Q
    );
  inst_shifter_buf_2_mux0000_34_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_36_Q,
      I4 => inst_shifter_buf_1_34_Q,
      O => inst_shifter_buf_2_34_Q
    );
  inst_shifter_buf_2_mux0000_33_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_35_Q,
      I4 => inst_shifter_buf_1_33_Q,
      O => inst_shifter_buf_2_33_Q
    );
  inst_shifter_buf_2_mux0000_31_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_33_Q,
      I4 => inst_shifter_buf_1_31_Q,
      O => inst_shifter_buf_2_31_Q
    );
  inst_shifter_buf_2_mux0000_30_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_32_Q,
      I4 => inst_shifter_buf_1_30_Q,
      O => inst_shifter_buf_2_30_Q
    );
  inst_shifter_buf_2_mux0000_29_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_31_Q,
      I4 => inst_shifter_buf_1_29_Q,
      O => inst_shifter_buf_2_29_Q
    );
  inst_shifter_buf_2_mux0000_27_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_29_Q,
      I4 => inst_shifter_buf_1_27_Q,
      O => inst_shifter_buf_2_27_Q
    );
  inst_shifter_buf_2_mux0000_26_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_28_Q,
      I4 => inst_shifter_buf_1_26_Q,
      O => inst_shifter_buf_2_26_Q
    );
  inst_shifter_buf_2_mux0000_25_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_27_Q,
      I4 => inst_shifter_buf_1_25_Q,
      O => inst_shifter_buf_2_25_Q
    );
  inst_shifter_buf_2_mux0000_23_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_25_Q,
      I4 => inst_shifter_buf_1_23_Q,
      O => inst_shifter_buf_2_23_Q
    );
  inst_shifter_buf_2_mux0000_22_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_24_Q,
      I4 => inst_shifter_buf_1_22_Q,
      O => inst_shifter_buf_2_22_Q
    );
  inst_shifter_buf_2_mux0000_21_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_23_Q,
      I4 => inst_shifter_buf_1_21_Q,
      O => inst_shifter_buf_2_21_Q
    );
  inst_shifter_buf_2_mux0000_19_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_21_Q,
      I4 => inst_shifter_buf_1_19_Q,
      O => inst_shifter_buf_2_19_Q
    );
  inst_shifter_buf_2_mux0000_18_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_16_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_20_Q,
      I4 => inst_shifter_buf_1_18_Q,
      O => inst_shifter_buf_2_18_Q
    );
  inst_shifter_buf_2_mux0000_17_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_15_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_19_Q,
      I4 => inst_shifter_buf_1_17_Q,
      O => inst_shifter_buf_2_17_Q
    );
  inst_shifter_buf_2_mux0000_15_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_13_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_17_Q,
      I4 => inst_shifter_buf_1_15_Q,
      O => inst_shifter_buf_2_15_Q
    );
  inst_shifter_buf_2_mux0000_14_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_12_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_16_Q,
      I4 => inst_shifter_buf_1_14_Q,
      O => inst_shifter_buf_2_14_Q
    );
  inst_shifter_buf_2_mux0000_13_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_11_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_15_Q,
      I4 => inst_shifter_buf_1_13_Q,
      O => inst_shifter_buf_2_13_Q
    );
  res_33_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(33),
      I1 => N83,
      I2 => op2(33),
      I3 => N72,
      I4 => N70,
      O => res_33_71_793
    );
  res_34_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(34),
      I1 => N83,
      I2 => op2(34),
      I3 => N72,
      I4 => N70,
      O => res_34_71_798
    );
  res_35_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(35),
      I1 => N83,
      I2 => op2(35),
      I3 => N72,
      I4 => N70,
      O => res_35_71_803
    );
  res_37_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(37),
      I1 => N83,
      I2 => op2(37),
      I3 => N72,
      I4 => N70,
      O => res_37_71_812
    );
  inst_shifter_buf_1_mux0000_41_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(40),
      I2 => shift_dir,
      I3 => op2(42),
      I4 => op2(41),
      O => inst_shifter_buf_1_41_Q
    );
  inst_shifter_buf_1_mux0000_39_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(38),
      I2 => shift_dir,
      I3 => op2(40),
      I4 => op2(39),
      O => inst_shifter_buf_1_39_Q
    );
  inst_shifter_buf_1_mux0000_37_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(36),
      I2 => shift_dir,
      I3 => op2(38),
      I4 => op2(37),
      O => inst_shifter_buf_1_37_Q
    );
  inst_shifter_buf_1_mux0000_35_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(34),
      I2 => shift_dir,
      I3 => op2(36),
      I4 => op2(35),
      O => inst_shifter_buf_1_35_Q
    );
  inst_shifter_buf_1_mux0000_61_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(60),
      I2 => shift_dir,
      I3 => op2(62),
      I4 => op2(61),
      O => inst_shifter_buf_1_61_Q
    );
  inst_shifter_buf_1_mux0000_59_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(58),
      I2 => shift_dir,
      I3 => op2(60),
      I4 => op2(59),
      O => inst_shifter_buf_1_59_Q
    );
  inst_shifter_buf_1_mux0000_57_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(56),
      I2 => shift_dir,
      I3 => op2(58),
      I4 => op2(57),
      O => inst_shifter_buf_1_57_Q
    );
  inst_shifter_buf_1_mux0000_55_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(54),
      I2 => shift_dir,
      I3 => op2(56),
      I4 => op2(55),
      O => inst_shifter_buf_1_55_Q
    );
  inst_shifter_buf_1_mux0000_53_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(52),
      I2 => shift_dir,
      I3 => op2(54),
      I4 => op2(53),
      O => inst_shifter_buf_1_53_Q
    );
  inst_shifter_buf_1_mux0000_51_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(50),
      I2 => shift_dir,
      I3 => op2(52),
      I4 => op2(51),
      O => inst_shifter_buf_1_51_Q
    );
  inst_shifter_buf_1_mux0000_49_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(48),
      I2 => shift_dir,
      I3 => op2(50),
      I4 => op2(49),
      O => inst_shifter_buf_1_49_Q
    );
  inst_shifter_buf_1_mux0000_47_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(46),
      I2 => shift_dir,
      I3 => op2(48),
      I4 => op2(47),
      O => inst_shifter_buf_1_47_Q
    );
  inst_shifter_buf_1_mux0000_45_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(44),
      I2 => shift_dir,
      I3 => op2(46),
      I4 => op2(45),
      O => inst_shifter_buf_1_45_Q
    );
  inst_shifter_buf_1_mux0000_43_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(42),
      I2 => shift_dir,
      I3 => op2(44),
      I4 => op2(43),
      O => inst_shifter_buf_1_43_Q
    );
  inst_shifter_buf_1_mux0000_27_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(26),
      I2 => shift_dir,
      I3 => op2(28),
      I4 => op2(27),
      O => inst_shifter_buf_1_27_Q
    );
  res_38_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(38),
      I1 => N83,
      I2 => op2(38),
      I3 => N72,
      I4 => N70,
      O => res_38_71_817
    );
  res_39_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(39),
      I1 => N83,
      I2 => op2(39),
      I3 => N72,
      I4 => N70,
      O => res_39_71_822
    );
  inst_shifter_buf_1_mux0000_19_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(18),
      I2 => shift_dir,
      I3 => op2(20),
      I4 => op2(19),
      O => inst_shifter_buf_1_19_Q
    );
  res_42_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(42),
      I1 => N83,
      I2 => op2(42),
      I3 => N72,
      I4 => N70,
      O => res_42_71_842
    );
  res_43_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(43),
      I1 => N83,
      I2 => op2(43),
      I3 => N72,
      I4 => N70,
      O => res_43_71_846
    );
  res_43_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N82,
      I1 => res_43_97_848,
      I2 => res_43_73_847,
      I3 => res_add(43),
      I4 => N78,
      I5 => res_43_100_844,
      O => res(43)
    );
  res_44_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(44),
      I1 => N83,
      I2 => op2(44),
      I3 => N72,
      I4 => N70,
      O => res_44_71_852
    );
  res_44_116 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_44_73_853,
      I1 => N78,
      I2 => res_add(44),
      I3 => N82,
      I4 => res_44_105_850,
      O => res(44)
    );
  res_45_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(45),
      I1 => N83,
      I2 => op2(45),
      I3 => N72,
      I4 => N70,
      O => res_45_71_857
    );
  res_45_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N82,
      I1 => res_45_97_859,
      I2 => res_45_73_858,
      I3 => res_add(45),
      I4 => N78,
      I5 => res_45_100_855,
      O => res(45)
    );
  res_56_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(56),
      I1 => N83,
      I2 => op2(56),
      I3 => N72,
      I4 => N70,
      O => res_56_71_913
    );
  inst_shifter_buf_1_mux0000_33_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(32),
      I2 => shift_dir,
      I3 => op2(34),
      I4 => op2(33),
      O => inst_shifter_buf_1_33_Q
    );
  inst_shifter_buf_1_mux0000_31_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(30),
      I2 => shift_dir,
      I3 => op2(32),
      I4 => op2(31),
      O => inst_shifter_buf_1_31_Q
    );
  inst_shifter_buf_1_mux0000_29_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(28),
      I2 => shift_dir,
      I3 => op2(30),
      I4 => op2(29),
      O => inst_shifter_buf_1_29_Q
    );
  inst_shifter_buf_1_mux0000_25_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(24),
      I2 => shift_dir,
      I3 => op2(26),
      I4 => op2(25),
      O => inst_shifter_buf_1_25_Q
    );
  inst_shifter_buf_1_mux0000_23_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(22),
      I2 => shift_dir,
      I3 => op2(24),
      I4 => op2(23),
      O => inst_shifter_buf_1_23_Q
    );
  inst_shifter_buf_1_mux0000_21_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(20),
      I2 => shift_dir,
      I3 => op2(22),
      I4 => op2(21),
      O => inst_shifter_buf_1_21_Q
    );
  inst_shifter_buf_1_mux0000_17_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(16),
      I2 => shift_dir,
      I3 => op2(18),
      I4 => op2(17),
      O => inst_shifter_buf_1_17_Q
    );
  inst_shifter_buf_1_mux0000_15_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(14),
      I2 => shift_dir,
      I3 => op2(16),
      I4 => op2(15),
      O => inst_shifter_buf_1_15_Q
    );
  res_46_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(46),
      I1 => N83,
      I2 => op2(46),
      I3 => N72,
      I4 => N70,
      O => res_46_71_863
    );
  res_46_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N82,
      I1 => res_46_97_865,
      I2 => res_46_73_864,
      I3 => res_add(46),
      I4 => N78,
      I5 => res_46_100_861,
      O => res(46)
    );
  res_47_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(47),
      I1 => N83,
      I2 => op2(47),
      I3 => N72,
      I4 => N70,
      O => res_47_71_869
    );
  res_47_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N82,
      I1 => res_47_97_871,
      I2 => res_47_73_870,
      I3 => res_add(47),
      I4 => N78,
      I5 => res_47_100_867,
      O => res(47)
    );
  inst_shifter_buf_4_mux0000_1_SW0 : LUT5
    generic map(
      INIT => X"FFFF1BBB"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_1_Q,
      I2 => inst_shifter_buf_1_3_Q,
      I3 => shift_dir,
      I4 => op1(2),
      O => N204
    );
  res_9_62 : LUT4
    generic map(
      INIT => X"DC10"
    )
    port map (
      I0 => op2(9),
      I1 => op1(9),
      I2 => N72,
      I3 => N70,
      O => res_9_62_963
    );
  res_9_77 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_9_49_962,
      I1 => res_9_62_963,
      I2 => N78,
      I3 => res_add(9),
      O => res_9_77_964
    );
  res_25_62 : LUT4
    generic map(
      INIT => X"DC10"
    )
    port map (
      I0 => op2(25),
      I1 => op1(25),
      I2 => N72,
      I3 => N70,
      O => res_25_62_747
    );
  res_25_77 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_25_49_746,
      I1 => res_25_62_747,
      I2 => N78,
      I3 => res_add(25),
      O => res_25_77_748
    );
  res_48_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(48),
      I1 => N83,
      I2 => op2(48),
      I3 => N72,
      I4 => N70,
      O => res_48_71_875
    );
  res_36_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(36),
      I1 => N83,
      I2 => op2(36),
      I3 => N72,
      I4 => N70,
      O => res_36_71_807
    );
  res_49_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(49),
      I1 => N83,
      I2 => op2(49),
      I3 => N72,
      I4 => N70,
      O => res_49_71_881
    );
  res_50_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(50),
      I1 => N83,
      I2 => op2(50),
      I3 => N72,
      I4 => N70,
      O => res_50_71_888
    );
  inst_shifter_buf_2_mux0000_11_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_13_Q,
      I4 => inst_shifter_buf_1_11_Q,
      O => inst_shifter_buf_2_11_Q
    );
  inst_shifter_buf_2_mux0000_10_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_8_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_12_Q,
      I4 => inst_shifter_buf_1_10_Q,
      O => inst_shifter_buf_2_10_Q
    );
  inst_shifter_buf_1_mux0000_9_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(8),
      I2 => shift_dir,
      I3 => op2(10),
      I4 => op2(9),
      O => inst_shifter_buf_1_9_Q
    );
  inst_shifter_buf_1_mux0000_5_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(4),
      I2 => shift_dir,
      I3 => op2(6),
      I4 => op2(5),
      O => inst_shifter_buf_1_5_Q
    );
  inst_shifter_buf_1_mux0000_13_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(12),
      I2 => shift_dir,
      I3 => op2(14),
      I4 => op2(13),
      O => inst_shifter_buf_1_13_Q
    );
  inst_shifter_buf_1_mux0000_11_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(10),
      I2 => shift_dir,
      I3 => op2(12),
      I4 => op2(11),
      O => inst_shifter_buf_1_11_Q
    );
  res_51_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(51),
      I1 => N83,
      I2 => op2(51),
      I3 => N72,
      I4 => N70,
      O => res_51_71_892
    );
  res_52_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(52),
      I1 => N83,
      I2 => op2(52),
      I3 => N72,
      I4 => N70,
      O => res_52_71_897
    );
  res_52_116 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_52_73_898,
      I1 => N78,
      I2 => res_add(52),
      I3 => N82,
      I4 => res_52_105_895,
      O => res(52)
    );
  overflow_or0000_SW0 : LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(3),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      O => N210
    );
  overflow_or0000 : LUT6
    generic map(
      INIT => X"000004A200005402"
    )
    port map (
      I0 => res_add(63),
      I1 => efct_op2(63),
      I2 => op_ctrl(1),
      I3 => op1(63),
      I4 => N210,
      I5 => op2(63),
      O => overflow
    );
  res_53_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(53),
      I1 => N83,
      I2 => op2(53),
      I3 => N72,
      I4 => N70,
      O => res_53_71_901
    );
  efct_op2_63_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => op2(63),
      I1 => comp_op2,
      I2 => N73,
      O => efct_op2(63)
    );
  inst_shifter_buf_1_mux0000_7_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(6),
      I2 => shift_dir,
      I3 => op2(8),
      I4 => op2(7),
      O => inst_shifter_buf_1_7_Q
    );
  inst_shifter_buf_1_mux0000_3_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(2),
      I2 => shift_dir,
      I3 => op2(4),
      I4 => op2(3),
      O => inst_shifter_buf_1_3_Q
    );
  inst_shifter_buf_1_mux0000_1_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(0),
      I2 => shift_dir,
      I3 => op2(2),
      I4 => op2(1),
      O => inst_shifter_buf_1_1_Q
    );
  inst_shifter_buf_3_mux0000_5_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_1_Q,
      I4 => op1(1),
      I5 => inst_shifter_buf_2_5_Q,
      O => inst_shifter_buf_3_5_Q
    );
  inst_shifter_buf_2_mux0000_2_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_4_Q,
      I2 => shift_dir,
      I3 => op2(0),
      I4 => op1(0),
      I5 => inst_shifter_buf_1_2_Q,
      O => inst_shifter_buf_2_2_Q
    );
  res_54_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(54),
      I1 => N83,
      I2 => op2(54),
      I3 => N72,
      I4 => N70,
      O => res_54_71_905
    );
  res_55_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(55),
      I1 => N83,
      I2 => op2(55),
      I3 => N72,
      I4 => N70,
      O => res_55_71_909
    );
  res_58_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(58),
      I1 => N83,
      I2 => op2(58),
      I3 => N72,
      I4 => N70,
      O => res_58_71_922
    );
  inst_shifter_buf_5_mux0000_41_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_57_Q,
      I4 => inst_shifter_buf_4_41_Q,
      O => inst_shifter_buf_5_41_Q
    );
  inst_shifter_buf_5_mux0000_28_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_12_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_44_Q,
      I4 => inst_shifter_buf_4_28_Q,
      O => inst_shifter_buf_5_28_Q
    );
  inst_shifter_buf_5_mux0000_25_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_41_Q,
      I4 => inst_shifter_buf_4_25_Q,
      O => inst_shifter_buf_5_25_Q
    );
  inst_shifter_buf_4_mux0000_20_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_12_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_28_Q,
      I4 => inst_shifter_buf_3_20_Q,
      O => inst_shifter_buf_4_20_Q
    );
  inst_shifter_buf_4_mux0000_12_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_4_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_20_Q,
      I4 => inst_shifter_buf_3_12_Q,
      O => inst_shifter_buf_4_12_Q
    );
  inst_shifter_buf_3_mux0000_59_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_55_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_63_Q,
      I4 => inst_shifter_buf_2_59_Q,
      O => inst_shifter_buf_3_59_Q
    );
  inst_shifter_buf_3_mux0000_57_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_53_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_61_Q,
      I4 => inst_shifter_buf_2_57_Q,
      O => inst_shifter_buf_3_57_Q
    );
  inst_shifter_buf_2_mux0000_61_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_59_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_63_Q,
      I4 => inst_shifter_buf_1_61_Q,
      O => inst_shifter_buf_2_61_Q
    );
  inst_shifter_buf_1_mux0000_63_1 : LUT5
    generic map(
      INIT => X"CE4EC444"
    )
    port map (
      I0 => op1(0),
      I1 => op2(63),
      I2 => shift_dir,
      I3 => shift_type,
      I4 => op2(62),
      O => inst_shifter_buf_1_63_Q
    );
  inst_shifter_buf_2_mux0000_63_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_61_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_1_63_Q,
      O => inst_shifter_buf_2_63_Q
    );
  res_63_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(63),
      I1 => N83,
      I2 => op2(63),
      I3 => N72,
      I4 => N70,
      O => res_63_71_947
    );
  res_62_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(62),
      I1 => N83,
      I2 => op2(62),
      I3 => N72,
      I4 => N70,
      O => res_62_71_943
    );
  res_61_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(61),
      I1 => N83,
      I2 => op2(61),
      I3 => N72,
      I4 => N70,
      O => res_61_71_939
    );
  res_60_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(60),
      I1 => N83,
      I2 => op2(60),
      I3 => N72,
      I4 => N70,
      O => res_60_71_934
    );
  res_60_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_60_73_935,
      I1 => N82,
      I2 => res_60_93_936,
      I3 => N78,
      I4 => res_add(60),
      O => res(60)
    );
  res_59_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(59),
      I1 => N83,
      I2 => op2(59),
      I3 => N72,
      I4 => N70,
      O => res_59_71_926
    );
  res_57_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(57),
      I1 => N83,
      I2 => op2(57),
      I3 => N72,
      I4 => N70,
      O => res_57_71_919
    );
  res_41_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(41),
      I1 => N83,
      I2 => op2(41),
      I3 => N72,
      I4 => N70,
      O => res_41_71_837
    );
  res_32_1112 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(0),
      O => N200
    );
  inst_shifter_buf_1_mux0000_8_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(7),
      I2 => shift_dir,
      I3 => op2(9),
      I4 => op2(8),
      O => inst_shifter_buf_1_8_Q
    );
  inst_shifter_buf_4_mux0000_48_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_56_Q,
      I4 => inst_shifter_buf_3_48_Q,
      O => inst_shifter_buf_4_48_Q
    );
  inst_shifter_buf_4_mux0000_32_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_40_Q,
      I4 => inst_shifter_buf_3_32_Q,
      O => inst_shifter_buf_4_32_Q
    );
  inst_shifter_buf_3_mux0000_56_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_52_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_60_Q,
      I4 => inst_shifter_buf_2_56_Q,
      O => inst_shifter_buf_3_56_Q
    );
  inst_shifter_buf_3_mux0000_48_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_52_Q,
      I4 => inst_shifter_buf_2_48_Q,
      O => inst_shifter_buf_3_48_Q
    );
  inst_shifter_buf_3_mux0000_40_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_44_Q,
      I4 => inst_shifter_buf_2_40_Q,
      O => inst_shifter_buf_3_40_Q
    );
  inst_shifter_buf_3_mux0000_32_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_36_Q,
      I4 => inst_shifter_buf_2_32_Q,
      O => inst_shifter_buf_3_32_Q
    );
  inst_shifter_buf_3_mux0000_24_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_28_Q,
      I4 => inst_shifter_buf_2_24_Q,
      O => inst_shifter_buf_3_24_Q
    );
  inst_shifter_buf_3_mux0000_16_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_12_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_20_Q,
      I4 => inst_shifter_buf_2_16_Q,
      O => inst_shifter_buf_3_16_Q
    );
  inst_shifter_buf_2_mux0000_60_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_58_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_62_Q,
      I4 => inst_shifter_buf_1_60_Q,
      O => inst_shifter_buf_2_60_Q
    );
  inst_shifter_buf_2_mux0000_56_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_54_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_58_Q,
      I4 => inst_shifter_buf_1_56_Q,
      O => inst_shifter_buf_2_56_Q
    );
  inst_shifter_buf_2_mux0000_52_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_50_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_54_Q,
      I4 => inst_shifter_buf_1_52_Q,
      O => inst_shifter_buf_2_52_Q
    );
  inst_shifter_buf_2_mux0000_48_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_50_Q,
      I4 => inst_shifter_buf_1_48_Q,
      O => inst_shifter_buf_2_48_Q
    );
  inst_shifter_buf_2_mux0000_44_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_46_Q,
      I4 => inst_shifter_buf_1_44_Q,
      O => inst_shifter_buf_2_44_Q
    );
  inst_shifter_buf_2_mux0000_40_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_42_Q,
      I4 => inst_shifter_buf_1_40_Q,
      O => inst_shifter_buf_2_40_Q
    );
  inst_shifter_buf_2_mux0000_36_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_38_Q,
      I4 => inst_shifter_buf_1_36_Q,
      O => inst_shifter_buf_2_36_Q
    );
  inst_shifter_buf_2_mux0000_32_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_34_Q,
      I4 => inst_shifter_buf_1_32_Q,
      O => inst_shifter_buf_2_32_Q
    );
  inst_shifter_buf_2_mux0000_28_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_30_Q,
      I4 => inst_shifter_buf_1_28_Q,
      O => inst_shifter_buf_2_28_Q
    );
  inst_shifter_buf_2_mux0000_24_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_26_Q,
      I4 => inst_shifter_buf_1_24_Q,
      O => inst_shifter_buf_2_24_Q
    );
  inst_shifter_buf_2_mux0000_20_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_22_Q,
      I4 => inst_shifter_buf_1_20_Q,
      O => inst_shifter_buf_2_20_Q
    );
  inst_shifter_buf_2_mux0000_16_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_14_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_18_Q,
      I4 => inst_shifter_buf_1_16_Q,
      O => inst_shifter_buf_2_16_Q
    );
  inst_shifter_buf_1_mux0000_62_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(61),
      I2 => shift_dir,
      I3 => op2(63),
      I4 => op2(62),
      O => inst_shifter_buf_1_62_Q
    );
  inst_shifter_buf_1_mux0000_60_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(59),
      I2 => shift_dir,
      I3 => op2(61),
      I4 => op2(60),
      O => inst_shifter_buf_1_60_Q
    );
  inst_shifter_buf_1_mux0000_58_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(57),
      I2 => shift_dir,
      I3 => op2(59),
      I4 => op2(58),
      O => inst_shifter_buf_1_58_Q
    );
  inst_shifter_buf_1_mux0000_56_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(55),
      I2 => shift_dir,
      I3 => op2(57),
      I4 => op2(56),
      O => inst_shifter_buf_1_56_Q
    );
  inst_shifter_buf_1_mux0000_54_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(53),
      I2 => shift_dir,
      I3 => op2(55),
      I4 => op2(54),
      O => inst_shifter_buf_1_54_Q
    );
  inst_shifter_buf_1_mux0000_52_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(51),
      I2 => shift_dir,
      I3 => op2(53),
      I4 => op2(52),
      O => inst_shifter_buf_1_52_Q
    );
  inst_shifter_buf_1_mux0000_50_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(49),
      I2 => shift_dir,
      I3 => op2(51),
      I4 => op2(50),
      O => inst_shifter_buf_1_50_Q
    );
  inst_shifter_buf_1_mux0000_48_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(47),
      I2 => shift_dir,
      I3 => op2(49),
      I4 => op2(48),
      O => inst_shifter_buf_1_48_Q
    );
  inst_shifter_buf_1_mux0000_46_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(45),
      I2 => shift_dir,
      I3 => op2(47),
      I4 => op2(46),
      O => inst_shifter_buf_1_46_Q
    );
  inst_shifter_buf_1_mux0000_44_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(43),
      I2 => shift_dir,
      I3 => op2(45),
      I4 => op2(44),
      O => inst_shifter_buf_1_44_Q
    );
  inst_shifter_buf_1_mux0000_42_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(41),
      I2 => shift_dir,
      I3 => op2(43),
      I4 => op2(42),
      O => inst_shifter_buf_1_42_Q
    );
  inst_shifter_buf_1_mux0000_40_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(39),
      I2 => shift_dir,
      I3 => op2(41),
      I4 => op2(40),
      O => inst_shifter_buf_1_40_Q
    );
  inst_shifter_buf_1_mux0000_38_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(37),
      I2 => shift_dir,
      I3 => op2(39),
      I4 => op2(38),
      O => inst_shifter_buf_1_38_Q
    );
  inst_shifter_buf_1_mux0000_36_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(35),
      I2 => shift_dir,
      I3 => op2(37),
      I4 => op2(36),
      O => inst_shifter_buf_1_36_Q
    );
  inst_shifter_buf_1_mux0000_34_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(33),
      I2 => shift_dir,
      I3 => op2(35),
      I4 => op2(34),
      O => inst_shifter_buf_1_34_Q
    );
  inst_shifter_buf_1_mux0000_32_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(31),
      I2 => shift_dir,
      I3 => op2(33),
      I4 => op2(32),
      O => inst_shifter_buf_1_32_Q
    );
  inst_shifter_buf_1_mux0000_30_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(29),
      I2 => shift_dir,
      I3 => op2(31),
      I4 => op2(30),
      O => inst_shifter_buf_1_30_Q
    );
  inst_shifter_buf_1_mux0000_28_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(27),
      I2 => shift_dir,
      I3 => op2(29),
      I4 => op2(28),
      O => inst_shifter_buf_1_28_Q
    );
  inst_shifter_buf_1_mux0000_26_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(25),
      I2 => shift_dir,
      I3 => op2(27),
      I4 => op2(26),
      O => inst_shifter_buf_1_26_Q
    );
  inst_shifter_buf_1_mux0000_24_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(23),
      I2 => shift_dir,
      I3 => op2(25),
      I4 => op2(24),
      O => inst_shifter_buf_1_24_Q
    );
  inst_shifter_buf_1_mux0000_22_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(21),
      I2 => shift_dir,
      I3 => op2(23),
      I4 => op2(22),
      O => inst_shifter_buf_1_22_Q
    );
  inst_shifter_buf_1_mux0000_20_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(19),
      I2 => shift_dir,
      I3 => op2(21),
      I4 => op2(20),
      O => inst_shifter_buf_1_20_Q
    );
  inst_shifter_buf_1_mux0000_18_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(17),
      I2 => shift_dir,
      I3 => op2(19),
      I4 => op2(18),
      O => inst_shifter_buf_1_18_Q
    );
  inst_shifter_buf_1_mux0000_16_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(15),
      I2 => shift_dir,
      I3 => op2(17),
      I4 => op2(16),
      O => inst_shifter_buf_1_16_Q
    );
  inst_shifter_buf_5_mux0000_32_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_16_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_48_Q,
      I4 => inst_shifter_buf_4_32_Q,
      O => inst_shifter_buf_5_32_Q
    );
  inst_shifter_buf_4_mux0000_16_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_8_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_24_Q,
      I4 => inst_shifter_buf_3_16_Q,
      O => inst_shifter_buf_4_16_Q
    );
  inst_shifter_buf_1_mux0000_4_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(3),
      I2 => shift_dir,
      I3 => op2(5),
      I4 => op2(4),
      O => inst_shifter_buf_1_4_Q
    );
  inst_shifter_buf_2_mux0000_12_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_10_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_14_Q,
      I4 => inst_shifter_buf_1_12_Q,
      O => inst_shifter_buf_2_12_Q
    );
  inst_shifter_buf_1_mux0000_14_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(13),
      I2 => shift_dir,
      I3 => op2(15),
      I4 => op2(14),
      O => inst_shifter_buf_1_14_Q
    );
  inst_shifter_buf_1_mux0000_12_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(11),
      I2 => shift_dir,
      I3 => op2(13),
      I4 => op2(12),
      O => inst_shifter_buf_1_12_Q
    );
  inst_shifter_buf_1_mux0000_10_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(9),
      I2 => shift_dir,
      I3 => op2(11),
      I4 => op2(10),
      O => inst_shifter_buf_1_10_Q
    );
  shift_dir1 : LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(1),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      I4 => op_ctrl(3),
      O => shift_dir
    );
  inst_shifter_buf_1_mux0000_6_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(5),
      I2 => shift_dir,
      I3 => op2(7),
      I4 => op2(6),
      O => inst_shifter_buf_1_6_Q
    );
  inst_shifter_buf_1_mux0000_2_1 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(0),
      I1 => op2(1),
      I2 => shift_dir,
      I3 => op2(3),
      I4 => op2(2),
      O => inst_shifter_buf_1_2_Q
    );
  res_0_130 : LUT6
    generic map(
      INIT => X"E6E08680E6E08781"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(4),
      I3 => res_add(64),
      I4 => op1(0),
      I5 => op2(0),
      O => res_0_130_662
    );
  comp_op2_or00001 : LUT5
    generic map(
      INIT => X"01540140"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(1),
      I2 => op_ctrl(0),
      I3 => op_ctrl(2),
      I4 => op_ctrl(3),
      O => comp_op2
    );
  res_0_43_SW0 : LUT5
    generic map(
      INIT => X"AB000100"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op1(63),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      I4 => shifter_out(0),
      O => N220
    );
  res_0_43 : LUT6
    generic map(
      INIT => X"FFFFFFFF888F8888"
    )
    port map (
      I0 => res_add(0),
      I1 => N78,
      I2 => op_ctrl(1),
      I3 => op_ctrl(3),
      I4 => N220,
      I5 => res_0_1_661,
      O => res_0_43_670
    );
  Madd_res_add_Madd_lut_64_Q : LUT5
    generic map(
      INIT => X"5DF72A80"
    )
    port map (
      I0 => signe,
      I1 => op2(63),
      I2 => N73,
      I3 => op1(63),
      I4 => comp_op2,
      O => Madd_res_add_Madd_lut(64)
    );
  Madd_res_add_Madd_lut_0_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(0),
      I1 => op2(0),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(0)
    );
  Madd_res_add_Madd_lut_1_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(1),
      I1 => op2(1),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(1)
    );
  Madd_res_add_Madd_lut_2_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(2),
      I1 => op2(2),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(2)
    );
  Madd_res_add_Madd_lut_3_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(3),
      I1 => op2(3),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(3)
    );
  Madd_res_add_Madd_lut_4_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(4),
      I1 => op2(4),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(4)
    );
  Madd_res_add_Madd_lut_5_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(5),
      I1 => op2(5),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(5)
    );
  Madd_res_add_Madd_lut_6_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(6),
      I1 => op2(6),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(6)
    );
  Madd_res_add_Madd_lut_7_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(7),
      I1 => op2(7),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(7)
    );
  Madd_res_add_Madd_lut_8_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(8),
      I1 => op2(8),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(8)
    );
  Madd_res_add_Madd_lut_9_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(9),
      I1 => op2(9),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(9)
    );
  Madd_res_add_Madd_lut_10_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(10),
      I1 => op2(10),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(10)
    );
  Madd_res_add_Madd_lut_11_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(11),
      I1 => op2(11),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(11)
    );
  Madd_res_add_Madd_lut_12_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(12),
      I1 => op2(12),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(12)
    );
  Madd_res_add_Madd_lut_13_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(13),
      I1 => op2(13),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(13)
    );
  Madd_res_add_Madd_lut_14_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(14),
      I1 => op2(14),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(14)
    );
  Madd_res_add_Madd_lut_15_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(15),
      I1 => op2(15),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(15)
    );
  Madd_res_add_Madd_lut_16_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(16),
      I1 => op2(16),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(16)
    );
  Madd_res_add_Madd_lut_17_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(17),
      I1 => op2(17),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(17)
    );
  Madd_res_add_Madd_lut_18_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(18),
      I1 => op2(18),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(18)
    );
  Madd_res_add_Madd_lut_19_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(19),
      I1 => op2(19),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(19)
    );
  Madd_res_add_Madd_lut_20_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(20),
      I1 => op2(20),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(20)
    );
  Madd_res_add_Madd_lut_21_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(21),
      I1 => op2(21),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(21)
    );
  Madd_res_add_Madd_lut_22_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(22),
      I1 => op2(22),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(22)
    );
  Madd_res_add_Madd_lut_23_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(23),
      I1 => op2(23),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(23)
    );
  Madd_res_add_Madd_lut_24_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(24),
      I1 => op2(24),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(24)
    );
  Madd_res_add_Madd_lut_25_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(25),
      I1 => op2(25),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(25)
    );
  Madd_res_add_Madd_lut_26_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(26),
      I1 => op2(26),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(26)
    );
  Madd_res_add_Madd_lut_27_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(27),
      I1 => op2(27),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(27)
    );
  Madd_res_add_Madd_lut_28_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(28),
      I1 => op2(28),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(28)
    );
  Madd_res_add_Madd_lut_29_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(29),
      I1 => op2(29),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(29)
    );
  Madd_res_add_Madd_lut_30_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(30),
      I1 => op2(30),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(30)
    );
  Madd_res_add_Madd_lut_31_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(31),
      I1 => op2(31),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(31)
    );
  Madd_res_add_Madd_lut_32_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(32),
      I1 => op2(32),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(32)
    );
  Madd_res_add_Madd_lut_33_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(33),
      I1 => op2(33),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(33)
    );
  Madd_res_add_Madd_lut_34_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(34),
      I1 => op2(34),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(34)
    );
  Madd_res_add_Madd_lut_35_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(35),
      I1 => op2(35),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(35)
    );
  Madd_res_add_Madd_lut_36_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(36),
      I1 => op2(36),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(36)
    );
  Madd_res_add_Madd_lut_37_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(37),
      I1 => op2(37),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(37)
    );
  Madd_res_add_Madd_lut_38_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(38),
      I1 => op2(38),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(38)
    );
  Madd_res_add_Madd_lut_39_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(39),
      I1 => op2(39),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(39)
    );
  Madd_res_add_Madd_lut_40_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(40),
      I1 => op2(40),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(40)
    );
  Madd_res_add_Madd_lut_41_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(41),
      I1 => op2(41),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(41)
    );
  Madd_res_add_Madd_lut_42_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(42),
      I1 => op2(42),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(42)
    );
  Madd_res_add_Madd_lut_43_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(43),
      I1 => op2(43),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(43)
    );
  Madd_res_add_Madd_lut_44_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(44),
      I1 => op2(44),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(44)
    );
  Madd_res_add_Madd_lut_45_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(45),
      I1 => op2(45),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(45)
    );
  Madd_res_add_Madd_lut_46_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(46),
      I1 => op2(46),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(46)
    );
  Madd_res_add_Madd_lut_47_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(47),
      I1 => op2(47),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(47)
    );
  Madd_res_add_Madd_lut_48_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(48),
      I1 => op2(48),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(48)
    );
  Madd_res_add_Madd_lut_49_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(49),
      I1 => op2(49),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(49)
    );
  Madd_res_add_Madd_lut_50_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(50),
      I1 => op2(50),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(50)
    );
  Madd_res_add_Madd_lut_51_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(51),
      I1 => op2(51),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(51)
    );
  Madd_res_add_Madd_lut_52_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(52),
      I1 => op2(52),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(52)
    );
  Madd_res_add_Madd_lut_53_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(53),
      I1 => op2(53),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(53)
    );
  Madd_res_add_Madd_lut_54_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(54),
      I1 => op2(54),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(54)
    );
  Madd_res_add_Madd_lut_55_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(55),
      I1 => op2(55),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(55)
    );
  Madd_res_add_Madd_lut_56_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(56),
      I1 => op2(56),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(56)
    );
  Madd_res_add_Madd_lut_57_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(57),
      I1 => op2(57),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(57)
    );
  Madd_res_add_Madd_lut_58_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(58),
      I1 => op2(58),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(58)
    );
  Madd_res_add_Madd_lut_59_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(59),
      I1 => op2(59),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(59)
    );
  Madd_res_add_Madd_lut_60_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(60),
      I1 => op2(60),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(60)
    );
  Madd_res_add_Madd_lut_61_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(61),
      I1 => op2(61),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(61)
    );
  Madd_res_add_Madd_lut_62_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(62),
      I1 => op2(62),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(62)
    );
  res_16_41 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => N72,
      I1 => op1(16),
      I2 => op2(16),
      O => res_16_41_696
    );
  res_16_87 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_16_63_697,
      I1 => N70,
      I2 => op1(16),
      I3 => N78,
      I4 => res_add(16),
      O => res_16_87_698
    );
  res_15_41 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => N72,
      I1 => op1(15),
      I2 => op2(15),
      O => res_15_41_692
    );
  res_15_87 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_15_63_693,
      I1 => N70,
      I2 => op1(15),
      I3 => N78,
      I4 => res_add(15),
      O => res_15_87_694
    );
  res_14_41 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => N72,
      I1 => op1(14),
      I2 => op2(14),
      O => res_14_41_688
    );
  res_14_87 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_14_63_689,
      I1 => N70,
      I2 => op1(14),
      I3 => N78,
      I4 => res_add(14),
      O => res_14_87_690
    );
  res_13_41 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => N72,
      I1 => op1(13),
      I2 => op2(13),
      O => res_13_41_684
    );
  res_13_87 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_13_63_685,
      I1 => N70,
      I2 => op1(13),
      I3 => N78,
      I4 => res_add(13),
      O => res_13_87_686
    );
  res_12_41 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => N72,
      I1 => op1(12),
      I2 => op2(12),
      O => res_12_41_680
    );
  res_12_87 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_12_63_681,
      I1 => N70,
      I2 => op1(12),
      I3 => N78,
      I4 => res_add(12),
      O => res_12_87_682
    );
  res_11_41 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => N72,
      I1 => op1(11),
      I2 => op2(11),
      O => res_11_41_676
    );
  res_11_87 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_11_63_677,
      I1 => N70,
      I2 => op1(11),
      I3 => N78,
      I4 => res_add(11),
      O => res_11_87_678
    );
  res_32_120 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_32_84_788,
      I1 => N78,
      I2 => res_add(32),
      I3 => N82,
      I4 => res_32_111,
      O => res(32)
    );
  res_33_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_33_42_792,
      I1 => res_33_71_793,
      I2 => N78,
      I3 => res_add(33),
      I4 => res_33_111_790,
      O => res(33)
    );
  res_34_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_34_42_797,
      I1 => res_34_71_798,
      I2 => N78,
      I3 => res_add(34),
      I4 => res_34_111_795,
      O => res(34)
    );
  res_35_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_35_42_802,
      I1 => res_35_71_803,
      I2 => N78,
      I3 => res_add(35),
      I4 => res_35_111_800,
      O => res(35)
    );
  res_37_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_37_42_811,
      I1 => res_37_71_812,
      I2 => N78,
      I3 => res_add(37),
      I4 => res_37_111_809,
      O => res(37)
    );
  res_38_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_38_42_816,
      I1 => res_38_71_817,
      I2 => N78,
      I3 => res_add(38),
      I4 => res_38_111_814,
      O => res(38)
    );
  res_39_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_39_42_821,
      I1 => res_39_71_822,
      I2 => N78,
      I3 => res_add(39),
      I4 => res_39_111_819,
      O => res(39)
    );
  res_42_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_42_42_841,
      I1 => res_42_71_842,
      I2 => N78,
      I3 => res_add(42),
      I4 => res_42_111_839,
      O => res(42)
    );
  res_43_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_43_33_845,
      I1 => res_43_71_846,
      I2 => N71,
      I3 => op2(43),
      O => res_43_73_847
    );
  res_44_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_44_33_851,
      I1 => res_44_71_852,
      I2 => N71,
      I3 => op2(44),
      O => res_44_73_853
    );
  res_45_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_45_33_856,
      I1 => res_45_71_857,
      I2 => N71,
      I3 => op2(45),
      O => res_45_73_858
    );
  res_56_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_56_33_912,
      I1 => res_56_71_913,
      I2 => N71,
      I3 => op2(56),
      O => res_56_73_914
    );
  res_46_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_46_33_862,
      I1 => res_46_71_863,
      I2 => N71,
      I3 => op2(46),
      O => res_46_73_864
    );
  res_47_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_47_33_868,
      I1 => res_47_71_869,
      I2 => N71,
      I3 => op2(47),
      O => res_47_73_870
    );
  res_48_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_48_33_874,
      I1 => res_48_71_875,
      I2 => N71,
      I3 => op2(48),
      O => res_48_73_876
    );
  res_48_115 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_48_73_876,
      I1 => res_48_100_873,
      I2 => N78,
      I3 => res_add(48),
      O => res(48)
    );
  res_49_112 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_49_42_880,
      I1 => res_49_71_881,
      I2 => N78,
      I3 => res_add(49),
      I4 => res_49_111_878,
      O => res(49)
    );
  res_50_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_50_33_887,
      I1 => res_50_71_888,
      I2 => N71,
      I3 => op2(50),
      O => res_50_73_889
    );
  res_51_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_51_33_891,
      I1 => res_51_71_892,
      I2 => N71,
      I3 => op2(51),
      O => res_51_73_893
    );
  res_52_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_52_33_896,
      I1 => res_52_71_897,
      I2 => N71,
      I3 => op2(52),
      O => res_52_73_898
    );
  res_53_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_53_33_900,
      I1 => res_53_71_901,
      I2 => N71,
      I3 => op2(53),
      O => res_53_73_902
    );
  res_54_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_54_33_904,
      I1 => res_54_71_905,
      I2 => N71,
      I3 => op2(54),
      O => res_54_73_906
    );
  res_55_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_55_33_908,
      I1 => res_55_71_909,
      I2 => N71,
      I3 => op2(55),
      O => res_55_73_910
    );
  res_58_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_58_33_921,
      I1 => res_58_71_922,
      I2 => N71,
      I3 => op2(58),
      O => res_58_73_923
    );
  res_63_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_63_33_946,
      I1 => res_63_71_947,
      I2 => N71,
      I3 => op2(63),
      O => res_63_73_948
    );
  res_62_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_62_33_942,
      I1 => res_62_71_943,
      I2 => N71,
      I3 => op2(62),
      O => res_62_73_944
    );
  res_61_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_61_33_938,
      I1 => res_61_71_939,
      I2 => N71,
      I3 => op2(61),
      O => res_61_73_940
    );
  res_60_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_60_33_933,
      I1 => res_60_71_934,
      I2 => N71,
      I3 => op2(60),
      O => res_60_73_935
    );
  res_59_73 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_59_33_925,
      I1 => res_59_71_926,
      I2 => N71,
      I3 => op2(59),
      O => res_59_73_927
    );
  res_57_113 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_57_42_918,
      I1 => res_57_71_919,
      I2 => N78,
      I3 => res_add(57),
      I4 => res_57_112_916,
      O => res(57)
    );
  res_41_113 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_41_42_836,
      I1 => res_41_71_837,
      I2 => N78,
      I3 => res_add(41),
      I4 => res_41_112_834,
      O => res(41)
    );
  res_36_116 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_36_42_806,
      I1 => res_add(36),
      I2 => N78,
      I3 => N232,
      I4 => N82,
      I5 => res_36_71_807,
      O => res(36)
    );
  efct_op2_64_11 : LUT5
    generic map(
      INIT => X"FFFF4D1B"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(4),
      O => N73
    );
  N701 : LUT5
    generic map(
      INIT => X"06000040"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      O => N70
    );
  res_8_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(8),
      I2 => op2(8),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_8_57_958
    );
  res_8_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_8_89_960,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_40_Q,
      I5 => inst_shifter_buf_5_8_Q,
      O => res(8)
    );
  res_16_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_16_87_698,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_48_Q,
      I5 => inst_shifter_buf_5_16_Q,
      O => res(16)
    );
  res_5_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(5),
      I2 => op2(5),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_5_57_929
    );
  res_5_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_5_89_931,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_37_Q,
      I5 => inst_shifter_buf_5_5_Q,
      O => res(5)
    );
  res_7_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(7),
      I2 => op2(7),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_7_57_954
    );
  res_7_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_7_89_956,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_39_Q,
      I5 => inst_shifter_buf_5_7_Q,
      O => res(7)
    );
  res_6_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(6),
      I2 => op2(6),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_6_57_950
    );
  res_6_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_6_89_952,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_38_Q,
      I5 => inst_shifter_buf_5_6_Q,
      O => res(6)
    );
  res_4_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(4),
      I2 => op2(4),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_4_57_883
    );
  res_4_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_4_89_885,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_36_Q,
      I5 => inst_shifter_buf_5_4_Q,
      O => res(4)
    );
  res_3_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(3),
      I2 => op2(3),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_3_57_824
    );
  res_3_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_3_89_826,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_35_Q,
      I5 => inst_shifter_buf_5_3_Q,
      O => res(3)
    );
  res_31_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(31),
      I2 => op2(31),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_31_57_779
    );
  res_30_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(30),
      I2 => op2(30),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_30_57_774
    );
  res_2_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(2),
      I2 => op2(2),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_2_57_770
    );
  res_2_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_2_89_772,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_34_Q,
      I5 => inst_shifter_buf_5_2_Q,
      O => res(2)
    );
  res_29_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(29),
      I2 => op2(29),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_29_57_765
    );
  res_28_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(28),
      I2 => op2(28),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_28_57_760
    );
  res_27_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(27),
      I2 => op2(27),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_27_57_755
    );
  res_26_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(26),
      I2 => op2(26),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_26_57_750
    );
  res_23_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(23),
      I2 => op2(23),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_23_57_735
    );
  res_22_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(22),
      I2 => op2(22),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_22_57_730
    );
  res_21_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(21),
      I2 => op2(21),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_21_57_725
    );
  res_1_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(1),
      I2 => op2(1),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_1_57_715
    );
  res_1_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_1_89_717,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_33_Q,
      I5 => inst_shifter_buf_5_1_Q,
      O => res(1)
    );
  res_19_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(19),
      I2 => op2(19),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_19_57_710
    );
  res_18_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(18),
      I2 => op2(18),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_18_57_705
    );
  res_17_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(17),
      I2 => op2(17),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_17_57_700
    );
  res_17_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_17_86,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_49_Q,
      I5 => inst_shifter_buf_5_17_Q,
      O => res(17)
    );
  res_15_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_15_87_694,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_47_Q,
      I5 => inst_shifter_buf_5_15_Q,
      O => res(15)
    );
  res_14_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_14_87_690,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_46_Q,
      I5 => inst_shifter_buf_5_14_Q,
      O => res(14)
    );
  res_13_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_13_87_686,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_45_Q,
      I5 => inst_shifter_buf_5_13_Q,
      O => res(13)
    );
  res_12_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_12_87_682,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_44_Q,
      I5 => inst_shifter_buf_5_12_Q,
      O => res(12)
    );
  res_11_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_11_87_678,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_43_Q,
      I5 => inst_shifter_buf_5_11_Q,
      O => res(11)
    );
  res_10_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N76,
      I1 => op1(10),
      I2 => op2(10),
      I3 => op_ctrl(1),
      I4 => N72,
      I5 => op_ctrl(0),
      O => res_10_57_672
    );
  res_10_114 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_10_89_674,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_42_Q,
      I5 => inst_shifter_buf_5_10_Q,
      O => res(10)
    );
  res_33_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(33),
      I1 => op2(33),
      I2 => op_ctrl(4),
      I3 => op2(1),
      I4 => op_ctrl(0),
      O => res_33_29_791
    );
  res_33_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_33_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_1_Q,
      I5 => shift_dir,
      O => res_33_111_790
    );
  res_34_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(34),
      I1 => op2(34),
      I2 => op_ctrl(4),
      I3 => op2(2),
      I4 => op_ctrl(0),
      O => res_34_29_796
    );
  res_34_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_34_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_2_Q,
      I5 => shift_dir,
      O => res_34_111_795
    );
  res_35_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(35),
      I1 => op2(35),
      I2 => op_ctrl(4),
      I3 => op2(3),
      I4 => op_ctrl(0),
      O => res_35_29_801
    );
  res_35_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_35_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_3_Q,
      I5 => shift_dir,
      O => res_35_111_800
    );
  res_37_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(37),
      I1 => op2(37),
      I2 => op_ctrl(4),
      I3 => op2(5),
      I4 => op_ctrl(0),
      O => res_37_29_810
    );
  res_37_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_37_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_5_Q,
      I5 => shift_dir,
      O => res_37_111_809
    );
  res_38_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(38),
      I1 => op2(38),
      I2 => op_ctrl(4),
      I3 => op2(6),
      I4 => op_ctrl(0),
      O => res_38_29_815
    );
  res_38_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_38_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_6_Q,
      I5 => shift_dir,
      O => res_38_111_814
    );
  res_39_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(39),
      I1 => op2(39),
      I2 => op_ctrl(4),
      I3 => op2(7),
      I4 => op_ctrl(0),
      O => res_39_29_820
    );
  res_39_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_39_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_7_Q,
      I5 => shift_dir,
      O => res_39_111_819
    );
  res_42_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(42),
      I1 => op2(42),
      I2 => op_ctrl(4),
      I3 => op2(10),
      I4 => op_ctrl(0),
      O => res_42_29_840
    );
  res_42_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_42_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_10_Q,
      I5 => shift_dir,
      O => res_42_111_839
    );
  res_9_49 : LUT6
    generic map(
      INIT => X"EAAA4880EAAA4800"
    )
    port map (
      I0 => op2(9),
      I1 => N76,
      I2 => op1(9),
      I3 => op_ctrl(1),
      I4 => N71,
      I5 => op_ctrl(0),
      O => res_9_49_962
    );
  res_9_104 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_9_77_964,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_41_Q,
      I5 => inst_shifter_buf_5_9_Q,
      O => res(9)
    );
  res_25_49 : LUT6
    generic map(
      INIT => X"EAAA4880EAAA4800"
    )
    port map (
      I0 => op2(25),
      I1 => N76,
      I2 => op1(25),
      I3 => op_ctrl(1),
      I4 => N71,
      I5 => op_ctrl(0),
      O => res_25_49_746
    );
  res_25_104 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_25_77_748,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_57_Q,
      I5 => inst_shifter_buf_5_25_Q,
      O => res(25)
    );
  res_48_100 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_48_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_16_Q,
      I5 => shift_dir,
      O => res_48_100_873
    );
  res_36_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(36),
      I1 => op2(36),
      I2 => op_ctrl(4),
      I3 => op2(4),
      I4 => op_ctrl(0),
      O => res_36_29_805
    );
  res_49_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(49),
      I1 => op2(49),
      I2 => op_ctrl(4),
      I3 => op2(17),
      I4 => op_ctrl(0),
      O => res_49_29_879
    );
  res_49_111 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_49_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_17_Q,
      I5 => shift_dir,
      O => res_49_111_878
    );
  res_57_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(57),
      I1 => op2(57),
      I2 => op_ctrl(4),
      I3 => op2(25),
      I4 => op_ctrl(0),
      O => res_57_29_917
    );
  res_57_112 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_57_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_25_Q,
      I5 => shift_dir,
      O => res_57_112_916
    );
  res_41_29 : LUT5
    generic map(
      INIT => X"0606F606"
    )
    port map (
      I0 => op1(41),
      I1 => op2(41),
      I2 => op_ctrl(4),
      I3 => op2(9),
      I4 => op_ctrl(0),
      O => res_41_29_835
    );
  res_41_112 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N82,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_41_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_9_Q,
      I5 => shift_dir,
      O => res_41_112_834
    );
  Madd_res_add_Madd_lut_63_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(63),
      I1 => op2(63),
      I2 => comp_op2,
      I3 => N73,
      O => Madd_res_add_Madd_lut(63)
    );
  res_32_41 : LUT5
    generic map(
      INIT => X"00400000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(4),
      O => N71
    );
  res_33_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_33_29_791,
      I4 => N71,
      I5 => op2(33),
      O => res_33_42_792
    );
  res_34_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_34_29_796,
      I4 => N71,
      I5 => op2(34),
      O => res_34_42_797
    );
  res_35_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_35_29_801,
      I4 => N71,
      I5 => op2(35),
      O => res_35_42_802
    );
  res_37_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_37_29_810,
      I4 => N71,
      I5 => op2(37),
      O => res_37_42_811
    );
  res_38_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_38_29_815,
      I4 => N71,
      I5 => op2(38),
      O => res_38_42_816
    );
  res_39_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_39_29_820,
      I4 => N71,
      I5 => op2(39),
      O => res_39_42_821
    );
  res_42_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_42_29_840,
      I4 => N71,
      I5 => op2(42),
      O => res_42_42_841
    );
  res_43_100 : LUT6
    generic map(
      INIT => X"5515440451114000"
    )
    port map (
      I0 => op1(5),
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_59_Q,
      I4 => inst_shifter_buf_4_43_Q,
      I5 => inst_shifter_buf_4_27_Q,
      O => res_43_100_844
    );
  res_45_100 : LUT6
    generic map(
      INIT => X"5515440451114000"
    )
    port map (
      I0 => op1(5),
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_61_Q,
      I4 => inst_shifter_buf_4_45_Q,
      I5 => inst_shifter_buf_4_29_Q,
      O => res_45_100_855
    );
  res_46_100 : LUT6
    generic map(
      INIT => X"5515440451114000"
    )
    port map (
      I0 => op1(5),
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_62_Q,
      I4 => inst_shifter_buf_4_46_Q,
      I5 => inst_shifter_buf_4_30_Q,
      O => res_46_100_861
    );
  res_47_100 : LUT6
    generic map(
      INIT => X"5515440451114000"
    )
    port map (
      I0 => op1(5),
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_63_Q,
      I4 => inst_shifter_buf_4_47_Q,
      I5 => inst_shifter_buf_4_31_Q,
      O => res_47_100_867
    );
  res_36_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_36_29_805,
      I4 => N71,
      I5 => op2(36),
      O => res_36_42_806
    );
  res_49_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_49_29_879,
      I4 => N71,
      I5 => op2(49),
      O => res_49_42_880
    );
  inst_shifter_buf_2_mux0000_62_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_60_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_1_62_Q,
      O => inst_shifter_buf_2_62_Q
    );
  res_57_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_57_29_917,
      I4 => N71,
      I5 => op2(57),
      O => res_57_42_918
    );
  res_41_42 : LUT6
    generic map(
      INIT => X"FFFF080008000800"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => res_41_29_835,
      I4 => N71,
      I5 => op2(41),
      O => res_41_42_836
    );
  shift_type_cmp_eq00001 : LUT5
    generic map(
      INIT => X"00400000"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(2),
      I2 => op_ctrl(4),
      I3 => op_ctrl(1),
      I4 => op_ctrl(0),
      O => shift_type
    );
  res_56_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_56_73_914,
      I1 => res_add(56),
      I2 => N78,
      I3 => N234,
      I4 => N82,
      O => res(56)
    );
  res_50_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_50_73_889,
      I1 => res_add(50),
      I2 => N78,
      I3 => N236,
      I4 => N82,
      O => res(50)
    );
  res_51_116 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_51_73_893,
      I1 => res_add(51),
      I2 => N78,
      I3 => N238,
      I4 => N82,
      O => res(51)
    );
  res_53_116 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_53_73_902,
      I1 => res_add(53),
      I2 => N78,
      I3 => N240,
      I4 => N82,
      O => res(53)
    );
  res_54_116 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_54_73_906,
      I1 => res_add(54),
      I2 => N78,
      I3 => N242,
      I4 => N82,
      O => res(54)
    );
  res_55_116 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_55_73_910,
      I1 => res_add(55),
      I2 => N78,
      I3 => N244,
      I4 => N82,
      O => res(55)
    );
  res_58_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_58_73_923,
      I1 => res_add(58),
      I2 => N78,
      I3 => N246,
      I4 => N82,
      O => res(58)
    );
  res_63_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_63_73_948,
      I1 => res_add(63),
      I2 => N78,
      I3 => N248,
      I4 => N82,
      O => res(63)
    );
  res_62_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_62_73_944,
      I1 => res_add(62),
      I2 => N78,
      I3 => N250,
      I4 => N82,
      O => res(62)
    );
  res_61_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_61_73_940,
      I1 => res_add(61),
      I2 => N78,
      I3 => N252,
      I4 => N82,
      O => res(61)
    );
  res_59_117 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_59_73_927,
      I1 => res_add(59),
      I2 => N78,
      I3 => N254,
      I4 => N82,
      O => res(59)
    );
  inst_shifter_buf_5_mux0000_23_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_7_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_23_Q,
      O => inst_shifter_buf_5_23_Q
    );
  inst_shifter_buf_5_mux0000_22_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_6_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_22_Q,
      O => inst_shifter_buf_5_22_Q
    );
  inst_shifter_buf_5_mux0000_21_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_5_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_21_Q,
      O => inst_shifter_buf_5_21_Q
    );
  inst_shifter_buf_5_mux0000_19_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_3_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_19_Q,
      O => inst_shifter_buf_5_19_Q
    );
  inst_shifter_buf_5_mux0000_18_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_2_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_18_Q,
      O => inst_shifter_buf_5_18_Q
    );
  inst_shifter_buf_4_mux0000_10_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_2_Q,
      I4 => op1(2),
      I5 => inst_shifter_buf_3_10_Q,
      O => inst_shifter_buf_4_10_Q
    );
  inst_shifter_buf_5_mux0000_20_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_4_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_20_Q,
      O => inst_shifter_buf_5_20_Q
    );
  inst_shifter_buf_5_mux0000_16_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_0_Q,
      I4 => op1(3),
      I5 => inst_shifter_buf_4_16_Q,
      O => inst_shifter_buf_5_16_Q
    );
  inst_shifter_buf_4_mux0000_11_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_3_Q,
      I4 => op1(2),
      I5 => inst_shifter_buf_3_11_Q,
      O => inst_shifter_buf_4_11_Q
    );
  inst_shifter_buf_5_mux0000_8_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_32_Q,
      I4 => inst_shifter_buf_3_24_Q,
      I5 => inst_shifter_buf_4_8_Q,
      O => inst_shifter_buf_5_8_Q
    );
  inst_shifter_buf_5_mux0000_15_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_39_Q,
      I4 => inst_shifter_buf_3_31_Q,
      I5 => inst_shifter_buf_4_15_Q,
      O => inst_shifter_buf_5_15_Q
    );
  inst_shifter_buf_5_mux0000_14_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_38_Q,
      I4 => inst_shifter_buf_3_30_Q,
      I5 => inst_shifter_buf_4_14_Q,
      O => inst_shifter_buf_5_14_Q
    );
  inst_shifter_buf_5_mux0000_13_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_37_Q,
      I4 => inst_shifter_buf_3_29_Q,
      I5 => inst_shifter_buf_4_13_Q,
      O => inst_shifter_buf_5_13_Q
    );
  inst_shifter_buf_5_mux0000_11_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_35_Q,
      I4 => inst_shifter_buf_3_27_Q,
      I5 => inst_shifter_buf_4_11_Q,
      O => inst_shifter_buf_5_11_Q
    );
  inst_shifter_buf_5_mux0000_10_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_34_Q,
      I4 => inst_shifter_buf_3_26_Q,
      I5 => inst_shifter_buf_4_10_Q,
      O => inst_shifter_buf_5_10_Q
    );
  inst_shifter_buf_5_mux0000_12_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_36_Q,
      I4 => inst_shifter_buf_3_28_Q,
      I5 => inst_shifter_buf_4_12_Q,
      O => inst_shifter_buf_5_12_Q
    );
  inst_shifter_buf_5_mux0000_9_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_33_Q,
      I4 => inst_shifter_buf_3_25_Q,
      I5 => inst_shifter_buf_4_9_Q,
      O => inst_shifter_buf_5_9_Q
    );
  inst_shifter_buf_5_mux0000_4_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_28_Q,
      I4 => inst_shifter_buf_3_20_Q,
      I5 => inst_shifter_buf_4_4_Q,
      O => inst_shifter_buf_5_4_Q
    );
  inst_shifter_buf_6_mux0000_0_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(5),
      I1 => shift_dir,
      I2 => op1(4),
      I3 => inst_shifter_buf_4_48_Q,
      I4 => inst_shifter_buf_4_32_Q,
      I5 => inst_shifter_buf_5_0_Q,
      O => shifter_out(0)
    );
  res_31_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_31_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_63_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_31_Q,
      O => res(31)
    );
  res_30_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_30_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_62_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_30_Q,
      O => res(30)
    );
  res_29_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_29_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_61_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_29_Q,
      O => res(29)
    );
  res_28_113 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_28_86,
      I1 => N82,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_60_Q,
      I5 => inst_shifter_buf_5_28_Q,
      O => res(28)
    );
  res_27_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_27_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_59_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_27_Q,
      O => res(27)
    );
  res_26_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_26_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_58_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_26_Q,
      O => res(26)
    );
  res_23_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_23_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_55_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_23_Q,
      O => res(23)
    );
  res_22_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_22_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_54_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_22_Q,
      O => res(22)
    );
  res_21_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_21_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_53_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_21_Q,
      O => res(21)
    );
  res_19_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_19_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_51_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_19_Q,
      O => res(19)
    );
  res_18_112 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_18_86,
      I1 => N82,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_50_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_18_Q,
      O => res(18)
    );
  inst_shifter_buf_6_mux0000_32_21 : LUT6
    generic map(
      INIT => X"0000400000000000"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(1),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      I4 => op_ctrl(3),
      I5 => op1(5),
      O => inst_shifter_N10
    );
  res_8_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(8),
      O => res_8_72_959
    );
  res_5_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(5),
      O => res_5_72_930
    );
  res_7_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(7),
      O => res_7_72_955
    );
  res_6_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(6),
      O => res_6_72_951
    );
  res_4_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(4),
      O => res_4_72_884
    );
  res_3_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(3),
      O => res_3_72_825
    );
  res_2_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(2),
      O => res_2_72_771
    );
  res_1_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(1),
      O => res_1_72_716
    );
  res_10_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(10),
      O => res_10_72_673
    );
  res_0_1 : LUT6
    generic map(
      INIT => X"0000400000000000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(4),
      I2 => op_ctrl(3),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      I5 => op2(0),
      O => res_0_1_661
    );
  inst_shifter_buf_4_mux0000_58_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_50_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_58_Q,
      O => inst_shifter_buf_4_58_Q
    );
  inst_shifter_buf_4_mux0000_63_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_55_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_63_Q,
      O => inst_shifter_buf_4_63_Q
    );
  inst_shifter_buf_4_mux0000_62_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_54_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_62_Q,
      O => inst_shifter_buf_4_62_Q
    );
  inst_shifter_buf_4_mux0000_61_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_53_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_61_Q,
      O => inst_shifter_buf_4_61_Q
    );
  inst_shifter_buf_4_mux0000_59_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_51_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_59_Q,
      O => inst_shifter_buf_4_59_Q
    );
  inst_shifter_buf_4_mux0000_57_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_49_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_57_Q,
      O => inst_shifter_buf_4_57_Q
    );
  inst_shifter_buf_3_mux0000_63_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_59_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_2_63_Q,
      O => inst_shifter_buf_3_63_Q
    );
  inst_shifter_buf_3_mux0000_62_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_58_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_2_62_Q,
      O => inst_shifter_buf_3_62_Q
    );
  inst_shifter_buf_3_mux0000_61_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_57_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_2_61_Q,
      O => inst_shifter_buf_3_61_Q
    );
  inst_shifter_buf_4_mux0000_56_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_48_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_56_Q,
      O => inst_shifter_buf_4_56_Q
    );
  inst_shifter_buf_4_mux0000_60_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_52_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_3_60_Q,
      O => inst_shifter_buf_4_60_Q
    );
  inst_shifter_buf_3_mux0000_60_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_56_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_2_60_Q,
      O => inst_shifter_buf_3_60_Q
    );
  res_32_112 : LUT5
    generic map(
      INIT => X"00020000"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(4),
      I2 => op_ctrl(3),
      I3 => op_ctrl(1),
      I4 => op_ctrl(0),
      O => N83
    );
  inst_shifter_buf_5_mux0000_17_1 : LUT6
    generic map(
      INIT => X"D580D580D580F7A2"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => inst_shifter_buf_4_33_Q,
      I3 => inst_shifter_buf_4_17_Q,
      I4 => op1(3),
      I5 => N204,
      O => inst_shifter_buf_5_17_Q
    );
  res_36_116_SW0 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_sign_extd(0),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_4_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_36_Q,
      O => N232
    );
  inst_shifter_buf_3_mux0000_2_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(2),
      I1 => shift_dir,
      I2 => op1(1),
      I3 => inst_shifter_buf_1_8_Q,
      I4 => inst_shifter_buf_1_6_Q,
      I5 => inst_shifter_buf_2_2_Q,
      O => inst_shifter_buf_3_2_Q
    );
  inst_shifter_buf_5_mux0000_52_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_36_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_52_Q,
      O => inst_shifter_buf_5_52_Q
    );
  inst_shifter_buf_3_mux0000_3_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(2),
      I1 => shift_dir,
      I2 => op1(1),
      I3 => inst_shifter_buf_1_9_Q,
      I4 => inst_shifter_buf_1_7_Q,
      I5 => inst_shifter_buf_2_3_Q,
      O => inst_shifter_buf_3_3_Q
    );
  inst_shifter_buf_5_mux0000_60_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_44_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_60_Q,
      O => inst_shifter_buf_5_60_Q
    );
  inst_shifter_buf_5_mux0000_58_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_42_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_58_Q,
      O => inst_shifter_buf_5_58_Q
    );
  inst_shifter_buf_5_mux0000_56_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_40_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_56_Q,
      O => inst_shifter_buf_5_56_Q
    );
  inst_shifter_buf_5_mux0000_55_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_39_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_55_Q,
      O => inst_shifter_buf_5_55_Q
    );
  inst_shifter_buf_5_mux0000_54_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_38_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_54_Q,
      O => inst_shifter_buf_5_54_Q
    );
  inst_shifter_buf_5_mux0000_53_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_37_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_53_Q,
      O => inst_shifter_buf_5_53_Q
    );
  inst_shifter_buf_5_mux0000_51_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_35_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_51_Q,
      O => inst_shifter_buf_5_51_Q
    );
  inst_shifter_buf_5_mux0000_50_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_34_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_50_Q,
      O => inst_shifter_buf_5_50_Q
    );
  inst_shifter_buf_5_mux0000_49_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_33_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_49_Q,
      O => inst_shifter_buf_5_49_Q
    );
  inst_shifter_buf_5_mux0000_48_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_32_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_48_Q,
      O => inst_shifter_buf_5_48_Q
    );
  inst_shifter_buf_5_mux0000_63_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_47_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_63_Q,
      O => inst_shifter_buf_5_63_Q
    );
  inst_shifter_buf_5_mux0000_62_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_46_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_62_Q,
      O => inst_shifter_buf_5_62_Q
    );
  inst_shifter_buf_5_mux0000_61_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_45_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_61_Q,
      O => inst_shifter_buf_5_61_Q
    );
  inst_shifter_buf_5_mux0000_59_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_43_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_59_Q,
      O => inst_shifter_buf_5_59_Q
    );
  inst_shifter_buf_5_mux0000_57_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_41_Q,
      I2 => shift_dir,
      I3 => op2(63),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_57_Q,
      O => inst_shifter_buf_5_57_Q
    );
  inst_shifter_buf_4_mux0000_4_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => inst_shifter_buf_2_16_Q,
      I4 => inst_shifter_buf_2_12_Q,
      I5 => inst_shifter_buf_3_4_Q,
      O => inst_shifter_buf_4_4_Q
    );
  res_56_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_24_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_56_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N234
    );
  res_50_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_18_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_50_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N236
    );
  res_51_116_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_19_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_51_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N238
    );
  res_53_116_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_21_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_53_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N240
    );
  res_54_116_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_22_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_54_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N242
    );
  res_55_116_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_23_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_55_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N244
    );
  res_58_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_26_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_58_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N246
    );
  res_63_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_31_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_63_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N248
    );
  res_62_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_30_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_62_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N250
    );
  res_61_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_29_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_61_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N252
    );
  res_59_117_SW0 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_27_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_59_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => N254
    );
  res_43_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(43),
      I2 => op2(43),
      I3 => op_ctrl(4),
      I4 => op2(11),
      I5 => op_ctrl(0),
      O => res_43_33_845
    );
  res_44_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(44),
      I2 => op2(44),
      I3 => op_ctrl(4),
      I4 => op2(12),
      I5 => op_ctrl(0),
      O => res_44_33_851
    );
  res_45_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(45),
      I2 => op2(45),
      I3 => op_ctrl(4),
      I4 => op2(13),
      I5 => op_ctrl(0),
      O => res_45_33_856
    );
  res_56_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(56),
      I2 => op2(56),
      I3 => op_ctrl(4),
      I4 => op2(24),
      I5 => op_ctrl(0),
      O => res_56_33_912
    );
  res_46_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(46),
      I2 => op2(46),
      I3 => op_ctrl(4),
      I4 => op2(14),
      I5 => op_ctrl(0),
      O => res_46_33_862
    );
  res_47_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(47),
      I2 => op2(47),
      I3 => op_ctrl(4),
      I4 => op2(15),
      I5 => op_ctrl(0),
      O => res_47_33_868
    );
  res_48_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(48),
      I2 => op2(48),
      I3 => op_ctrl(4),
      I4 => op2(16),
      I5 => op_ctrl(0),
      O => res_48_33_874
    );
  res_50_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(50),
      I2 => op2(50),
      I3 => op_ctrl(4),
      I4 => op2(18),
      I5 => op_ctrl(0),
      O => res_50_33_887
    );
  res_51_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(51),
      I2 => op2(51),
      I3 => op_ctrl(4),
      I4 => op2(19),
      I5 => op_ctrl(0),
      O => res_51_33_891
    );
  res_52_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(52),
      I2 => op2(52),
      I3 => op_ctrl(4),
      I4 => op2(20),
      I5 => op_ctrl(0),
      O => res_52_33_896
    );
  res_53_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(53),
      I2 => op2(53),
      I3 => op_ctrl(4),
      I4 => op2(21),
      I5 => op_ctrl(0),
      O => res_53_33_900
    );
  res_54_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(54),
      I2 => op2(54),
      I3 => op_ctrl(4),
      I4 => op2(22),
      I5 => op_ctrl(0),
      O => res_54_33_904
    );
  res_55_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(55),
      I2 => op2(55),
      I3 => op_ctrl(4),
      I4 => op2(23),
      I5 => op_ctrl(0),
      O => res_55_33_908
    );
  res_58_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(58),
      I2 => op2(58),
      I3 => op_ctrl(4),
      I4 => op2(26),
      I5 => op_ctrl(0),
      O => res_58_33_921
    );
  res_63_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(63),
      I2 => op2(63),
      I3 => op_ctrl(4),
      I4 => op2(31),
      I5 => op_ctrl(0),
      O => res_63_33_946
    );
  res_62_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(62),
      I2 => op2(62),
      I3 => op_ctrl(4),
      I4 => op2(30),
      I5 => op_ctrl(0),
      O => res_62_33_942
    );
  res_61_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(61),
      I2 => op2(61),
      I3 => op_ctrl(4),
      I4 => op2(29),
      I5 => op_ctrl(0),
      O => res_61_33_938
    );
  res_60_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(60),
      I2 => op2(60),
      I3 => op_ctrl(4),
      I4 => op2(28),
      I5 => op_ctrl(0),
      O => res_60_33_933
    );
  res_59_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N84,
      I1 => op1(59),
      I2 => op2(59),
      I3 => op_ctrl(4),
      I4 => op2(27),
      I5 => op_ctrl(0),
      O => res_59_33_925
    );
  res_32_1111 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_0_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_32_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => res_32_111
    );
  res_40_112 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_8_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_40_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => res_40_112_828
    );
  res_44_105 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_12_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_44_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => res_44_105_850
    );
  res_52_105 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_20_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_52_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => res_52_105_895
    );
  res_60_93 : LUT6
    generic map(
      INIT => X"FFF88F888F888F88"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_28_Q,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_60_Q,
      I4 => shift_dir,
      I5 => inst_shifter_sign_extd(0),
      O => res_60_93_936
    );
  inst_shifter_sign_extd_0_1 : LUT6
    generic map(
      INIT => X"0000400000000000"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op2(63),
      I2 => op_ctrl(2),
      I3 => op_ctrl(4),
      I4 => op_ctrl(1),
      I5 => op_ctrl(0),
      O => inst_shifter_sign_extd(0)
    );
  inst_shifter_buf_6_mux0000_32_11 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => op2(63),
      I1 => shift_type,
      I2 => shift_dir,
      I3 => op1(5),
      O => inst_shifter_N01
    );
  res_43_97 : LUT6
    generic map(
      INIT => X"F888888888888888"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_11_Q,
      I2 => op2(63),
      I3 => shift_type,
      I4 => shift_dir,
      I5 => op1(5),
      O => res_43_97_848
    );
  res_45_97 : LUT6
    generic map(
      INIT => X"F888888888888888"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_13_Q,
      I2 => op2(63),
      I3 => shift_type,
      I4 => shift_dir,
      I5 => op1(5),
      O => res_45_97_859
    );
  res_46_97 : LUT6
    generic map(
      INIT => X"F888888888888888"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_14_Q,
      I2 => op2(63),
      I3 => shift_type,
      I4 => shift_dir,
      I5 => op1(5),
      O => res_46_97_865
    );
  res_47_97 : LUT6
    generic map(
      INIT => X"F888888888888888"
    )
    port map (
      I0 => inst_shifter_N10,
      I1 => inst_shifter_buf_5_15_Q,
      I2 => op2(63),
      I3 => shift_type,
      I4 => shift_dir,
      I5 => op1(5),
      O => res_47_97_871
    );
  inst_shifter_buf_3_mux0000_4_Q : MUXF7
    port map (
      I0 => N256,
      I1 => N257,
      S => op1(2),
      O => inst_shifter_buf_3_4_Q
    );
  inst_shifter_buf_3_mux0000_4_F : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_2_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_6_Q,
      I4 => inst_shifter_buf_1_4_Q,
      O => N256
    );
  inst_shifter_buf_3_mux0000_4_G : LUT6
    generic map(
      INIT => X"B0B3B0B080838080"
    )
    port map (
      I0 => inst_shifter_buf_1_10_Q,
      I1 => op1(1),
      I2 => shift_dir,
      I3 => op1(0),
      I4 => op2(0),
      I5 => inst_shifter_buf_1_8_Q,
      O => N257
    );
  res_16_63 : MUXF7
    port map (
      I0 => N258,
      I1 => N259,
      S => N76,
      O => res_16_63_697
    );
  res_16_63_F : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_16_41_696,
      I1 => op2(16),
      I2 => N71,
      O => N258
    );
  res_16_63_G : LUT6
    generic map(
      INIT => X"FFEEFFE6FFCCFF80"
    )
    port map (
      I0 => op1(16),
      I1 => op2(16),
      I2 => N200,
      I3 => res_16_41_696,
      I4 => N71,
      I5 => op_ctrl(1),
      O => N259
    );
  res_15_63 : MUXF7
    port map (
      I0 => N260,
      I1 => N261,
      S => N76,
      O => res_15_63_693
    );
  res_15_63_F : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_15_41_692,
      I1 => op2(15),
      I2 => N71,
      O => N260
    );
  res_15_63_G : LUT6
    generic map(
      INIT => X"FFEEFFE6FFCCFF80"
    )
    port map (
      I0 => op1(15),
      I1 => op2(15),
      I2 => N200,
      I3 => res_15_41_692,
      I4 => N71,
      I5 => op_ctrl(1),
      O => N261
    );
  res_14_63 : MUXF7
    port map (
      I0 => N262,
      I1 => N263,
      S => N76,
      O => res_14_63_689
    );
  res_14_63_F : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_14_41_688,
      I1 => op2(14),
      I2 => N71,
      O => N262
    );
  res_14_63_G : LUT6
    generic map(
      INIT => X"FFEEFFE6FFCCFF80"
    )
    port map (
      I0 => op1(14),
      I1 => op2(14),
      I2 => N200,
      I3 => res_14_41_688,
      I4 => N71,
      I5 => op_ctrl(1),
      O => N263
    );
  res_13_63 : MUXF7
    port map (
      I0 => N264,
      I1 => N265,
      S => N76,
      O => res_13_63_685
    );
  res_13_63_F : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_13_41_684,
      I1 => op2(13),
      I2 => N71,
      O => N264
    );
  res_13_63_G : LUT6
    generic map(
      INIT => X"FFEEFFE6FFCCFF80"
    )
    port map (
      I0 => op1(13),
      I1 => op2(13),
      I2 => N200,
      I3 => res_13_41_684,
      I4 => N71,
      I5 => op_ctrl(1),
      O => N265
    );
  res_12_63 : MUXF7
    port map (
      I0 => N266,
      I1 => N267,
      S => N76,
      O => res_12_63_681
    );
  res_12_63_F : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_12_41_680,
      I1 => op2(12),
      I2 => N71,
      O => N266
    );
  res_12_63_G : LUT6
    generic map(
      INIT => X"FFEEFFE6FFCCFF80"
    )
    port map (
      I0 => op1(12),
      I1 => op2(12),
      I2 => N200,
      I3 => res_12_41_680,
      I4 => N71,
      I5 => op_ctrl(1),
      O => N267
    );
  res_11_63 : MUXF7
    port map (
      I0 => N268,
      I1 => N269,
      S => N76,
      O => res_11_63_677
    );
  res_11_63_F : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_11_41_676,
      I1 => op2(11),
      I2 => N71,
      O => N268
    );
  res_11_63_G : LUT6
    generic map(
      INIT => X"FFEEFFE6FFCCFF80"
    )
    port map (
      I0 => op1(11),
      I1 => op2(11),
      I2 => N200,
      I3 => res_11_41_676,
      I4 => N71,
      I5 => op_ctrl(1),
      O => N269
    );
  inst_shifter_buf_3_mux0000_8_Q : MUXF7
    port map (
      I0 => N270,
      I1 => N271,
      S => op1(1),
      O => inst_shifter_buf_3_8_Q
    );
  inst_shifter_buf_3_mux0000_8_F : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_1_4_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_12_Q,
      I4 => inst_shifter_buf_1_8_Q,
      O => N270
    );
  inst_shifter_buf_3_mux0000_8_G : LUT6
    generic map(
      INIT => X"FBEA7362D9C85140"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(2),
      I2 => inst_shifter_buf_1_2_Q,
      I3 => inst_shifter_buf_1_6_Q,
      I4 => inst_shifter_buf_2_12_Q,
      I5 => inst_shifter_buf_1_10_Q,
      O => N271
    );
  inst_shifter_buf_3_mux0000_0_74 : MUXF7
    port map (
      I0 => N272,
      I1 => N273,
      S => op1(2),
      O => inst_shifter_buf_3_0_Q
    );
  inst_shifter_buf_3_mux0000_0_74_F : LUT6
    generic map(
      INIT => X"FE105410BA101010"
    )
    port map (
      I0 => op1(1),
      I1 => op1(0),
      I2 => op2(0),
      I3 => shift_dir,
      I4 => inst_shifter_buf_1_2_Q,
      I5 => op2(1),
      O => N272
    );
  inst_shifter_buf_3_mux0000_0_74_G : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(1),
      I2 => op1(0),
      I3 => op2(6),
      I4 => inst_shifter_buf_1_4_Q,
      I5 => op2(7),
      O => N273
    );
  res_31_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_31_57_779,
      I1 => N70,
      I2 => op1(31),
      I3 => N71,
      I4 => op2(31),
      I5 => N78,
      O => res_31_861_781
    );
  res_31_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_31_57_779,
      I1 => N70,
      I2 => op1(31),
      I3 => N71,
      I4 => op2(31),
      O => res_31_862_782
    );
  res_31_86_f7 : MUXF7
    port map (
      I0 => res_31_862_782,
      I1 => res_31_861_781,
      S => res_add(31),
      O => res_31_86
    );
  res_30_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_30_57_774,
      I1 => N70,
      I2 => op1(30),
      I3 => N71,
      I4 => op2(30),
      I5 => N78,
      O => res_30_861_776
    );
  res_30_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_30_57_774,
      I1 => N70,
      I2 => op1(30),
      I3 => N71,
      I4 => op2(30),
      O => res_30_862_777
    );
  res_30_86_f7 : MUXF7
    port map (
      I0 => res_30_862_777,
      I1 => res_30_861_776,
      S => res_add(30),
      O => res_30_86
    );
  res_29_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_29_57_765,
      I1 => N70,
      I2 => op1(29),
      I3 => N71,
      I4 => op2(29),
      I5 => N78,
      O => res_29_861_767
    );
  res_29_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_29_57_765,
      I1 => N70,
      I2 => op1(29),
      I3 => N71,
      I4 => op2(29),
      O => res_29_862_768
    );
  res_29_86_f7 : MUXF7
    port map (
      I0 => res_29_862_768,
      I1 => res_29_861_767,
      S => res_add(29),
      O => res_29_86
    );
  res_28_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_28_57_760,
      I1 => N70,
      I2 => op1(28),
      I3 => N71,
      I4 => op2(28),
      I5 => N78,
      O => res_28_861_762
    );
  res_28_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_28_57_760,
      I1 => N70,
      I2 => op1(28),
      I3 => N71,
      I4 => op2(28),
      O => res_28_862_763
    );
  res_28_86_f7 : MUXF7
    port map (
      I0 => res_28_862_763,
      I1 => res_28_861_762,
      S => res_add(28),
      O => res_28_86
    );
  res_27_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_27_57_755,
      I1 => N70,
      I2 => op1(27),
      I3 => N71,
      I4 => op2(27),
      I5 => N78,
      O => res_27_861_757
    );
  res_27_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_27_57_755,
      I1 => N70,
      I2 => op1(27),
      I3 => N71,
      I4 => op2(27),
      O => res_27_862_758
    );
  res_27_86_f7 : MUXF7
    port map (
      I0 => res_27_862_758,
      I1 => res_27_861_757,
      S => res_add(27),
      O => res_27_86
    );
  res_26_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_26_57_750,
      I1 => N70,
      I2 => op1(26),
      I3 => N71,
      I4 => op2(26),
      I5 => N78,
      O => res_26_861_752
    );
  res_26_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_26_57_750,
      I1 => N70,
      I2 => op1(26),
      I3 => N71,
      I4 => op2(26),
      O => res_26_862_753
    );
  res_26_86_f7 : MUXF7
    port map (
      I0 => res_26_862_753,
      I1 => res_26_861_752,
      S => res_add(26),
      O => res_26_86
    );
  res_23_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_23_57_735,
      I1 => N70,
      I2 => op1(23),
      I3 => N71,
      I4 => op2(23),
      I5 => N78,
      O => res_23_861_737
    );
  res_23_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_23_57_735,
      I1 => N70,
      I2 => op1(23),
      I3 => N71,
      I4 => op2(23),
      O => res_23_862_738
    );
  res_23_86_f7 : MUXF7
    port map (
      I0 => res_23_862_738,
      I1 => res_23_861_737,
      S => res_add(23),
      O => res_23_86
    );
  res_22_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_22_57_730,
      I1 => N70,
      I2 => op1(22),
      I3 => N71,
      I4 => op2(22),
      I5 => N78,
      O => res_22_861_732
    );
  res_22_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_22_57_730,
      I1 => N70,
      I2 => op1(22),
      I3 => N71,
      I4 => op2(22),
      O => res_22_862_733
    );
  res_22_86_f7 : MUXF7
    port map (
      I0 => res_22_862_733,
      I1 => res_22_861_732,
      S => res_add(22),
      O => res_22_86
    );
  res_21_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_21_57_725,
      I1 => N70,
      I2 => op1(21),
      I3 => N71,
      I4 => op2(21),
      I5 => N78,
      O => res_21_861_727
    );
  res_21_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_21_57_725,
      I1 => N70,
      I2 => op1(21),
      I3 => N71,
      I4 => op2(21),
      O => res_21_862_728
    );
  res_21_86_f7 : MUXF7
    port map (
      I0 => res_21_862_728,
      I1 => res_21_861_727,
      S => res_add(21),
      O => res_21_86
    );
  res_19_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_19_57_710,
      I1 => N70,
      I2 => op1(19),
      I3 => N71,
      I4 => op2(19),
      I5 => N78,
      O => res_19_861_712
    );
  res_19_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_19_57_710,
      I1 => N70,
      I2 => op1(19),
      I3 => N71,
      I4 => op2(19),
      O => res_19_862_713
    );
  res_19_86_f7 : MUXF7
    port map (
      I0 => res_19_862_713,
      I1 => res_19_861_712,
      S => res_add(19),
      O => res_19_86
    );
  res_18_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_18_57_705,
      I1 => N70,
      I2 => op1(18),
      I3 => N71,
      I4 => op2(18),
      I5 => N78,
      O => res_18_861_707
    );
  res_18_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_18_57_705,
      I1 => N70,
      I2 => op1(18),
      I3 => N71,
      I4 => op2(18),
      O => res_18_862_708
    );
  res_18_86_f7 : MUXF7
    port map (
      I0 => res_18_862_708,
      I1 => res_18_861_707,
      S => res_add(18),
      O => res_18_86
    );
  res_17_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_17_57_700,
      I1 => N70,
      I2 => op1(17),
      I3 => N71,
      I4 => op2(17),
      I5 => N78,
      O => res_17_861_702
    );
  res_17_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_17_57_700,
      I1 => N70,
      I2 => op1(17),
      I3 => N71,
      I4 => op2(17),
      O => res_17_862_703
    );
  res_17_86_f7 : MUXF7
    port map (
      I0 => res_17_862_703,
      I1 => res_17_861_702,
      S => res_add(17),
      O => res_17_86
    );
  inst_shifter_buf_4_mux0000_9_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_9_Q,
      I2 => inst_shifter_buf_3_17_Q,
      O => inst_shifter_buf_4_mux0000(9)
    );
  inst_shifter_buf_4_mux0000_9_2 : LUT5
    generic map(
      INIT => X"444E4444"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_9_Q,
      I2 => op1(2),
      I3 => op1(1),
      I4 => inst_shifter_buf_1_1_Q,
      O => inst_shifter_buf_4_mux0000_9_1_488
    );
  inst_shifter_buf_4_mux0000_9_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_4_mux0000_9_1_488,
      I1 => inst_shifter_buf_4_mux0000(9),
      S => shift_dir,
      O => inst_shifter_buf_4_9_Q
    );
  inst_shifter_buf_3_mux0000_12_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_12_Q,
      I2 => inst_shifter_buf_2_16_Q,
      O => inst_shifter_buf_3_mux0000(12)
    );
  inst_shifter_buf_3_mux0000_12_2 : LUT5
    generic map(
      INIT => X"FD5DA808"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_1_8_Q,
      I2 => op1(1),
      I3 => inst_shifter_buf_1_6_Q,
      I4 => inst_shifter_buf_2_12_Q,
      O => inst_shifter_buf_3_mux0000_12_1_486
    );
  inst_shifter_buf_3_mux0000_12_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_3_mux0000_12_1_486,
      I1 => inst_shifter_buf_3_mux0000(12),
      S => shift_dir,
      O => inst_shifter_buf_3_12_Q
    );
  res_0_1841 : LUT6
    generic map(
      INIT => X"40000000C0808080"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(1),
      I2 => op_ctrl(0),
      I3 => nul,
      I4 => op_ctrl(3),
      I5 => op_ctrl(2),
      O => res_0_1841_664
    );
  res_0_1842 : LUT5
    generic map(
      INIT => X"40000000"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => nul,
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(1),
      O => res_0_1842_665
    );
  res_0_184_f7 : MUXF7
    port map (
      I0 => res_0_1842_665,
      I1 => res_0_1841_664,
      S => shifter_out(0),
      O => res_0_184
    );
  res_0_2941 : LUT4
    generic map(
      INIT => X"898B"
    )
    port map (
      I0 => op1(63),
      I1 => op_ctrl(0),
      I2 => nul,
      I3 => op_ctrl(1),
      O => res_0_2941_667
    );
  res_0_2942 : LUT4
    generic map(
      INIT => X"6C88"
    )
    port map (
      I0 => op1(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(0),
      I3 => op2(0),
      O => res_0_2942_668
    );
  res_0_294_f7 : MUXF7
    port map (
      I0 => res_0_2942_668,
      I1 => res_0_2941_667,
      S => op_ctrl(3),
      O => res_0_294
    );
  res_24_741 : LUT6
    generic map(
      INIT => X"FFFFFFFFECEC2820"
    )
    port map (
      I0 => N76,
      I1 => op1(24),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => N70,
      I5 => N71,
      O => res_24_741_743
    );
  res_24_742 : LUT5
    generic map(
      INIT => X"FFD5AA80"
    )
    port map (
      I0 => op1(24),
      I1 => N76,
      I2 => op_ctrl(1),
      I3 => N70,
      I4 => N72,
      O => res_24_742_744
    );
  res_24_74_f7 : MUXF7
    port map (
      I0 => res_24_742_744,
      I1 => res_24_741_743,
      S => op2(24),
      O => res_24_74
    );
  res_24_1111 : LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
    port map (
      I0 => res_24_74,
      I1 => res_add(24),
      I2 => N78,
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_56_Q,
      I5 => N82,
      O => res_24_111
    );
  res_24_1112 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_24_74,
      I1 => res_add(24),
      I2 => N78,
      I3 => inst_shifter_buf_5_24_Q,
      I4 => N82,
      O => res_24_1111_741
    );
  res_24_111_f7 : MUXF7
    port map (
      I0 => res_24_1111_741,
      I1 => res_24_111,
      S => op1(5),
      O => res(24)
    );
  res_20_741 : LUT6
    generic map(
      INIT => X"FFFFFFFFECEC2820"
    )
    port map (
      I0 => N76,
      I1 => op1(20),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => N70,
      I5 => N71,
      O => res_20_741_722
    );
  res_20_742 : LUT5
    generic map(
      INIT => X"FFD5AA80"
    )
    port map (
      I0 => op1(20),
      I1 => N76,
      I2 => op_ctrl(1),
      I3 => N70,
      I4 => N72,
      O => res_20_742_723
    );
  res_20_74_f7 : MUXF7
    port map (
      I0 => res_20_742_723,
      I1 => res_20_741_722,
      S => op2(20),
      O => res_20_74
    );
  res_20_1111 : LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
    port map (
      I0 => res_20_74,
      I1 => res_add(20),
      I2 => N78,
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_52_Q,
      I5 => N82,
      O => res_20_111
    );
  res_20_1112 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_20_74,
      I1 => res_add(20),
      I2 => N78,
      I3 => inst_shifter_buf_5_20_Q,
      I4 => N82,
      O => res_20_1111_720
    );
  res_20_111_f7 : MUXF7
    port map (
      I0 => res_20_1111_720,
      I1 => res_20_111,
      S => op1(5),
      O => res(20)
    );
  res_0_3251 : LUT6
    generic map(
      INIT => X"FFFFFFFF2F202020"
    )
    port map (
      I0 => res_0_294,
      I1 => op_ctrl(4),
      I2 => op_ctrl(2),
      I3 => res_0_130_662,
      I4 => op_ctrl(3),
      I5 => res_0_184,
      O => res_0_325
    );
  res_0_325_f7 : MUXF7
    port map (
      I0 => res_0_325,
      I1 => N1,
      S => res_0_43_670,
      O => res(0)
    );
  res_32_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(32),
      I1 => op2(32),
      I2 => N72,
      I3 => N84,
      I4 => op_ctrl(0),
      I5 => op2(0),
      O => res_32_501_786
    );
  res_32_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(32),
      I1 => op2(32),
      I2 => N72,
      I3 => N84,
      O => res_32_502_787
    );
  res_32_50_f7 : MUXF7
    port map (
      I0 => res_32_502_787,
      I1 => res_32_501_786,
      S => op_ctrl(4),
      O => res_32_50
    );
  res_40_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(40),
      I1 => op2(40),
      I2 => N72,
      I3 => N84,
      I4 => op_ctrl(0),
      I5 => op2(8),
      O => res_40_501_830
    );
  res_40_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(40),
      I1 => op2(40),
      I2 => N72,
      I3 => N84,
      O => res_40_502_831
    );
  res_40_50_f7 : MUXF7
    port map (
      I0 => res_40_502_831,
      I1 => res_40_501_830,
      S => op_ctrl(4),
      O => res_40_50
    );
  inst_shifter_buf_5_mux0000_7_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(3),
      I2 => inst_shifter_buf_3_23_Q,
      I3 => inst_shifter_buf_3_31_Q,
      O => inst_shifter_buf_5_mux0000_7_1
    );
  inst_shifter_buf_5_mux0000_7_12 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => inst_shifter_buf_2_19_Q,
      I4 => inst_shifter_buf_2_15_Q,
      I5 => inst_shifter_buf_3_7_Q,
      O => inst_shifter_buf_5_mux0000_7_11_502
    );
  inst_shifter_buf_5_mux0000_7_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_7_11_502,
      I1 => inst_shifter_buf_5_mux0000_7_1,
      S => op1(4),
      O => inst_shifter_buf_5_7_Q
    );
  inst_shifter_buf_5_mux0000_6_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(3),
      I2 => inst_shifter_buf_3_22_Q,
      I3 => inst_shifter_buf_3_30_Q,
      O => inst_shifter_buf_5_mux0000_6_1
    );
  inst_shifter_buf_5_mux0000_6_12 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => inst_shifter_buf_2_18_Q,
      I4 => inst_shifter_buf_2_14_Q,
      I5 => inst_shifter_buf_3_6_Q,
      O => inst_shifter_buf_5_mux0000_6_11_500
    );
  inst_shifter_buf_5_mux0000_6_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_6_11_500,
      I1 => inst_shifter_buf_5_mux0000_6_1,
      S => op1(4),
      O => inst_shifter_buf_5_6_Q
    );
  inst_shifter_buf_5_mux0000_5_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(3),
      I2 => inst_shifter_buf_3_21_Q,
      I3 => inst_shifter_buf_3_29_Q,
      O => inst_shifter_buf_5_mux0000_5_1
    );
  inst_shifter_buf_5_mux0000_5_12 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => inst_shifter_buf_2_17_Q,
      I4 => inst_shifter_buf_2_13_Q,
      I5 => inst_shifter_buf_3_5_Q,
      O => inst_shifter_buf_5_mux0000_5_11_498
    );
  inst_shifter_buf_5_mux0000_5_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_5_11_498,
      I1 => inst_shifter_buf_5_mux0000_5_1,
      S => op1(4),
      O => inst_shifter_buf_5_5_Q
    );
  inst_shifter_buf_5_mux0000_3_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(3),
      I2 => inst_shifter_buf_3_19_Q,
      I3 => inst_shifter_buf_3_27_Q,
      O => inst_shifter_buf_5_mux0000_3_1
    );
  inst_shifter_buf_5_mux0000_3_12 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => inst_shifter_buf_2_15_Q,
      I4 => inst_shifter_buf_2_11_Q,
      I5 => inst_shifter_buf_3_3_Q,
      O => inst_shifter_buf_5_mux0000_3_11_496
    );
  inst_shifter_buf_5_mux0000_3_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_3_11_496,
      I1 => inst_shifter_buf_5_mux0000_3_1,
      S => op1(4),
      O => inst_shifter_buf_5_3_Q
    );
  inst_shifter_buf_5_mux0000_2_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(3),
      I2 => inst_shifter_buf_3_18_Q,
      I3 => inst_shifter_buf_3_26_Q,
      O => inst_shifter_buf_5_mux0000_2_1
    );
  inst_shifter_buf_5_mux0000_2_12 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => inst_shifter_buf_2_14_Q,
      I4 => inst_shifter_buf_2_10_Q,
      I5 => inst_shifter_buf_3_2_Q,
      O => inst_shifter_buf_5_mux0000_2_11_494
    );
  inst_shifter_buf_5_mux0000_2_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_2_11_494,
      I1 => inst_shifter_buf_5_mux0000_2_1,
      S => op1(4),
      O => inst_shifter_buf_5_2_Q
    );
  inst_shifter_buf_5_mux0000_1_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(3),
      I2 => inst_shifter_buf_3_17_Q,
      I3 => inst_shifter_buf_3_25_Q,
      O => inst_shifter_buf_5_mux0000_1_1
    );
  inst_shifter_buf_5_mux0000_1_12 : LUT6
    generic map(
      INIT => X"F151B111B111B111"
    )
    port map (
      I0 => op1(3),
      I1 => N204,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_9_Q,
      I4 => inst_shifter_buf_2_5_Q,
      I5 => op1(2),
      O => inst_shifter_buf_5_mux0000_1_11_492
    );
  inst_shifter_buf_5_mux0000_1_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_1_11_492,
      I1 => inst_shifter_buf_5_mux0000_1_1,
      S => op1(4),
      O => inst_shifter_buf_5_1_Q
    );
  inst_shifter_buf_5_mux0000_0_11 : LUT6
    generic map(
      INIT => X"FBEA7362D9C85140"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => inst_shifter_buf_3_8_Q,
      I3 => inst_shifter_buf_3_0_Q,
      I4 => inst_shifter_buf_3_24_Q,
      I5 => inst_shifter_buf_3_16_Q,
      O => inst_shifter_buf_5_mux0000_0_1
    );
  inst_shifter_buf_5_mux0000_0_12 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => inst_shifter_buf_3_0_Q,
      I1 => op1(4),
      I2 => op1(3),
      O => inst_shifter_buf_5_mux0000_0_11_490
    );
  inst_shifter_buf_5_mux0000_0_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_0_11_490,
      I1 => inst_shifter_buf_5_mux0000_0_1,
      S => shift_dir,
      O => inst_shifter_buf_5_0_Q
    );

end Structure;

