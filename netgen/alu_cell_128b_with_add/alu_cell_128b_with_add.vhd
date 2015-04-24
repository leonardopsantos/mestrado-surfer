--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: alu_cell_synthesis.vhd
-- /___/   /\     Timestamp: Mon Aug 22 17:09:43 2011
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
    res : out STD_LOGIC_VECTOR ( 127 downto 0 ); 
    op_ctrl : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    op1 : in STD_LOGIC_VECTOR ( 127 downto 0 ); 
    op2 : in STD_LOGIC_VECTOR ( 127 downto 0 ) 
  );
end alu_cell;

architecture Structure of alu_cell is
  signal N0 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N278 : STD_LOGIC; 
  signal N285 : STD_LOGIC; 
  signal N299 : STD_LOGIC; 
  signal N303 : STD_LOGIC; 
  signal N305 : STD_LOGIC; 
  signal N307 : STD_LOGIC; 
  signal N309 : STD_LOGIC; 
  signal N311 : STD_LOGIC; 
  signal N315 : STD_LOGIC; 
  signal N319 : STD_LOGIC; 
  signal N321 : STD_LOGIC; 
  signal N323 : STD_LOGIC; 
  signal N325 : STD_LOGIC; 
  signal N327 : STD_LOGIC; 
  signal N328 : STD_LOGIC; 
  signal N329 : STD_LOGIC; 
  signal N330 : STD_LOGIC; 
  signal N331 : STD_LOGIC; 
  signal N332 : STD_LOGIC; 
  signal N333 : STD_LOGIC; 
  signal N334 : STD_LOGIC; 
  signal N335 : STD_LOGIC; 
  signal N336 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal comp_op2 : STD_LOGIC; 
  signal inst_shifter_N01 : STD_LOGIC; 
  signal inst_shifter_buf_1_100_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_101_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_102_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_103_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_104_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_105_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_106_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_107_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_108_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_109_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_110_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_111_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_112_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_113_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_114_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_115_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_116_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_117_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_118_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_119_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_120_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_121_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_122_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_123_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_124_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_125_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_126_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_127_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_1_64_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_65_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_66_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_67_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_68_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_69_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_70_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_71_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_72_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_73_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_74_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_75_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_76_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_77_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_78_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_79_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_80_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_81_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_82_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_83_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_84_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_85_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_86_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_87_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_88_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_89_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_90_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_91_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_92_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_93_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_94_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_95_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_96_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_97_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_98_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_99_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_100_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_101_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_102_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_103_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_104_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_105_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_106_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_107_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_108_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_109_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_110_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_111_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_112_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_113_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_114_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_115_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_116_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_117_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_118_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_119_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_120_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_121_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_122_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_123_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_124_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_125_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_126_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_127_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_2_64_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_65_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_66_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_67_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_68_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_69_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_70_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_71_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_72_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_73_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_74_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_75_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_76_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_77_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_78_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_79_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_80_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_81_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_82_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_83_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_84_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_85_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_86_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_87_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_88_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_89_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_90_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_91_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_92_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_93_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_94_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_95_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_96_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_97_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_98_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_99_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_0_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_100_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_101_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_102_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_103_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_104_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_105_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_106_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_107_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_108_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_109_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_110_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_111_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_112_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_113_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_114_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_115_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_116_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_117_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_118_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_119_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_120_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_121_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_122_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_123_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_124_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_125_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_126_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_127_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_3_64_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_65_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_66_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_67_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_68_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_69_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_70_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_71_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_72_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_73_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_74_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_75_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_76_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_77_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_78_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_79_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_80_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_81_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_82_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_83_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_84_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_85_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_86_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_87_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_88_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_89_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_90_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_91_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_92_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_93_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_94_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_95_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_96_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_97_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_98_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_99_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_0_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_100_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_101_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_102_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_103_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_104_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_105_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_106_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_107_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_108_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_109_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_110_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_111_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_112_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_113_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_114_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_115_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_116_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_117_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_118_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_119_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_120_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_121_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_122_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_123_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_124_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_125_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_126_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_127_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_12_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_13_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_14_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_15_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_16_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_1_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_4_5_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_60_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_61_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_62_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_63_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_64_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_65_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_66_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_67_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_68_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_69_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_70_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_71_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_72_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_73_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_74_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_75_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_76_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_77_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_78_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_79_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_80_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_81_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_82_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_83_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_84_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_85_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_86_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_87_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_88_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_89_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_90_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_91_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_92_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_93_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_94_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_95_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_96_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_97_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_98_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_99_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_100_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_101_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_102_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_103_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_104_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_105_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_106_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_107_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_108_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_109_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_10_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_110_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_111_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_112_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_113_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_114_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_115_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_116_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_117_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_118_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_119_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_11_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_120_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_121_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_122_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_123_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_124_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_125_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_126_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_127_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_5_64_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_65_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_66_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_67_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_68_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_69_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_70_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_71_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_72_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_73_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_74_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_75_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_76_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_77_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_78_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_79_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_80_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_81_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_82_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_83_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_84_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_85_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_86_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_87_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_88_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_89_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_90_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_91_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_92_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_93_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_94_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_95_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_96_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_97_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_98_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_99_Q : STD_LOGIC; 
  signal inst_shifter_buf_5_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_mux0000_12_1_964 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_9_1_966 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_2_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_2_11_968 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_3_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_3_11_970 : STD_LOGIC; 
  signal inst_shifter_buf_6_mux0000_0_1 : STD_LOGIC; 
  signal inst_shifter_buf_6_mux0000_0_11_972 : STD_LOGIC; 
  signal nul : STD_LOGIC; 
  signal res_0_155_1238 : STD_LOGIC; 
  signal res_0_217_1239 : STD_LOGIC; 
  signal res_0_357_1240 : STD_LOGIC; 
  signal res_0_8_1241 : STD_LOGIC; 
  signal res_100_16_1243 : STD_LOGIC; 
  signal res_100_51_1244 : STD_LOGIC; 
  signal res_100_81_1245 : STD_LOGIC; 
  signal res_101_16_1247 : STD_LOGIC; 
  signal res_101_51_1248 : STD_LOGIC; 
  signal res_101_81_1249 : STD_LOGIC; 
  signal res_102_16_1251 : STD_LOGIC; 
  signal res_102_51_1252 : STD_LOGIC; 
  signal res_102_81_1253 : STD_LOGIC; 
  signal res_103_16_1255 : STD_LOGIC; 
  signal res_103_51_1256 : STD_LOGIC; 
  signal res_103_81_1257 : STD_LOGIC; 
  signal res_104_16_1259 : STD_LOGIC; 
  signal res_104_51_1260 : STD_LOGIC; 
  signal res_104_81_1261 : STD_LOGIC; 
  signal res_105_16_1263 : STD_LOGIC; 
  signal res_105_51_1264 : STD_LOGIC; 
  signal res_105_81_1265 : STD_LOGIC; 
  signal res_106_16_1267 : STD_LOGIC; 
  signal res_106_51_1268 : STD_LOGIC; 
  signal res_106_81_1269 : STD_LOGIC; 
  signal res_107_16_1271 : STD_LOGIC; 
  signal res_107_51_1272 : STD_LOGIC; 
  signal res_107_81_1273 : STD_LOGIC; 
  signal res_108_16_1275 : STD_LOGIC; 
  signal res_108_51_1276 : STD_LOGIC; 
  signal res_108_81_1277 : STD_LOGIC; 
  signal res_109_16_1279 : STD_LOGIC; 
  signal res_109_51_1280 : STD_LOGIC; 
  signal res_109_81_1281 : STD_LOGIC; 
  signal res_10_38_1283 : STD_LOGIC; 
  signal res_10_62_1284 : STD_LOGIC; 
  signal res_110_16_1286 : STD_LOGIC; 
  signal res_110_51_1287 : STD_LOGIC; 
  signal res_110_81_1288 : STD_LOGIC; 
  signal res_111_16_1290 : STD_LOGIC; 
  signal res_111_51_1291 : STD_LOGIC; 
  signal res_111_81_1292 : STD_LOGIC; 
  signal res_112_16_1294 : STD_LOGIC; 
  signal res_112_51_1295 : STD_LOGIC; 
  signal res_112_81_1296 : STD_LOGIC; 
  signal res_113_16_1298 : STD_LOGIC; 
  signal res_113_51_1299 : STD_LOGIC; 
  signal res_113_81_1300 : STD_LOGIC; 
  signal res_114_16_1302 : STD_LOGIC; 
  signal res_114_51_1303 : STD_LOGIC; 
  signal res_114_81_1304 : STD_LOGIC; 
  signal res_115_16_1306 : STD_LOGIC; 
  signal res_115_51_1307 : STD_LOGIC; 
  signal res_115_81_1308 : STD_LOGIC; 
  signal res_116_16_1310 : STD_LOGIC; 
  signal res_116_51_1311 : STD_LOGIC; 
  signal res_116_81_1312 : STD_LOGIC; 
  signal res_117_16_1314 : STD_LOGIC; 
  signal res_117_51_1315 : STD_LOGIC; 
  signal res_117_81_1316 : STD_LOGIC; 
  signal res_118_16_1318 : STD_LOGIC; 
  signal res_118_51_1319 : STD_LOGIC; 
  signal res_118_81_1320 : STD_LOGIC; 
  signal res_119_16_1322 : STD_LOGIC; 
  signal res_119_51_1323 : STD_LOGIC; 
  signal res_119_81_1324 : STD_LOGIC; 
  signal res_11_38_1326 : STD_LOGIC; 
  signal res_11_62_1327 : STD_LOGIC; 
  signal res_120_16_1329 : STD_LOGIC; 
  signal res_120_51_1330 : STD_LOGIC; 
  signal res_120_81_1331 : STD_LOGIC; 
  signal res_121_16_1333 : STD_LOGIC; 
  signal res_121_51_1334 : STD_LOGIC; 
  signal res_121_81_1335 : STD_LOGIC; 
  signal res_122_16_1337 : STD_LOGIC; 
  signal res_122_51_1338 : STD_LOGIC; 
  signal res_122_81_1339 : STD_LOGIC; 
  signal res_123_16_1341 : STD_LOGIC; 
  signal res_123_51_1342 : STD_LOGIC; 
  signal res_123_81_1343 : STD_LOGIC; 
  signal res_124_16_1345 : STD_LOGIC; 
  signal res_124_51_1346 : STD_LOGIC; 
  signal res_124_81_1347 : STD_LOGIC; 
  signal res_125_16_1349 : STD_LOGIC; 
  signal res_125_51_1350 : STD_LOGIC; 
  signal res_125_81_1351 : STD_LOGIC; 
  signal res_126_16_1353 : STD_LOGIC; 
  signal res_126_51_1354 : STD_LOGIC; 
  signal res_126_81_1355 : STD_LOGIC; 
  signal res_127_16_1357 : STD_LOGIC; 
  signal res_127_51_1358 : STD_LOGIC; 
  signal res_127_81_1359 : STD_LOGIC; 
  signal res_12_38_1361 : STD_LOGIC; 
  signal res_12_62_1362 : STD_LOGIC; 
  signal res_13_38_1364 : STD_LOGIC; 
  signal res_13_62_1365 : STD_LOGIC; 
  signal res_14_38_1367 : STD_LOGIC; 
  signal res_14_62_1368 : STD_LOGIC; 
  signal res_15_38_1370 : STD_LOGIC; 
  signal res_15_62_1371 : STD_LOGIC; 
  signal res_16_38_1373 : STD_LOGIC; 
  signal res_16_62_1374 : STD_LOGIC; 
  signal res_17_38_1376 : STD_LOGIC; 
  signal res_17_62_1377 : STD_LOGIC; 
  signal res_18_38_1379 : STD_LOGIC; 
  signal res_18_62_1380 : STD_LOGIC; 
  signal res_19_38_1382 : STD_LOGIC; 
  signal res_19_62_1383 : STD_LOGIC; 
  signal res_1_38_1385 : STD_LOGIC; 
  signal res_1_62_1386 : STD_LOGIC; 
  signal res_20_38_1388 : STD_LOGIC; 
  signal res_20_62_1389 : STD_LOGIC; 
  signal res_21_38_1391 : STD_LOGIC; 
  signal res_21_62_1392 : STD_LOGIC; 
  signal res_22_38_1394 : STD_LOGIC; 
  signal res_22_62_1395 : STD_LOGIC; 
  signal res_23_38_1397 : STD_LOGIC; 
  signal res_23_62_1398 : STD_LOGIC; 
  signal res_24_38_1400 : STD_LOGIC; 
  signal res_24_62_1401 : STD_LOGIC; 
  signal res_25_38_1403 : STD_LOGIC; 
  signal res_25_62_1404 : STD_LOGIC; 
  signal res_26_38_1406 : STD_LOGIC; 
  signal res_26_62_1407 : STD_LOGIC; 
  signal res_27_38_1409 : STD_LOGIC; 
  signal res_28_38_1411 : STD_LOGIC; 
  signal res_28_62_1412 : STD_LOGIC; 
  signal res_29_38_1414 : STD_LOGIC; 
  signal res_2_38_1416 : STD_LOGIC; 
  signal res_2_62_1417 : STD_LOGIC; 
  signal res_30_38_1419 : STD_LOGIC; 
  signal res_31_38_1421 : STD_LOGIC; 
  signal res_32_38_1423 : STD_LOGIC; 
  signal res_32_62_1424 : STD_LOGIC; 
  signal res_32_95_1425 : STD_LOGIC; 
  signal res_33_38_1427 : STD_LOGIC; 
  signal res_33_62_1428 : STD_LOGIC; 
  signal res_33_95_1429 : STD_LOGIC; 
  signal res_34_104_1431 : STD_LOGIC; 
  signal res_34_38_1432 : STD_LOGIC; 
  signal res_34_62_1433 : STD_LOGIC; 
  signal res_35_104_1435 : STD_LOGIC; 
  signal res_35_38_1436 : STD_LOGIC; 
  signal res_35_62_1437 : STD_LOGIC; 
  signal res_36_38_1439 : STD_LOGIC; 
  signal res_36_62_1440 : STD_LOGIC; 
  signal res_36_95_1441 : STD_LOGIC; 
  signal res_37_46 : STD_LOGIC; 
  signal res_37_461_1444 : STD_LOGIC; 
  signal res_37_462_1445 : STD_LOGIC; 
  signal res_37_95_1446 : STD_LOGIC; 
  signal res_38_38_1448 : STD_LOGIC; 
  signal res_38_45_1449 : STD_LOGIC; 
  signal res_39_38_1451 : STD_LOGIC; 
  signal res_39_45_1452 : STD_LOGIC; 
  signal res_3_38_1454 : STD_LOGIC; 
  signal res_3_62_1455 : STD_LOGIC; 
  signal res_40_46 : STD_LOGIC; 
  signal res_40_461_1458 : STD_LOGIC; 
  signal res_40_462_1459 : STD_LOGIC; 
  signal res_40_95_1460 : STD_LOGIC; 
  signal res_41_34_1462 : STD_LOGIC; 
  signal res_41_44_1463 : STD_LOGIC; 
  signal res_41_94_1464 : STD_LOGIC; 
  signal res_42_46 : STD_LOGIC; 
  signal res_42_461_1467 : STD_LOGIC; 
  signal res_42_462_1468 : STD_LOGIC; 
  signal res_42_91_1469 : STD_LOGIC; 
  signal res_43_46 : STD_LOGIC; 
  signal res_43_461_1472 : STD_LOGIC; 
  signal res_43_462_1473 : STD_LOGIC; 
  signal res_43_91_1474 : STD_LOGIC; 
  signal res_44_38_1476 : STD_LOGIC; 
  signal res_44_62_1477 : STD_LOGIC; 
  signal res_44_95_1478 : STD_LOGIC; 
  signal res_45_46 : STD_LOGIC; 
  signal res_45_461_1481 : STD_LOGIC; 
  signal res_45_462_1482 : STD_LOGIC; 
  signal res_45_91_1483 : STD_LOGIC; 
  signal res_46_46 : STD_LOGIC; 
  signal res_46_461_1486 : STD_LOGIC; 
  signal res_46_462_1487 : STD_LOGIC; 
  signal res_46_91_1488 : STD_LOGIC; 
  signal res_47_46 : STD_LOGIC; 
  signal res_47_461_1491 : STD_LOGIC; 
  signal res_47_462_1492 : STD_LOGIC; 
  signal res_47_91_1493 : STD_LOGIC; 
  signal res_48_38_1495 : STD_LOGIC; 
  signal res_48_45_1496 : STD_LOGIC; 
  signal res_49_38_1498 : STD_LOGIC; 
  signal res_49_45_1499 : STD_LOGIC; 
  signal res_4_38_1501 : STD_LOGIC; 
  signal res_4_62_1502 : STD_LOGIC; 
  signal res_50_46 : STD_LOGIC; 
  signal res_50_461_1505 : STD_LOGIC; 
  signal res_50_462_1506 : STD_LOGIC; 
  signal res_50_91_1507 : STD_LOGIC; 
  signal res_51_46 : STD_LOGIC; 
  signal res_51_461_1510 : STD_LOGIC; 
  signal res_51_462_1511 : STD_LOGIC; 
  signal res_51_91_1512 : STD_LOGIC; 
  signal res_52_46 : STD_LOGIC; 
  signal res_52_461_1515 : STD_LOGIC; 
  signal res_52_462_1516 : STD_LOGIC; 
  signal res_52_95_1517 : STD_LOGIC; 
  signal res_53_46 : STD_LOGIC; 
  signal res_53_461_1520 : STD_LOGIC; 
  signal res_53_462_1521 : STD_LOGIC; 
  signal res_53_91_1522 : STD_LOGIC; 
  signal res_54_46 : STD_LOGIC; 
  signal res_54_461_1525 : STD_LOGIC; 
  signal res_54_462_1526 : STD_LOGIC; 
  signal res_54_91_1527 : STD_LOGIC; 
  signal res_55_46 : STD_LOGIC; 
  signal res_55_461_1530 : STD_LOGIC; 
  signal res_55_462_1531 : STD_LOGIC; 
  signal res_55_91_1532 : STD_LOGIC; 
  signal res_56_46 : STD_LOGIC; 
  signal res_56_461_1535 : STD_LOGIC; 
  signal res_56_462_1536 : STD_LOGIC; 
  signal res_56_82_1537 : STD_LOGIC; 
  signal res_57_103_1539 : STD_LOGIC; 
  signal res_57_34_1540 : STD_LOGIC; 
  signal res_57_44_1541 : STD_LOGIC; 
  signal res_58_46 : STD_LOGIC; 
  signal res_58_461_1544 : STD_LOGIC; 
  signal res_58_462_1545 : STD_LOGIC; 
  signal res_58_91_1546 : STD_LOGIC; 
  signal res_59_46 : STD_LOGIC; 
  signal res_59_461_1549 : STD_LOGIC; 
  signal res_59_462_1550 : STD_LOGIC; 
  signal res_59_91_1551 : STD_LOGIC; 
  signal res_5_38_1553 : STD_LOGIC; 
  signal res_5_62_1554 : STD_LOGIC; 
  signal res_60_45 : STD_LOGIC; 
  signal res_60_451_1557 : STD_LOGIC; 
  signal res_60_452_1558 : STD_LOGIC; 
  signal res_60_81_1559 : STD_LOGIC; 
  signal res_61_46 : STD_LOGIC; 
  signal res_61_461_1562 : STD_LOGIC; 
  signal res_61_462_1563 : STD_LOGIC; 
  signal res_61_91_1564 : STD_LOGIC; 
  signal res_62_46 : STD_LOGIC; 
  signal res_62_461_1567 : STD_LOGIC; 
  signal res_62_462_1568 : STD_LOGIC; 
  signal res_62_91_1569 : STD_LOGIC; 
  signal res_63_46 : STD_LOGIC; 
  signal res_63_461_1572 : STD_LOGIC; 
  signal res_63_462_1573 : STD_LOGIC; 
  signal res_63_91_1574 : STD_LOGIC; 
  signal res_64_61_1576 : STD_LOGIC; 
  signal res_64_61_SW0 : STD_LOGIC; 
  signal res_64_61_SW01_1578 : STD_LOGIC; 
  signal res_64_92_1579 : STD_LOGIC; 
  signal res_65_101_1581 : STD_LOGIC; 
  signal res_65_21 : STD_LOGIC; 
  signal res_65_211_1583 : STD_LOGIC; 
  signal res_65_212_1584 : STD_LOGIC; 
  signal res_65_29_1585 : STD_LOGIC; 
  signal res_65_61_1586 : STD_LOGIC; 
  signal res_66_101_1588 : STD_LOGIC; 
  signal res_66_21 : STD_LOGIC; 
  signal res_66_211_1590 : STD_LOGIC; 
  signal res_66_212_1591 : STD_LOGIC; 
  signal res_66_29_1592 : STD_LOGIC; 
  signal res_66_61_1593 : STD_LOGIC; 
  signal res_67_101_1595 : STD_LOGIC; 
  signal res_67_21 : STD_LOGIC; 
  signal res_67_211_1597 : STD_LOGIC; 
  signal res_67_212_1598 : STD_LOGIC; 
  signal res_67_29_1599 : STD_LOGIC; 
  signal res_67_61_1600 : STD_LOGIC; 
  signal res_68_16_1602 : STD_LOGIC; 
  signal res_68_51_1603 : STD_LOGIC; 
  signal res_68_88_1604 : STD_LOGIC; 
  signal res_69_16_1606 : STD_LOGIC; 
  signal res_69_51_1607 : STD_LOGIC; 
  signal res_69_97_1608 : STD_LOGIC; 
  signal res_6_38_1610 : STD_LOGIC; 
  signal res_6_62_1611 : STD_LOGIC; 
  signal res_70_16_1613 : STD_LOGIC; 
  signal res_70_51_1614 : STD_LOGIC; 
  signal res_70_97_1615 : STD_LOGIC; 
  signal res_71_16_1617 : STD_LOGIC; 
  signal res_71_51_1618 : STD_LOGIC; 
  signal res_71_97_1619 : STD_LOGIC; 
  signal res_72_16_1621 : STD_LOGIC; 
  signal res_72_51_1622 : STD_LOGIC; 
  signal res_72_97_1623 : STD_LOGIC; 
  signal res_73_16_1625 : STD_LOGIC; 
  signal res_73_51_1626 : STD_LOGIC; 
  signal res_73_97_1627 : STD_LOGIC; 
  signal res_74_16_1629 : STD_LOGIC; 
  signal res_74_51_1630 : STD_LOGIC; 
  signal res_74_97_1631 : STD_LOGIC; 
  signal res_75_16_1633 : STD_LOGIC; 
  signal res_75_51_1634 : STD_LOGIC; 
  signal res_75_97_1635 : STD_LOGIC; 
  signal res_76_16_1637 : STD_LOGIC; 
  signal res_76_51_1638 : STD_LOGIC; 
  signal res_76_97_1639 : STD_LOGIC; 
  signal res_77_16_1641 : STD_LOGIC; 
  signal res_77_51_1642 : STD_LOGIC; 
  signal res_77_97_1643 : STD_LOGIC; 
  signal res_78_16_1645 : STD_LOGIC; 
  signal res_78_51_1646 : STD_LOGIC; 
  signal res_78_97_1647 : STD_LOGIC; 
  signal res_79_16_1649 : STD_LOGIC; 
  signal res_79_51_1650 : STD_LOGIC; 
  signal res_79_97_1651 : STD_LOGIC; 
  signal res_7_38_1653 : STD_LOGIC; 
  signal res_7_62_1654 : STD_LOGIC; 
  signal res_80_16_1656 : STD_LOGIC; 
  signal res_80_51_1657 : STD_LOGIC; 
  signal res_80_97_1658 : STD_LOGIC; 
  signal res_81_16_1660 : STD_LOGIC; 
  signal res_81_51_1661 : STD_LOGIC; 
  signal res_81_97_1662 : STD_LOGIC; 
  signal res_82_16_1664 : STD_LOGIC; 
  signal res_82_51_1665 : STD_LOGIC; 
  signal res_82_97_1666 : STD_LOGIC; 
  signal res_83_16_1668 : STD_LOGIC; 
  signal res_83_51_1669 : STD_LOGIC; 
  signal res_83_97_1670 : STD_LOGIC; 
  signal res_84_16_1672 : STD_LOGIC; 
  signal res_84_51_1673 : STD_LOGIC; 
  signal res_84_97_1674 : STD_LOGIC; 
  signal res_85_16_1676 : STD_LOGIC; 
  signal res_85_51_1677 : STD_LOGIC; 
  signal res_85_97_1678 : STD_LOGIC; 
  signal res_86_16_1680 : STD_LOGIC; 
  signal res_86_51_1681 : STD_LOGIC; 
  signal res_86_97_1682 : STD_LOGIC; 
  signal res_87_16_1684 : STD_LOGIC; 
  signal res_87_51_1685 : STD_LOGIC; 
  signal res_87_97_1686 : STD_LOGIC; 
  signal res_88_16_1688 : STD_LOGIC; 
  signal res_88_51_1689 : STD_LOGIC; 
  signal res_88_97_1690 : STD_LOGIC; 
  signal res_89_16_1692 : STD_LOGIC; 
  signal res_89_51_1693 : STD_LOGIC; 
  signal res_89_97_1694 : STD_LOGIC; 
  signal res_8_38_1696 : STD_LOGIC; 
  signal res_8_62_1697 : STD_LOGIC; 
  signal res_90_16_1699 : STD_LOGIC; 
  signal res_90_51_1700 : STD_LOGIC; 
  signal res_90_97_1701 : STD_LOGIC; 
  signal res_91_16_1703 : STD_LOGIC; 
  signal res_91_51_1704 : STD_LOGIC; 
  signal res_91_97_1705 : STD_LOGIC; 
  signal res_92_16_1707 : STD_LOGIC; 
  signal res_92_51_1708 : STD_LOGIC; 
  signal res_92_97_1709 : STD_LOGIC; 
  signal res_93_16_1711 : STD_LOGIC; 
  signal res_93_51_1712 : STD_LOGIC; 
  signal res_93_97_1713 : STD_LOGIC; 
  signal res_94_16_1715 : STD_LOGIC; 
  signal res_94_51_1716 : STD_LOGIC; 
  signal res_94_97_1717 : STD_LOGIC; 
  signal res_95_16_1719 : STD_LOGIC; 
  signal res_95_51_1720 : STD_LOGIC; 
  signal res_95_97_1721 : STD_LOGIC; 
  signal res_96_16_1723 : STD_LOGIC; 
  signal res_96_51_1724 : STD_LOGIC; 
  signal res_96_81_1725 : STD_LOGIC; 
  signal res_97_16_1727 : STD_LOGIC; 
  signal res_97_51_1728 : STD_LOGIC; 
  signal res_97_81_1729 : STD_LOGIC; 
  signal res_98_16_1731 : STD_LOGIC; 
  signal res_98_51_1732 : STD_LOGIC; 
  signal res_98_81_1733 : STD_LOGIC; 
  signal res_99_16_1735 : STD_LOGIC; 
  signal res_99_51_1736 : STD_LOGIC; 
  signal res_99_81_1737 : STD_LOGIC; 
  signal res_9_38_1739 : STD_LOGIC; 
  signal res_9_62_1740 : STD_LOGIC; 
  signal res_cmp_eq0001 : STD_LOGIC; 
  signal res_cmp_eq0003 : STD_LOGIC; 
  signal res_cmp_eq0004 : STD_LOGIC; 
  signal res_cmp_eq0006 : STD_LOGIC; 
  signal res_or0001 : STD_LOGIC; 
  signal shift_dir : STD_LOGIC; 
  signal shift_type : STD_LOGIC; 
  signal signe : STD_LOGIC; 
  signal Madd_res_add_Madd_cy : STD_LOGIC_VECTOR ( 127 downto 0 ); 
  signal Madd_res_add_Madd_lut : STD_LOGIC_VECTOR ( 128 downto 0 ); 
  signal Mcompar_nul_cmp_eq0000_cy : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal Mcompar_nul_cmp_eq0000_lut : STD_LOGIC_VECTOR ( 21 downto 0 ); 
  signal efct_op2 : STD_LOGIC_VECTOR ( 127 downto 127 ); 
  signal inst_shifter_buf_3_mux0000 : STD_LOGIC_VECTOR ( 12 downto 12 ); 
  signal inst_shifter_buf_4_mux0000 : STD_LOGIC_VECTOR ( 9 downto 9 ); 
  signal inst_shifter_sign_extd : STD_LOGIC_VECTOR ( 32 downto 32 ); 
  signal res_add : STD_LOGIC_VECTOR ( 128 downto 0 ); 
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
  Madd_res_add_Madd_cy_64_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(63),
      DI => op1(64),
      S => Madd_res_add_Madd_lut(64),
      O => Madd_res_add_Madd_cy(64)
    );
  Madd_res_add_Madd_xor_64_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(63),
      LI => Madd_res_add_Madd_lut(64),
      O => res_add(64)
    );
  Madd_res_add_Madd_cy_65_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(64),
      DI => op1(65),
      S => Madd_res_add_Madd_lut(65),
      O => Madd_res_add_Madd_cy(65)
    );
  Madd_res_add_Madd_xor_65_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(64),
      LI => Madd_res_add_Madd_lut(65),
      O => res_add(65)
    );
  Madd_res_add_Madd_cy_66_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(65),
      DI => op1(66),
      S => Madd_res_add_Madd_lut(66),
      O => Madd_res_add_Madd_cy(66)
    );
  Madd_res_add_Madd_xor_66_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(65),
      LI => Madd_res_add_Madd_lut(66),
      O => res_add(66)
    );
  Madd_res_add_Madd_cy_67_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(66),
      DI => op1(67),
      S => Madd_res_add_Madd_lut(67),
      O => Madd_res_add_Madd_cy(67)
    );
  Madd_res_add_Madd_xor_67_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(66),
      LI => Madd_res_add_Madd_lut(67),
      O => res_add(67)
    );
  Madd_res_add_Madd_cy_68_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(67),
      DI => op1(68),
      S => Madd_res_add_Madd_lut(68),
      O => Madd_res_add_Madd_cy(68)
    );
  Madd_res_add_Madd_xor_68_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(67),
      LI => Madd_res_add_Madd_lut(68),
      O => res_add(68)
    );
  Madd_res_add_Madd_cy_69_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(68),
      DI => op1(69),
      S => Madd_res_add_Madd_lut(69),
      O => Madd_res_add_Madd_cy(69)
    );
  Madd_res_add_Madd_xor_69_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(68),
      LI => Madd_res_add_Madd_lut(69),
      O => res_add(69)
    );
  Madd_res_add_Madd_cy_70_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(69),
      DI => op1(70),
      S => Madd_res_add_Madd_lut(70),
      O => Madd_res_add_Madd_cy(70)
    );
  Madd_res_add_Madd_xor_70_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(69),
      LI => Madd_res_add_Madd_lut(70),
      O => res_add(70)
    );
  Madd_res_add_Madd_cy_71_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(70),
      DI => op1(71),
      S => Madd_res_add_Madd_lut(71),
      O => Madd_res_add_Madd_cy(71)
    );
  Madd_res_add_Madd_xor_71_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(70),
      LI => Madd_res_add_Madd_lut(71),
      O => res_add(71)
    );
  Madd_res_add_Madd_cy_72_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(71),
      DI => op1(72),
      S => Madd_res_add_Madd_lut(72),
      O => Madd_res_add_Madd_cy(72)
    );
  Madd_res_add_Madd_xor_72_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(71),
      LI => Madd_res_add_Madd_lut(72),
      O => res_add(72)
    );
  Madd_res_add_Madd_cy_73_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(72),
      DI => op1(73),
      S => Madd_res_add_Madd_lut(73),
      O => Madd_res_add_Madd_cy(73)
    );
  Madd_res_add_Madd_xor_73_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(72),
      LI => Madd_res_add_Madd_lut(73),
      O => res_add(73)
    );
  Madd_res_add_Madd_cy_74_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(73),
      DI => op1(74),
      S => Madd_res_add_Madd_lut(74),
      O => Madd_res_add_Madd_cy(74)
    );
  Madd_res_add_Madd_xor_74_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(73),
      LI => Madd_res_add_Madd_lut(74),
      O => res_add(74)
    );
  Madd_res_add_Madd_cy_75_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(74),
      DI => op1(75),
      S => Madd_res_add_Madd_lut(75),
      O => Madd_res_add_Madd_cy(75)
    );
  Madd_res_add_Madd_xor_75_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(74),
      LI => Madd_res_add_Madd_lut(75),
      O => res_add(75)
    );
  Madd_res_add_Madd_cy_76_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(75),
      DI => op1(76),
      S => Madd_res_add_Madd_lut(76),
      O => Madd_res_add_Madd_cy(76)
    );
  Madd_res_add_Madd_xor_76_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(75),
      LI => Madd_res_add_Madd_lut(76),
      O => res_add(76)
    );
  Madd_res_add_Madd_cy_77_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(76),
      DI => op1(77),
      S => Madd_res_add_Madd_lut(77),
      O => Madd_res_add_Madd_cy(77)
    );
  Madd_res_add_Madd_xor_77_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(76),
      LI => Madd_res_add_Madd_lut(77),
      O => res_add(77)
    );
  Madd_res_add_Madd_cy_78_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(77),
      DI => op1(78),
      S => Madd_res_add_Madd_lut(78),
      O => Madd_res_add_Madd_cy(78)
    );
  Madd_res_add_Madd_xor_78_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(77),
      LI => Madd_res_add_Madd_lut(78),
      O => res_add(78)
    );
  Madd_res_add_Madd_cy_79_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(78),
      DI => op1(79),
      S => Madd_res_add_Madd_lut(79),
      O => Madd_res_add_Madd_cy(79)
    );
  Madd_res_add_Madd_xor_79_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(78),
      LI => Madd_res_add_Madd_lut(79),
      O => res_add(79)
    );
  Madd_res_add_Madd_cy_80_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(79),
      DI => op1(80),
      S => Madd_res_add_Madd_lut(80),
      O => Madd_res_add_Madd_cy(80)
    );
  Madd_res_add_Madd_xor_80_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(79),
      LI => Madd_res_add_Madd_lut(80),
      O => res_add(80)
    );
  Madd_res_add_Madd_cy_81_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(80),
      DI => op1(81),
      S => Madd_res_add_Madd_lut(81),
      O => Madd_res_add_Madd_cy(81)
    );
  Madd_res_add_Madd_xor_81_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(80),
      LI => Madd_res_add_Madd_lut(81),
      O => res_add(81)
    );
  Madd_res_add_Madd_cy_82_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(81),
      DI => op1(82),
      S => Madd_res_add_Madd_lut(82),
      O => Madd_res_add_Madd_cy(82)
    );
  Madd_res_add_Madd_xor_82_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(81),
      LI => Madd_res_add_Madd_lut(82),
      O => res_add(82)
    );
  Madd_res_add_Madd_cy_83_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(82),
      DI => op1(83),
      S => Madd_res_add_Madd_lut(83),
      O => Madd_res_add_Madd_cy(83)
    );
  Madd_res_add_Madd_xor_83_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(82),
      LI => Madd_res_add_Madd_lut(83),
      O => res_add(83)
    );
  Madd_res_add_Madd_cy_84_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(83),
      DI => op1(84),
      S => Madd_res_add_Madd_lut(84),
      O => Madd_res_add_Madd_cy(84)
    );
  Madd_res_add_Madd_xor_84_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(83),
      LI => Madd_res_add_Madd_lut(84),
      O => res_add(84)
    );
  Madd_res_add_Madd_cy_85_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(84),
      DI => op1(85),
      S => Madd_res_add_Madd_lut(85),
      O => Madd_res_add_Madd_cy(85)
    );
  Madd_res_add_Madd_xor_85_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(84),
      LI => Madd_res_add_Madd_lut(85),
      O => res_add(85)
    );
  Madd_res_add_Madd_cy_86_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(85),
      DI => op1(86),
      S => Madd_res_add_Madd_lut(86),
      O => Madd_res_add_Madd_cy(86)
    );
  Madd_res_add_Madd_xor_86_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(85),
      LI => Madd_res_add_Madd_lut(86),
      O => res_add(86)
    );
  Madd_res_add_Madd_cy_87_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(86),
      DI => op1(87),
      S => Madd_res_add_Madd_lut(87),
      O => Madd_res_add_Madd_cy(87)
    );
  Madd_res_add_Madd_xor_87_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(86),
      LI => Madd_res_add_Madd_lut(87),
      O => res_add(87)
    );
  Madd_res_add_Madd_cy_88_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(87),
      DI => op1(88),
      S => Madd_res_add_Madd_lut(88),
      O => Madd_res_add_Madd_cy(88)
    );
  Madd_res_add_Madd_xor_88_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(87),
      LI => Madd_res_add_Madd_lut(88),
      O => res_add(88)
    );
  Madd_res_add_Madd_cy_89_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(88),
      DI => op1(89),
      S => Madd_res_add_Madd_lut(89),
      O => Madd_res_add_Madd_cy(89)
    );
  Madd_res_add_Madd_xor_89_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(88),
      LI => Madd_res_add_Madd_lut(89),
      O => res_add(89)
    );
  Madd_res_add_Madd_cy_90_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(89),
      DI => op1(90),
      S => Madd_res_add_Madd_lut(90),
      O => Madd_res_add_Madd_cy(90)
    );
  Madd_res_add_Madd_xor_90_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(89),
      LI => Madd_res_add_Madd_lut(90),
      O => res_add(90)
    );
  Madd_res_add_Madd_cy_91_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(90),
      DI => op1(91),
      S => Madd_res_add_Madd_lut(91),
      O => Madd_res_add_Madd_cy(91)
    );
  Madd_res_add_Madd_xor_91_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(90),
      LI => Madd_res_add_Madd_lut(91),
      O => res_add(91)
    );
  Madd_res_add_Madd_cy_92_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(91),
      DI => op1(92),
      S => Madd_res_add_Madd_lut(92),
      O => Madd_res_add_Madd_cy(92)
    );
  Madd_res_add_Madd_xor_92_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(91),
      LI => Madd_res_add_Madd_lut(92),
      O => res_add(92)
    );
  Madd_res_add_Madd_cy_93_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(92),
      DI => op1(93),
      S => Madd_res_add_Madd_lut(93),
      O => Madd_res_add_Madd_cy(93)
    );
  Madd_res_add_Madd_xor_93_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(92),
      LI => Madd_res_add_Madd_lut(93),
      O => res_add(93)
    );
  Madd_res_add_Madd_cy_94_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(93),
      DI => op1(94),
      S => Madd_res_add_Madd_lut(94),
      O => Madd_res_add_Madd_cy(94)
    );
  Madd_res_add_Madd_xor_94_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(93),
      LI => Madd_res_add_Madd_lut(94),
      O => res_add(94)
    );
  Madd_res_add_Madd_cy_95_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(94),
      DI => op1(95),
      S => Madd_res_add_Madd_lut(95),
      O => Madd_res_add_Madd_cy(95)
    );
  Madd_res_add_Madd_xor_95_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(94),
      LI => Madd_res_add_Madd_lut(95),
      O => res_add(95)
    );
  Madd_res_add_Madd_cy_96_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(95),
      DI => op1(96),
      S => Madd_res_add_Madd_lut(96),
      O => Madd_res_add_Madd_cy(96)
    );
  Madd_res_add_Madd_xor_96_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(95),
      LI => Madd_res_add_Madd_lut(96),
      O => res_add(96)
    );
  Madd_res_add_Madd_cy_97_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(96),
      DI => op1(97),
      S => Madd_res_add_Madd_lut(97),
      O => Madd_res_add_Madd_cy(97)
    );
  Madd_res_add_Madd_xor_97_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(96),
      LI => Madd_res_add_Madd_lut(97),
      O => res_add(97)
    );
  Madd_res_add_Madd_cy_98_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(97),
      DI => op1(98),
      S => Madd_res_add_Madd_lut(98),
      O => Madd_res_add_Madd_cy(98)
    );
  Madd_res_add_Madd_xor_98_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(97),
      LI => Madd_res_add_Madd_lut(98),
      O => res_add(98)
    );
  Madd_res_add_Madd_cy_99_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(98),
      DI => op1(99),
      S => Madd_res_add_Madd_lut(99),
      O => Madd_res_add_Madd_cy(99)
    );
  Madd_res_add_Madd_xor_99_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(98),
      LI => Madd_res_add_Madd_lut(99),
      O => res_add(99)
    );
  Madd_res_add_Madd_cy_100_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(99),
      DI => op1(100),
      S => Madd_res_add_Madd_lut(100),
      O => Madd_res_add_Madd_cy(100)
    );
  Madd_res_add_Madd_xor_100_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(99),
      LI => Madd_res_add_Madd_lut(100),
      O => res_add(100)
    );
  Madd_res_add_Madd_cy_101_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(100),
      DI => op1(101),
      S => Madd_res_add_Madd_lut(101),
      O => Madd_res_add_Madd_cy(101)
    );
  Madd_res_add_Madd_xor_101_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(100),
      LI => Madd_res_add_Madd_lut(101),
      O => res_add(101)
    );
  Madd_res_add_Madd_cy_102_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(101),
      DI => op1(102),
      S => Madd_res_add_Madd_lut(102),
      O => Madd_res_add_Madd_cy(102)
    );
  Madd_res_add_Madd_xor_102_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(101),
      LI => Madd_res_add_Madd_lut(102),
      O => res_add(102)
    );
  Madd_res_add_Madd_cy_103_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(102),
      DI => op1(103),
      S => Madd_res_add_Madd_lut(103),
      O => Madd_res_add_Madd_cy(103)
    );
  Madd_res_add_Madd_xor_103_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(102),
      LI => Madd_res_add_Madd_lut(103),
      O => res_add(103)
    );
  Madd_res_add_Madd_cy_104_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(103),
      DI => op1(104),
      S => Madd_res_add_Madd_lut(104),
      O => Madd_res_add_Madd_cy(104)
    );
  Madd_res_add_Madd_xor_104_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(103),
      LI => Madd_res_add_Madd_lut(104),
      O => res_add(104)
    );
  Madd_res_add_Madd_cy_105_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(104),
      DI => op1(105),
      S => Madd_res_add_Madd_lut(105),
      O => Madd_res_add_Madd_cy(105)
    );
  Madd_res_add_Madd_xor_105_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(104),
      LI => Madd_res_add_Madd_lut(105),
      O => res_add(105)
    );
  Madd_res_add_Madd_cy_106_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(105),
      DI => op1(106),
      S => Madd_res_add_Madd_lut(106),
      O => Madd_res_add_Madd_cy(106)
    );
  Madd_res_add_Madd_xor_106_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(105),
      LI => Madd_res_add_Madd_lut(106),
      O => res_add(106)
    );
  Madd_res_add_Madd_cy_107_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(106),
      DI => op1(107),
      S => Madd_res_add_Madd_lut(107),
      O => Madd_res_add_Madd_cy(107)
    );
  Madd_res_add_Madd_xor_107_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(106),
      LI => Madd_res_add_Madd_lut(107),
      O => res_add(107)
    );
  Madd_res_add_Madd_cy_108_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(107),
      DI => op1(108),
      S => Madd_res_add_Madd_lut(108),
      O => Madd_res_add_Madd_cy(108)
    );
  Madd_res_add_Madd_xor_108_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(107),
      LI => Madd_res_add_Madd_lut(108),
      O => res_add(108)
    );
  Madd_res_add_Madd_cy_109_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(108),
      DI => op1(109),
      S => Madd_res_add_Madd_lut(109),
      O => Madd_res_add_Madd_cy(109)
    );
  Madd_res_add_Madd_xor_109_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(108),
      LI => Madd_res_add_Madd_lut(109),
      O => res_add(109)
    );
  Madd_res_add_Madd_cy_110_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(109),
      DI => op1(110),
      S => Madd_res_add_Madd_lut(110),
      O => Madd_res_add_Madd_cy(110)
    );
  Madd_res_add_Madd_xor_110_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(109),
      LI => Madd_res_add_Madd_lut(110),
      O => res_add(110)
    );
  Madd_res_add_Madd_cy_111_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(110),
      DI => op1(111),
      S => Madd_res_add_Madd_lut(111),
      O => Madd_res_add_Madd_cy(111)
    );
  Madd_res_add_Madd_xor_111_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(110),
      LI => Madd_res_add_Madd_lut(111),
      O => res_add(111)
    );
  Madd_res_add_Madd_cy_112_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(111),
      DI => op1(112),
      S => Madd_res_add_Madd_lut(112),
      O => Madd_res_add_Madd_cy(112)
    );
  Madd_res_add_Madd_xor_112_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(111),
      LI => Madd_res_add_Madd_lut(112),
      O => res_add(112)
    );
  Madd_res_add_Madd_cy_113_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(112),
      DI => op1(113),
      S => Madd_res_add_Madd_lut(113),
      O => Madd_res_add_Madd_cy(113)
    );
  Madd_res_add_Madd_xor_113_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(112),
      LI => Madd_res_add_Madd_lut(113),
      O => res_add(113)
    );
  Madd_res_add_Madd_cy_114_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(113),
      DI => op1(114),
      S => Madd_res_add_Madd_lut(114),
      O => Madd_res_add_Madd_cy(114)
    );
  Madd_res_add_Madd_xor_114_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(113),
      LI => Madd_res_add_Madd_lut(114),
      O => res_add(114)
    );
  Madd_res_add_Madd_cy_115_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(114),
      DI => op1(115),
      S => Madd_res_add_Madd_lut(115),
      O => Madd_res_add_Madd_cy(115)
    );
  Madd_res_add_Madd_xor_115_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(114),
      LI => Madd_res_add_Madd_lut(115),
      O => res_add(115)
    );
  Madd_res_add_Madd_cy_116_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(115),
      DI => op1(116),
      S => Madd_res_add_Madd_lut(116),
      O => Madd_res_add_Madd_cy(116)
    );
  Madd_res_add_Madd_xor_116_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(115),
      LI => Madd_res_add_Madd_lut(116),
      O => res_add(116)
    );
  Madd_res_add_Madd_cy_117_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(116),
      DI => op1(117),
      S => Madd_res_add_Madd_lut(117),
      O => Madd_res_add_Madd_cy(117)
    );
  Madd_res_add_Madd_xor_117_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(116),
      LI => Madd_res_add_Madd_lut(117),
      O => res_add(117)
    );
  Madd_res_add_Madd_cy_118_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(117),
      DI => op1(118),
      S => Madd_res_add_Madd_lut(118),
      O => Madd_res_add_Madd_cy(118)
    );
  Madd_res_add_Madd_xor_118_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(117),
      LI => Madd_res_add_Madd_lut(118),
      O => res_add(118)
    );
  Madd_res_add_Madd_cy_119_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(118),
      DI => op1(119),
      S => Madd_res_add_Madd_lut(119),
      O => Madd_res_add_Madd_cy(119)
    );
  Madd_res_add_Madd_xor_119_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(118),
      LI => Madd_res_add_Madd_lut(119),
      O => res_add(119)
    );
  Madd_res_add_Madd_cy_120_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(119),
      DI => op1(120),
      S => Madd_res_add_Madd_lut(120),
      O => Madd_res_add_Madd_cy(120)
    );
  Madd_res_add_Madd_xor_120_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(119),
      LI => Madd_res_add_Madd_lut(120),
      O => res_add(120)
    );
  Madd_res_add_Madd_cy_121_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(120),
      DI => op1(121),
      S => Madd_res_add_Madd_lut(121),
      O => Madd_res_add_Madd_cy(121)
    );
  Madd_res_add_Madd_xor_121_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(120),
      LI => Madd_res_add_Madd_lut(121),
      O => res_add(121)
    );
  Madd_res_add_Madd_cy_122_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(121),
      DI => op1(122),
      S => Madd_res_add_Madd_lut(122),
      O => Madd_res_add_Madd_cy(122)
    );
  Madd_res_add_Madd_xor_122_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(121),
      LI => Madd_res_add_Madd_lut(122),
      O => res_add(122)
    );
  Madd_res_add_Madd_cy_123_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(122),
      DI => op1(123),
      S => Madd_res_add_Madd_lut(123),
      O => Madd_res_add_Madd_cy(123)
    );
  Madd_res_add_Madd_xor_123_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(122),
      LI => Madd_res_add_Madd_lut(123),
      O => res_add(123)
    );
  Madd_res_add_Madd_cy_124_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(123),
      DI => op1(124),
      S => Madd_res_add_Madd_lut(124),
      O => Madd_res_add_Madd_cy(124)
    );
  Madd_res_add_Madd_xor_124_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(123),
      LI => Madd_res_add_Madd_lut(124),
      O => res_add(124)
    );
  Madd_res_add_Madd_cy_125_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(124),
      DI => op1(125),
      S => Madd_res_add_Madd_lut(125),
      O => Madd_res_add_Madd_cy(125)
    );
  Madd_res_add_Madd_xor_125_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(124),
      LI => Madd_res_add_Madd_lut(125),
      O => res_add(125)
    );
  Madd_res_add_Madd_cy_126_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(125),
      DI => op1(126),
      S => Madd_res_add_Madd_lut(126),
      O => Madd_res_add_Madd_cy(126)
    );
  Madd_res_add_Madd_xor_126_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(125),
      LI => Madd_res_add_Madd_lut(126),
      O => res_add(126)
    );
  Madd_res_add_Madd_cy_127_Q : MUXCY
    port map (
      CI => Madd_res_add_Madd_cy(126),
      DI => op1(127),
      S => Madd_res_add_Madd_lut(127),
      O => Madd_res_add_Madd_cy(127)
    );
  Madd_res_add_Madd_xor_127_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(126),
      LI => Madd_res_add_Madd_lut(127),
      O => res_add(127)
    );
  Madd_res_add_Madd_xor_128_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(127),
      LI => Madd_res_add_Madd_lut(128),
      O => res_add(128)
    );
  Mcompar_nul_cmp_eq0000_lut_0_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(0),
      I1 => res_add(1),
      I2 => res_add(2),
      I3 => res_add(3),
      I4 => res_add(4),
      I5 => res_add(5),
      O => Mcompar_nul_cmp_eq0000_lut(0)
    );
  Mcompar_nul_cmp_eq0000_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(0),
      O => Mcompar_nul_cmp_eq0000_cy(0)
    );
  Mcompar_nul_cmp_eq0000_lut_1_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(6),
      I1 => res_add(7),
      I2 => res_add(8),
      I3 => res_add(9),
      I4 => res_add(10),
      I5 => res_add(11),
      O => Mcompar_nul_cmp_eq0000_lut(1)
    );
  Mcompar_nul_cmp_eq0000_cy_1_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(0),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(1),
      O => Mcompar_nul_cmp_eq0000_cy(1)
    );
  Mcompar_nul_cmp_eq0000_lut_2_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(12),
      I1 => res_add(13),
      I2 => res_add(14),
      I3 => res_add(15),
      I4 => res_add(16),
      I5 => res_add(17),
      O => Mcompar_nul_cmp_eq0000_lut(2)
    );
  Mcompar_nul_cmp_eq0000_cy_2_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(1),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(2),
      O => Mcompar_nul_cmp_eq0000_cy(2)
    );
  Mcompar_nul_cmp_eq0000_lut_3_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(18),
      I1 => res_add(19),
      I2 => res_add(20),
      I3 => res_add(21),
      I4 => res_add(22),
      I5 => res_add(23),
      O => Mcompar_nul_cmp_eq0000_lut(3)
    );
  Mcompar_nul_cmp_eq0000_cy_3_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(2),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(3),
      O => Mcompar_nul_cmp_eq0000_cy(3)
    );
  Mcompar_nul_cmp_eq0000_lut_4_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(24),
      I1 => res_add(25),
      I2 => res_add(26),
      I3 => res_add(27),
      I4 => res_add(28),
      I5 => res_add(29),
      O => Mcompar_nul_cmp_eq0000_lut(4)
    );
  Mcompar_nul_cmp_eq0000_cy_4_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(3),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(4),
      O => Mcompar_nul_cmp_eq0000_cy(4)
    );
  Mcompar_nul_cmp_eq0000_lut_5_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(30),
      I1 => res_add(31),
      I2 => res_add(32),
      I3 => res_add(33),
      I4 => res_add(34),
      I5 => res_add(35),
      O => Mcompar_nul_cmp_eq0000_lut(5)
    );
  Mcompar_nul_cmp_eq0000_cy_5_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(4),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(5),
      O => Mcompar_nul_cmp_eq0000_cy(5)
    );
  Mcompar_nul_cmp_eq0000_lut_6_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(36),
      I1 => res_add(37),
      I2 => res_add(38),
      I3 => res_add(39),
      I4 => res_add(40),
      I5 => res_add(41),
      O => Mcompar_nul_cmp_eq0000_lut(6)
    );
  Mcompar_nul_cmp_eq0000_cy_6_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(5),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(6),
      O => Mcompar_nul_cmp_eq0000_cy(6)
    );
  Mcompar_nul_cmp_eq0000_lut_7_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(42),
      I1 => res_add(43),
      I2 => res_add(44),
      I3 => res_add(45),
      I4 => res_add(46),
      I5 => res_add(47),
      O => Mcompar_nul_cmp_eq0000_lut(7)
    );
  Mcompar_nul_cmp_eq0000_cy_7_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(6),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(7),
      O => Mcompar_nul_cmp_eq0000_cy(7)
    );
  Mcompar_nul_cmp_eq0000_lut_8_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(48),
      I1 => res_add(49),
      I2 => res_add(50),
      I3 => res_add(51),
      I4 => res_add(52),
      I5 => res_add(53),
      O => Mcompar_nul_cmp_eq0000_lut(8)
    );
  Mcompar_nul_cmp_eq0000_cy_8_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(7),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(8),
      O => Mcompar_nul_cmp_eq0000_cy(8)
    );
  Mcompar_nul_cmp_eq0000_lut_9_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(54),
      I1 => res_add(55),
      I2 => res_add(56),
      I3 => res_add(57),
      I4 => res_add(58),
      I5 => res_add(59),
      O => Mcompar_nul_cmp_eq0000_lut(9)
    );
  Mcompar_nul_cmp_eq0000_cy_9_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(8),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(9),
      O => Mcompar_nul_cmp_eq0000_cy(9)
    );
  Mcompar_nul_cmp_eq0000_lut_10_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(60),
      I1 => res_add(61),
      I2 => res_add(62),
      I3 => res_add(63),
      I4 => res_add(64),
      I5 => res_add(65),
      O => Mcompar_nul_cmp_eq0000_lut(10)
    );
  Mcompar_nul_cmp_eq0000_cy_10_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(9),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(10),
      O => Mcompar_nul_cmp_eq0000_cy(10)
    );
  Mcompar_nul_cmp_eq0000_lut_11_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(66),
      I1 => res_add(67),
      I2 => res_add(68),
      I3 => res_add(69),
      I4 => res_add(70),
      I5 => res_add(71),
      O => Mcompar_nul_cmp_eq0000_lut(11)
    );
  Mcompar_nul_cmp_eq0000_cy_11_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(10),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(11),
      O => Mcompar_nul_cmp_eq0000_cy(11)
    );
  Mcompar_nul_cmp_eq0000_lut_12_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(72),
      I1 => res_add(73),
      I2 => res_add(74),
      I3 => res_add(75),
      I4 => res_add(76),
      I5 => res_add(77),
      O => Mcompar_nul_cmp_eq0000_lut(12)
    );
  Mcompar_nul_cmp_eq0000_cy_12_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(11),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(12),
      O => Mcompar_nul_cmp_eq0000_cy(12)
    );
  Mcompar_nul_cmp_eq0000_lut_13_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(78),
      I1 => res_add(79),
      I2 => res_add(80),
      I3 => res_add(81),
      I4 => res_add(82),
      I5 => res_add(83),
      O => Mcompar_nul_cmp_eq0000_lut(13)
    );
  Mcompar_nul_cmp_eq0000_cy_13_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(12),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(13),
      O => Mcompar_nul_cmp_eq0000_cy(13)
    );
  Mcompar_nul_cmp_eq0000_lut_14_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(84),
      I1 => res_add(85),
      I2 => res_add(86),
      I3 => res_add(87),
      I4 => res_add(88),
      I5 => res_add(89),
      O => Mcompar_nul_cmp_eq0000_lut(14)
    );
  Mcompar_nul_cmp_eq0000_cy_14_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(13),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(14),
      O => Mcompar_nul_cmp_eq0000_cy(14)
    );
  Mcompar_nul_cmp_eq0000_lut_15_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(90),
      I1 => res_add(91),
      I2 => res_add(92),
      I3 => res_add(93),
      I4 => res_add(94),
      I5 => res_add(95),
      O => Mcompar_nul_cmp_eq0000_lut(15)
    );
  Mcompar_nul_cmp_eq0000_cy_15_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(14),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(15),
      O => Mcompar_nul_cmp_eq0000_cy(15)
    );
  Mcompar_nul_cmp_eq0000_lut_16_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(96),
      I1 => res_add(97),
      I2 => res_add(98),
      I3 => res_add(99),
      I4 => res_add(100),
      I5 => res_add(101),
      O => Mcompar_nul_cmp_eq0000_lut(16)
    );
  Mcompar_nul_cmp_eq0000_cy_16_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(15),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(16),
      O => Mcompar_nul_cmp_eq0000_cy(16)
    );
  Mcompar_nul_cmp_eq0000_lut_17_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(102),
      I1 => res_add(103),
      I2 => res_add(104),
      I3 => res_add(105),
      I4 => res_add(106),
      I5 => res_add(107),
      O => Mcompar_nul_cmp_eq0000_lut(17)
    );
  Mcompar_nul_cmp_eq0000_cy_17_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(16),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(17),
      O => Mcompar_nul_cmp_eq0000_cy(17)
    );
  Mcompar_nul_cmp_eq0000_lut_18_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(108),
      I1 => res_add(109),
      I2 => res_add(110),
      I3 => res_add(111),
      I4 => res_add(112),
      I5 => res_add(113),
      O => Mcompar_nul_cmp_eq0000_lut(18)
    );
  Mcompar_nul_cmp_eq0000_cy_18_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(17),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(18),
      O => Mcompar_nul_cmp_eq0000_cy(18)
    );
  Mcompar_nul_cmp_eq0000_lut_19_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(114),
      I1 => res_add(115),
      I2 => res_add(116),
      I3 => res_add(117),
      I4 => res_add(118),
      I5 => res_add(119),
      O => Mcompar_nul_cmp_eq0000_lut(19)
    );
  Mcompar_nul_cmp_eq0000_cy_19_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(18),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(19),
      O => Mcompar_nul_cmp_eq0000_cy(19)
    );
  Mcompar_nul_cmp_eq0000_lut_20_Q : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(120),
      I1 => res_add(121),
      I2 => res_add(122),
      I3 => res_add(123),
      I4 => res_add(124),
      I5 => res_add(125),
      O => Mcompar_nul_cmp_eq0000_lut(20)
    );
  Mcompar_nul_cmp_eq0000_cy_20_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(19),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(20),
      O => Mcompar_nul_cmp_eq0000_cy(20)
    );
  Mcompar_nul_cmp_eq0000_lut_21_Q : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => res_add(126),
      I1 => res_add(127),
      O => Mcompar_nul_cmp_eq0000_lut(21)
    );
  Mcompar_nul_cmp_eq0000_cy_21_Q : MUXCY
    port map (
      CI => Mcompar_nul_cmp_eq0000_cy(20),
      DI => N0,
      S => Mcompar_nul_cmp_eq0000_lut(21),
      O => nul
    );
  res_100_11 : LUT5
    generic map(
      INIT => X"04400400"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => N01
    );
  res_or00011 : LUT5
    generic map(
      INIT => X"00110110"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => res_or0001
    );
  res_cmp_eq00061 : LUT5
    generic map(
      INIT => X"00004000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(4),
      I4 => op_ctrl(3),
      O => res_cmp_eq0006
    );
  res_cmp_eq00011 : LUT5
    generic map(
      INIT => X"00020000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(3),
      I4 => op_ctrl(2),
      O => res_cmp_eq0001
    );
  res_100_211 : LUT5
    generic map(
      INIT => X"06000040"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      O => N144
    );
  res_0_11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      O => N11
    );
  res_cmp_eq00041 : LUT5
    generic map(
      INIT => X"00004000"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(2),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => op_ctrl(4),
      O => res_cmp_eq0004
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
  res_5_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(5),
      I1 => res_cmp_eq0004,
      I2 => op2(5),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_5_38_1553
    );
  res_7_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(7),
      I1 => res_cmp_eq0004,
      I2 => op2(7),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_7_38_1653
    );
  res_6_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(6),
      I1 => res_cmp_eq0004,
      I2 => op2(6),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_6_38_1610
    );
  res_3_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(3),
      I1 => res_cmp_eq0004,
      I2 => op2(3),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_3_38_1454
    );
  res_2_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(2),
      I1 => res_cmp_eq0004,
      I2 => op2(2),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_2_38_1416
    );
  res_15_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(15),
      I1 => res_cmp_eq0004,
      I2 => op2(15),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_15_38_1370
    );
  res_14_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(14),
      I1 => res_cmp_eq0004,
      I2 => op2(14),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_14_38_1367
    );
  res_13_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(13),
      I1 => res_cmp_eq0004,
      I2 => op2(13),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_13_38_1364
    );
  res_11_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(11),
      I1 => res_cmp_eq0004,
      I2 => op2(11),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_11_38_1326
    );
  res_10_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(10),
      I1 => res_cmp_eq0004,
      I2 => op2(10),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_10_38_1283
    );
  res_18_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(18),
      I1 => res_cmp_eq0004,
      I2 => op2(18),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_18_38_1379
    );
  res_19_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(19),
      I1 => res_cmp_eq0004,
      I2 => op2(19),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_19_38_1382
    );
  res_21_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(21),
      I1 => res_cmp_eq0004,
      I2 => op2(21),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_21_38_1391
    );
  res_22_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(22),
      I1 => res_cmp_eq0004,
      I2 => op2(22),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_22_38_1394
    );
  res_23_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(23),
      I1 => res_cmp_eq0004,
      I2 => op2(23),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_23_38_1397
    );
  res_26_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(26),
      I1 => res_cmp_eq0004,
      I2 => op2(26),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_26_38_1406
    );
  res_8_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(8),
      I1 => res_cmp_eq0004,
      I2 => op2(8),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_8_38_1696
    );
  res_31_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(31),
      I1 => res_cmp_eq0004,
      I2 => op2(31),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_31_38_1421
    );
  res_30_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(30),
      I1 => res_cmp_eq0004,
      I2 => op2(30),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_30_38_1419
    );
  res_29_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(29),
      I1 => res_cmp_eq0004,
      I2 => op2(29),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_29_38_1414
    );
  res_27_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(27),
      I1 => res_cmp_eq0004,
      I2 => op2(27),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_27_38_1409
    );
  res_24_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(24),
      I1 => res_cmp_eq0004,
      I2 => op2(24),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_24_38_1400
    );
  res_1_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(1),
      I1 => res_cmp_eq0004,
      I2 => op2(1),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_1_38_1385
    );
  res_17_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(17),
      I1 => res_cmp_eq0004,
      I2 => op2(17),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_17_38_1376
    );
  res_16_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(16),
      I1 => res_cmp_eq0004,
      I2 => op2(16),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_16_38_1373
    );
  res_34_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(34),
      I1 => res_cmp_eq0004,
      I2 => op2(34),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_34_38_1432
    );
  res_34_104 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_2_Q,
      I4 => inst_shifter_buf_5_34_Q,
      I5 => inst_shifter_buf_5_66_Q,
      O => res_34_104_1431
    );
  res_34_105 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => res_34_62_1433,
      I1 => res_34_104_1431,
      O => res(34)
    );
  res_35_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(35),
      I1 => res_cmp_eq0004,
      I2 => op2(35),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_35_38_1436
    );
  res_35_104 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_3_Q,
      I4 => inst_shifter_buf_5_35_Q,
      I5 => inst_shifter_buf_5_67_Q,
      O => res_35_104_1435
    );
  res_35_105 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => res_35_62_1437,
      I1 => res_35_104_1435,
      O => res(35)
    );
  res_37_108 : LUT5
    generic map(
      INIT => X"FFFFF888"
    )
    port map (
      I0 => res_add(37),
      I1 => res_or0001,
      I2 => N01,
      I3 => res_37_95_1446,
      I4 => res_37_46,
      O => res(37)
    );
  res_4_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(4),
      I1 => res_cmp_eq0004,
      I2 => op2(4),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_4_38_1501
    );
  res_28_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(28),
      I1 => res_cmp_eq0004,
      I2 => op2(28),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_28_38_1411
    );
  res_20_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(20),
      I1 => res_cmp_eq0004,
      I2 => op2(20),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_20_38_1388
    );
  res_12_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(12),
      I1 => res_cmp_eq0004,
      I2 => op2(12),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_12_38_1361
    );
  res_47_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_15_Q,
      I4 => inst_shifter_buf_5_47_Q,
      I5 => inst_shifter_buf_5_79_Q,
      O => res_47_91_1493
    );
  res_47_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_47_46,
      I1 => res_47_91_1493,
      I2 => res_add(47),
      I3 => res_or0001,
      O => res(47)
    );
  res_46_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_14_Q,
      I4 => inst_shifter_buf_5_46_Q,
      I5 => inst_shifter_buf_5_78_Q,
      O => res_46_91_1488
    );
  res_46_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_46_46,
      I1 => res_46_91_1488,
      I2 => res_add(46),
      I3 => res_or0001,
      O => res(46)
    );
  res_45_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_13_Q,
      I4 => inst_shifter_buf_5_45_Q,
      I5 => inst_shifter_buf_5_77_Q,
      O => res_45_91_1483
    );
  res_45_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_45_46,
      I1 => res_45_91_1483,
      I2 => res_add(45),
      I3 => res_or0001,
      O => res(45)
    );
  res_43_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_11_Q,
      I4 => inst_shifter_buf_5_43_Q,
      I5 => inst_shifter_buf_5_75_Q,
      O => res_43_91_1474
    );
  res_43_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_43_46,
      I1 => res_43_91_1474,
      I2 => res_add(43),
      I3 => res_or0001,
      O => res(43)
    );
  res_42_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_10_Q,
      I4 => inst_shifter_buf_5_42_Q,
      I5 => inst_shifter_buf_5_74_Q,
      O => res_42_91_1469
    );
  res_42_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_42_46,
      I1 => res_42_91_1469,
      I2 => res_add(42),
      I3 => res_or0001,
      O => res(42)
    );
  res_39_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(39),
      I1 => res_cmp_eq0004,
      I2 => op2(39),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_39_38_1451
    );
  res_39_45 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(39),
      I2 => op2(39),
      O => res_39_45_1452
    );
  res_38_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(38),
      I1 => res_cmp_eq0004,
      I2 => op2(38),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_38_38_1448
    );
  res_38_45 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(38),
      I2 => op2(38),
      O => res_38_45_1449
    );
  res_33_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(33),
      I1 => res_cmp_eq0004,
      I2 => op2(33),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_33_38_1427
    );
  res_33_106 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_33_62_1428,
      I1 => N01,
      I2 => res_33_95_1429,
      O => res(33)
    );
  res_32_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(32),
      I1 => res_cmp_eq0004,
      I2 => op2(32),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_32_38_1423
    );
  res_32_106 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_32_62_1424,
      I1 => N01,
      I2 => res_32_95_1425,
      O => res(32)
    );
  res_50_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_18_Q,
      I4 => inst_shifter_buf_5_50_Q,
      I5 => inst_shifter_buf_5_82_Q,
      O => res_50_91_1507
    );
  res_50_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_50_46,
      I1 => res_50_91_1507,
      I2 => res_add(50),
      I3 => res_or0001,
      O => res(50)
    );
  res_40_108 : LUT5
    generic map(
      INIT => X"FFFFF888"
    )
    port map (
      I0 => res_add(40),
      I1 => res_or0001,
      I2 => N01,
      I3 => res_40_95_1460,
      I4 => res_40_46,
      O => res(40)
    );
  res_51_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_19_Q,
      I4 => inst_shifter_buf_5_51_Q,
      I5 => inst_shifter_buf_5_83_Q,
      O => res_51_91_1512
    );
  res_51_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_51_46,
      I1 => res_51_91_1512,
      I2 => res_add(51),
      I3 => res_or0001,
      O => res(51)
    );
  res_53_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_21_Q,
      I4 => inst_shifter_buf_5_53_Q,
      I5 => inst_shifter_buf_5_85_Q,
      O => res_53_91_1522
    );
  res_53_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_53_46,
      I1 => res_53_91_1522,
      I2 => res_add(53),
      I3 => res_or0001,
      O => res(53)
    );
  res_54_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_22_Q,
      I4 => inst_shifter_buf_5_54_Q,
      I5 => inst_shifter_buf_5_86_Q,
      O => res_54_91_1527
    );
  res_54_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_54_46,
      I1 => res_54_91_1527,
      I2 => res_add(54),
      I3 => res_or0001,
      O => res(54)
    );
  res_55_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_23_Q,
      I4 => inst_shifter_buf_5_55_Q,
      I5 => inst_shifter_buf_5_87_Q,
      O => res_55_91_1532
    );
  res_55_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_55_46,
      I1 => res_55_91_1532,
      I2 => res_add(55),
      I3 => res_or0001,
      O => res(55)
    );
  res_58_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_26_Q,
      I4 => inst_shifter_buf_5_58_Q,
      I5 => inst_shifter_buf_5_90_Q,
      O => res_58_91_1546
    );
  res_58_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_58_46,
      I1 => res_58_91_1546,
      I2 => res_add(58),
      I3 => res_or0001,
      O => res(58)
    );
  inst_shifter_buf_5_mux0000_89_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_105_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_73_Q,
      I4 => inst_shifter_buf_4_89_Q,
      O => inst_shifter_buf_5_89_Q
    );
  inst_shifter_buf_5_mux0000_84_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_100_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_68_Q,
      I4 => inst_shifter_buf_4_84_Q,
      O => inst_shifter_buf_5_84_Q
    );
  inst_shifter_buf_5_mux0000_76_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_92_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_60_Q,
      I4 => inst_shifter_buf_4_76_Q,
      O => inst_shifter_buf_5_76_Q
    );
  inst_shifter_buf_5_mux0000_73_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_89_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_57_Q,
      I4 => inst_shifter_buf_4_73_Q,
      O => inst_shifter_buf_5_73_Q
    );
  inst_shifter_buf_5_mux0000_72_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_88_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_56_Q,
      I4 => inst_shifter_buf_4_72_Q,
      O => inst_shifter_buf_5_72_Q
    );
  inst_shifter_buf_5_mux0000_69_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_85_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_53_Q,
      I4 => inst_shifter_buf_4_69_Q,
      O => inst_shifter_buf_5_69_Q
    );
  inst_shifter_buf_5_mux0000_68_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_84_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_52_Q,
      I4 => inst_shifter_buf_4_68_Q,
      O => inst_shifter_buf_5_68_Q
    );
  inst_shifter_buf_5_mux0000_67_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_83_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_51_Q,
      I4 => inst_shifter_buf_4_67_Q,
      O => inst_shifter_buf_5_67_Q
    );
  inst_shifter_buf_5_mux0000_66_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_82_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_50_Q,
      I4 => inst_shifter_buf_4_66_Q,
      O => inst_shifter_buf_5_66_Q
    );
  inst_shifter_buf_5_mux0000_65_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_81_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_49_Q,
      I4 => inst_shifter_buf_4_65_Q,
      O => inst_shifter_buf_5_65_Q
    );
  inst_shifter_buf_5_mux0000_64_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_80_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_48_Q,
      I4 => inst_shifter_buf_4_64_Q,
      O => inst_shifter_buf_5_64_Q
    );
  res_9_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(9),
      I1 => res_cmp_eq0004,
      I2 => op2(9),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_9_38_1739
    );
  res_25_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(25),
      I1 => res_cmp_eq0004,
      I2 => op2(25),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_25_38_1403
    );
  res_56_82 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_88_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_24_Q,
      I4 => inst_shifter_buf_5_56_Q,
      O => res_56_82_1537
    );
  res_56_109 : LUT5
    generic map(
      INIT => X"FFFFF888"
    )
    port map (
      I0 => N01,
      I1 => res_56_82_1537,
      I2 => res_add(56),
      I3 => res_or0001,
      I4 => res_56_46,
      O => res(56)
    );
  res_49_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(49),
      I1 => res_cmp_eq0004,
      I2 => op2(49),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_49_38_1498
    );
  res_49_45 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(49),
      I2 => op2(49),
      O => res_49_45_1499
    );
  res_48_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(48),
      I1 => res_cmp_eq0004,
      I2 => op2(48),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_48_38_1495
    );
  res_48_45 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(48),
      I2 => op2(48),
      O => res_48_45_1496
    );
  res_44_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(44),
      I1 => res_cmp_eq0004,
      I2 => op2(44),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_44_38_1476
    );
  res_44_106 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_44_62_1477,
      I1 => N01,
      I2 => res_44_95_1478,
      O => res(44)
    );
  res_36_38 : LUT6
    generic map(
      INIT => X"FAEAFAEAF8E8F848"
    )
    port map (
      I0 => op1(36),
      I1 => res_cmp_eq0004,
      I2 => op2(36),
      I3 => N278,
      I4 => res_cmp_eq0001,
      I5 => N144,
      O => res_36_38_1439
    );
  res_36_106 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => res_36_62_1440,
      I1 => N01,
      I2 => res_36_95_1441,
      O => res(36)
    );
  res_59_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_27_Q,
      I4 => inst_shifter_buf_5_59_Q,
      I5 => inst_shifter_buf_5_91_Q,
      O => res_59_91_1551
    );
  res_59_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_59_46,
      I1 => res_59_91_1551,
      I2 => res_add(59),
      I3 => res_or0001,
      O => res(59)
    );
  res_61_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_29_Q,
      I4 => inst_shifter_buf_5_61_Q,
      I5 => inst_shifter_buf_5_93_Q,
      O => res_61_91_1564
    );
  res_61_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_61_46,
      I1 => res_61_91_1564,
      I2 => res_add(61),
      I3 => res_or0001,
      O => res(61)
    );
  res_62_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_30_Q,
      I4 => inst_shifter_buf_5_62_Q,
      I5 => inst_shifter_buf_5_94_Q,
      O => res_62_91_1569
    );
  res_62_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_62_46,
      I1 => res_62_91_1569,
      I2 => res_add(62),
      I3 => res_or0001,
      O => res(62)
    );
  res_52_95 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_84_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_20_Q,
      I4 => inst_shifter_buf_5_52_Q,
      O => res_52_95_1517
    );
  res_52_108 : LUT5
    generic map(
      INIT => X"FFFFF888"
    )
    port map (
      I0 => res_add(52),
      I1 => res_or0001,
      I2 => N01,
      I3 => res_52_95_1517,
      I4 => res_52_46,
      O => res(52)
    );
  res_63_91 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_31_Q,
      I4 => inst_shifter_buf_5_63_Q,
      I5 => inst_shifter_buf_5_95_Q,
      O => res_63_91_1574
    );
  res_63_108 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_63_46,
      I1 => res_63_91_1574,
      I2 => res_add(63),
      I3 => res_or0001,
      O => res(63)
    );
  res_64_92 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_96_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_32_Q,
      I4 => inst_shifter_buf_5_64_Q,
      O => res_64_92_1579
    );
  res_64_119 : LUT5
    generic map(
      INIT => X"FFFFF888"
    )
    port map (
      I0 => N01,
      I1 => res_64_92_1579,
      I2 => res_add(64),
      I3 => res_or0001,
      I4 => res_64_61_1576,
      O => res(64)
    );
  efct_op2_127_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => op2(127),
      I1 => comp_op2,
      I2 => N8,
      O => efct_op2(127)
    );
  res_65_101 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_33_Q,
      I4 => inst_shifter_buf_5_65_Q,
      I5 => inst_shifter_buf_5_97_Q,
      O => res_65_101_1581
    );
  res_65_118 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_65_61_1586,
      I1 => res_65_101_1581,
      I2 => res_add(65),
      I3 => res_or0001,
      O => res(65)
    );
  res_66_101 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_34_Q,
      I4 => inst_shifter_buf_5_66_Q,
      I5 => inst_shifter_buf_5_98_Q,
      O => res_66_101_1588
    );
  res_66_118 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_66_61_1593,
      I1 => res_66_101_1588,
      I2 => res_add(66),
      I3 => res_or0001,
      O => res(66)
    );
  res_67_101 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_35_Q,
      I4 => inst_shifter_buf_5_67_Q,
      I5 => inst_shifter_buf_5_99_Q,
      O => res_67_101_1595
    );
  res_67_118 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => res_67_61_1600,
      I1 => res_67_101_1595,
      I2 => res_add(67),
      I3 => res_or0001,
      O => res(67)
    );
  shift_type_cmp_eq00001 : LUT5
    generic map(
      INIT => X"00004000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      I4 => op_ctrl(3),
      O => shift_type
    );
  inst_shifter_buf_5_mux0000_99_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_115_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_83_Q,
      I4 => inst_shifter_buf_4_99_Q,
      O => inst_shifter_buf_5_99_Q
    );
  inst_shifter_buf_5_mux0000_98_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_114_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_82_Q,
      I4 => inst_shifter_buf_4_98_Q,
      O => inst_shifter_buf_5_98_Q
    );
  inst_shifter_buf_5_mux0000_97_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_113_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_81_Q,
      I4 => inst_shifter_buf_4_97_Q,
      O => inst_shifter_buf_5_97_Q
    );
  inst_shifter_buf_5_mux0000_96_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_112_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_80_Q,
      I4 => inst_shifter_buf_4_96_Q,
      O => inst_shifter_buf_5_96_Q
    );
  inst_shifter_buf_5_mux0000_95_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_111_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_79_Q,
      I4 => inst_shifter_buf_4_95_Q,
      O => inst_shifter_buf_5_95_Q
    );
  inst_shifter_buf_5_mux0000_94_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_110_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_78_Q,
      I4 => inst_shifter_buf_4_94_Q,
      O => inst_shifter_buf_5_94_Q
    );
  inst_shifter_buf_5_mux0000_93_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_109_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_77_Q,
      I4 => inst_shifter_buf_4_93_Q,
      O => inst_shifter_buf_5_93_Q
    );
  inst_shifter_buf_5_mux0000_92_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_108_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_76_Q,
      I4 => inst_shifter_buf_4_92_Q,
      O => inst_shifter_buf_5_92_Q
    );
  inst_shifter_buf_5_mux0000_91_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_107_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_75_Q,
      I4 => inst_shifter_buf_4_91_Q,
      O => inst_shifter_buf_5_91_Q
    );
  inst_shifter_buf_5_mux0000_90_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_106_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_74_Q,
      I4 => inst_shifter_buf_4_90_Q,
      O => inst_shifter_buf_5_90_Q
    );
  inst_shifter_buf_5_mux0000_88_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_104_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_72_Q,
      I4 => inst_shifter_buf_4_88_Q,
      O => inst_shifter_buf_5_88_Q
    );
  inst_shifter_buf_5_mux0000_87_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_103_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_71_Q,
      I4 => inst_shifter_buf_4_87_Q,
      O => inst_shifter_buf_5_87_Q
    );
  inst_shifter_buf_5_mux0000_86_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_102_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_70_Q,
      I4 => inst_shifter_buf_4_86_Q,
      O => inst_shifter_buf_5_86_Q
    );
  inst_shifter_buf_5_mux0000_85_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_101_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_69_Q,
      I4 => inst_shifter_buf_4_85_Q,
      O => inst_shifter_buf_5_85_Q
    );
  inst_shifter_buf_5_mux0000_83_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_99_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_67_Q,
      I4 => inst_shifter_buf_4_83_Q,
      O => inst_shifter_buf_5_83_Q
    );
  inst_shifter_buf_5_mux0000_82_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_98_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_66_Q,
      I4 => inst_shifter_buf_4_82_Q,
      O => inst_shifter_buf_5_82_Q
    );
  inst_shifter_buf_5_mux0000_81_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_97_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_65_Q,
      I4 => inst_shifter_buf_4_81_Q,
      O => inst_shifter_buf_5_81_Q
    );
  inst_shifter_buf_5_mux0000_80_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_96_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_64_Q,
      I4 => inst_shifter_buf_4_80_Q,
      O => inst_shifter_buf_5_80_Q
    );
  inst_shifter_buf_5_mux0000_79_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_95_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_63_Q,
      I4 => inst_shifter_buf_4_79_Q,
      O => inst_shifter_buf_5_79_Q
    );
  inst_shifter_buf_5_mux0000_78_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_94_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_62_Q,
      I4 => inst_shifter_buf_4_78_Q,
      O => inst_shifter_buf_5_78_Q
    );
  inst_shifter_buf_5_mux0000_77_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_93_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_61_Q,
      I4 => inst_shifter_buf_4_77_Q,
      O => inst_shifter_buf_5_77_Q
    );
  inst_shifter_buf_5_mux0000_75_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_91_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_59_Q,
      I4 => inst_shifter_buf_4_75_Q,
      O => inst_shifter_buf_5_75_Q
    );
  inst_shifter_buf_5_mux0000_74_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_90_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_58_Q,
      I4 => inst_shifter_buf_4_74_Q,
      O => inst_shifter_buf_5_74_Q
    );
  inst_shifter_buf_5_mux0000_71_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_87_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_55_Q,
      I4 => inst_shifter_buf_4_71_Q,
      O => inst_shifter_buf_5_71_Q
    );
  inst_shifter_buf_5_mux0000_70_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_86_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_54_Q,
      I4 => inst_shifter_buf_4_70_Q,
      O => inst_shifter_buf_5_70_Q
    );
  inst_shifter_buf_5_mux0000_63_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_79_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_47_Q,
      I4 => inst_shifter_buf_4_63_Q,
      O => inst_shifter_buf_5_63_Q
    );
  inst_shifter_buf_5_mux0000_62_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_78_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_46_Q,
      I4 => inst_shifter_buf_4_62_Q,
      O => inst_shifter_buf_5_62_Q
    );
  inst_shifter_buf_5_mux0000_61_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_77_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_45_Q,
      I4 => inst_shifter_buf_4_61_Q,
      O => inst_shifter_buf_5_61_Q
    );
  inst_shifter_buf_5_mux0000_60_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_76_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_44_Q,
      I4 => inst_shifter_buf_4_60_Q,
      O => inst_shifter_buf_5_60_Q
    );
  inst_shifter_buf_5_mux0000_59_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_75_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_43_Q,
      I4 => inst_shifter_buf_4_59_Q,
      O => inst_shifter_buf_5_59_Q
    );
  inst_shifter_buf_5_mux0000_58_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_74_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_42_Q,
      I4 => inst_shifter_buf_4_58_Q,
      O => inst_shifter_buf_5_58_Q
    );
  inst_shifter_buf_5_mux0000_57_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_73_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_41_Q,
      I4 => inst_shifter_buf_4_57_Q,
      O => inst_shifter_buf_5_57_Q
    );
  inst_shifter_buf_5_mux0000_56_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_72_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_40_Q,
      I4 => inst_shifter_buf_4_56_Q,
      O => inst_shifter_buf_5_56_Q
    );
  inst_shifter_buf_5_mux0000_55_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_71_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_39_Q,
      I4 => inst_shifter_buf_4_55_Q,
      O => inst_shifter_buf_5_55_Q
    );
  inst_shifter_buf_5_mux0000_54_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_70_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_38_Q,
      I4 => inst_shifter_buf_4_54_Q,
      O => inst_shifter_buf_5_54_Q
    );
  inst_shifter_buf_5_mux0000_53_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_69_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_37_Q,
      I4 => inst_shifter_buf_4_53_Q,
      O => inst_shifter_buf_5_53_Q
    );
  inst_shifter_buf_5_mux0000_52_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_68_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_36_Q,
      I4 => inst_shifter_buf_4_52_Q,
      O => inst_shifter_buf_5_52_Q
    );
  inst_shifter_buf_5_mux0000_51_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_67_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_35_Q,
      I4 => inst_shifter_buf_4_51_Q,
      O => inst_shifter_buf_5_51_Q
    );
  inst_shifter_buf_5_mux0000_50_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_66_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_34_Q,
      I4 => inst_shifter_buf_4_50_Q,
      O => inst_shifter_buf_5_50_Q
    );
  inst_shifter_buf_5_mux0000_49_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_65_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_33_Q,
      I4 => inst_shifter_buf_4_49_Q,
      O => inst_shifter_buf_5_49_Q
    );
  inst_shifter_buf_5_mux0000_48_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_64_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_32_Q,
      I4 => inst_shifter_buf_4_48_Q,
      O => inst_shifter_buf_5_48_Q
    );
  inst_shifter_buf_5_mux0000_47_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_63_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_31_Q,
      I4 => inst_shifter_buf_4_47_Q,
      O => inst_shifter_buf_5_47_Q
    );
  inst_shifter_buf_5_mux0000_46_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_62_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_30_Q,
      I4 => inst_shifter_buf_4_46_Q,
      O => inst_shifter_buf_5_46_Q
    );
  inst_shifter_buf_5_mux0000_45_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_61_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_29_Q,
      I4 => inst_shifter_buf_4_45_Q,
      O => inst_shifter_buf_5_45_Q
    );
  inst_shifter_buf_5_mux0000_44_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_60_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_28_Q,
      I4 => inst_shifter_buf_4_44_Q,
      O => inst_shifter_buf_5_44_Q
    );
  inst_shifter_buf_5_mux0000_43_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_59_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_27_Q,
      I4 => inst_shifter_buf_4_43_Q,
      O => inst_shifter_buf_5_43_Q
    );
  inst_shifter_buf_5_mux0000_42_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_58_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_26_Q,
      I4 => inst_shifter_buf_4_42_Q,
      O => inst_shifter_buf_5_42_Q
    );
  inst_shifter_buf_5_mux0000_41_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_57_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_25_Q,
      I4 => inst_shifter_buf_4_41_Q,
      O => inst_shifter_buf_5_41_Q
    );
  inst_shifter_buf_5_mux0000_40_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_56_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_24_Q,
      I4 => inst_shifter_buf_4_40_Q,
      O => inst_shifter_buf_5_40_Q
    );
  inst_shifter_buf_5_mux0000_39_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_55_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_23_Q,
      I4 => inst_shifter_buf_4_39_Q,
      O => inst_shifter_buf_5_39_Q
    );
  inst_shifter_buf_5_mux0000_38_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_54_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_22_Q,
      I4 => inst_shifter_buf_4_38_Q,
      O => inst_shifter_buf_5_38_Q
    );
  inst_shifter_buf_5_mux0000_37_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_53_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_21_Q,
      I4 => inst_shifter_buf_4_37_Q,
      O => inst_shifter_buf_5_37_Q
    );
  inst_shifter_buf_5_mux0000_35_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_51_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_19_Q,
      I4 => inst_shifter_buf_4_35_Q,
      O => inst_shifter_buf_5_35_Q
    );
  inst_shifter_buf_5_mux0000_34_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_50_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_18_Q,
      I4 => inst_shifter_buf_4_34_Q,
      O => inst_shifter_buf_5_34_Q
    );
  inst_shifter_buf_5_mux0000_33_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_49_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_17_Q,
      I4 => inst_shifter_buf_4_33_Q,
      O => inst_shifter_buf_5_33_Q
    );
  inst_shifter_buf_5_mux0000_31_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_15_Q,
      I4 => inst_shifter_buf_4_31_Q,
      O => inst_shifter_buf_5_31_Q
    );
  inst_shifter_buf_5_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_14_Q,
      I4 => inst_shifter_buf_4_30_Q,
      O => inst_shifter_buf_5_30_Q
    );
  inst_shifter_buf_5_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_13_Q,
      I4 => inst_shifter_buf_4_29_Q,
      O => inst_shifter_buf_5_29_Q
    );
  inst_shifter_buf_5_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_11_Q,
      I4 => inst_shifter_buf_4_27_Q,
      O => inst_shifter_buf_5_27_Q
    );
  inst_shifter_buf_5_mux0000_26_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_10_Q,
      I4 => inst_shifter_buf_4_26_Q,
      O => inst_shifter_buf_5_26_Q
    );
  inst_shifter_buf_5_mux0000_111_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_127_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_95_Q,
      I4 => inst_shifter_buf_4_111_Q,
      O => inst_shifter_buf_5_111_Q
    );
  inst_shifter_buf_5_mux0000_110_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_126_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_94_Q,
      I4 => inst_shifter_buf_4_110_Q,
      O => inst_shifter_buf_5_110_Q
    );
  inst_shifter_buf_5_mux0000_109_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_125_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_93_Q,
      I4 => inst_shifter_buf_4_109_Q,
      O => inst_shifter_buf_5_109_Q
    );
  inst_shifter_buf_5_mux0000_108_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_124_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_92_Q,
      I4 => inst_shifter_buf_4_108_Q,
      O => inst_shifter_buf_5_108_Q
    );
  inst_shifter_buf_5_mux0000_107_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_123_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_91_Q,
      I4 => inst_shifter_buf_4_107_Q,
      O => inst_shifter_buf_5_107_Q
    );
  inst_shifter_buf_5_mux0000_106_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_122_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_90_Q,
      I4 => inst_shifter_buf_4_106_Q,
      O => inst_shifter_buf_5_106_Q
    );
  inst_shifter_buf_5_mux0000_105_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_121_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_89_Q,
      I4 => inst_shifter_buf_4_105_Q,
      O => inst_shifter_buf_5_105_Q
    );
  inst_shifter_buf_5_mux0000_104_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_120_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_88_Q,
      I4 => inst_shifter_buf_4_104_Q,
      O => inst_shifter_buf_5_104_Q
    );
  inst_shifter_buf_5_mux0000_103_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_119_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_87_Q,
      I4 => inst_shifter_buf_4_103_Q,
      O => inst_shifter_buf_5_103_Q
    );
  inst_shifter_buf_5_mux0000_102_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_118_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_86_Q,
      I4 => inst_shifter_buf_4_102_Q,
      O => inst_shifter_buf_5_102_Q
    );
  inst_shifter_buf_5_mux0000_101_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_117_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_85_Q,
      I4 => inst_shifter_buf_4_101_Q,
      O => inst_shifter_buf_5_101_Q
    );
  inst_shifter_buf_5_mux0000_100_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_116_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_84_Q,
      I4 => inst_shifter_buf_4_100_Q,
      O => inst_shifter_buf_5_100_Q
    );
  inst_shifter_buf_4_mux0000_99_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_107_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_91_Q,
      I4 => inst_shifter_buf_3_99_Q,
      O => inst_shifter_buf_4_99_Q
    );
  inst_shifter_buf_4_mux0000_98_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_106_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_90_Q,
      I4 => inst_shifter_buf_3_98_Q,
      O => inst_shifter_buf_4_98_Q
    );
  inst_shifter_buf_4_mux0000_97_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_105_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_89_Q,
      I4 => inst_shifter_buf_3_97_Q,
      O => inst_shifter_buf_4_97_Q
    );
  inst_shifter_buf_4_mux0000_96_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_104_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_88_Q,
      I4 => inst_shifter_buf_3_96_Q,
      O => inst_shifter_buf_4_96_Q
    );
  inst_shifter_buf_4_mux0000_95_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_103_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_87_Q,
      I4 => inst_shifter_buf_3_95_Q,
      O => inst_shifter_buf_4_95_Q
    );
  inst_shifter_buf_4_mux0000_94_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_102_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_86_Q,
      I4 => inst_shifter_buf_3_94_Q,
      O => inst_shifter_buf_4_94_Q
    );
  inst_shifter_buf_4_mux0000_93_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_101_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_85_Q,
      I4 => inst_shifter_buf_3_93_Q,
      O => inst_shifter_buf_4_93_Q
    );
  inst_shifter_buf_4_mux0000_92_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_100_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_84_Q,
      I4 => inst_shifter_buf_3_92_Q,
      O => inst_shifter_buf_4_92_Q
    );
  inst_shifter_buf_4_mux0000_91_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_99_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_83_Q,
      I4 => inst_shifter_buf_3_91_Q,
      O => inst_shifter_buf_4_91_Q
    );
  inst_shifter_buf_4_mux0000_90_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_98_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_82_Q,
      I4 => inst_shifter_buf_3_90_Q,
      O => inst_shifter_buf_4_90_Q
    );
  inst_shifter_buf_4_mux0000_89_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_97_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_81_Q,
      I4 => inst_shifter_buf_3_89_Q,
      O => inst_shifter_buf_4_89_Q
    );
  inst_shifter_buf_4_mux0000_88_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_96_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_80_Q,
      I4 => inst_shifter_buf_3_88_Q,
      O => inst_shifter_buf_4_88_Q
    );
  inst_shifter_buf_4_mux0000_87_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_95_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_79_Q,
      I4 => inst_shifter_buf_3_87_Q,
      O => inst_shifter_buf_4_87_Q
    );
  inst_shifter_buf_4_mux0000_86_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_94_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_78_Q,
      I4 => inst_shifter_buf_3_86_Q,
      O => inst_shifter_buf_4_86_Q
    );
  inst_shifter_buf_4_mux0000_85_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_93_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_77_Q,
      I4 => inst_shifter_buf_3_85_Q,
      O => inst_shifter_buf_4_85_Q
    );
  inst_shifter_buf_4_mux0000_84_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_92_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_76_Q,
      I4 => inst_shifter_buf_3_84_Q,
      O => inst_shifter_buf_4_84_Q
    );
  inst_shifter_buf_4_mux0000_83_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_91_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_75_Q,
      I4 => inst_shifter_buf_3_83_Q,
      O => inst_shifter_buf_4_83_Q
    );
  inst_shifter_buf_4_mux0000_82_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_90_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_74_Q,
      I4 => inst_shifter_buf_3_82_Q,
      O => inst_shifter_buf_4_82_Q
    );
  inst_shifter_buf_4_mux0000_81_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_89_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_73_Q,
      I4 => inst_shifter_buf_3_81_Q,
      O => inst_shifter_buf_4_81_Q
    );
  inst_shifter_buf_4_mux0000_80_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_88_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_72_Q,
      I4 => inst_shifter_buf_3_80_Q,
      O => inst_shifter_buf_4_80_Q
    );
  inst_shifter_buf_4_mux0000_79_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_87_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_71_Q,
      I4 => inst_shifter_buf_3_79_Q,
      O => inst_shifter_buf_4_79_Q
    );
  inst_shifter_buf_4_mux0000_78_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_86_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_70_Q,
      I4 => inst_shifter_buf_3_78_Q,
      O => inst_shifter_buf_4_78_Q
    );
  inst_shifter_buf_4_mux0000_77_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_85_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_69_Q,
      I4 => inst_shifter_buf_3_77_Q,
      O => inst_shifter_buf_4_77_Q
    );
  inst_shifter_buf_4_mux0000_76_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_84_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_68_Q,
      I4 => inst_shifter_buf_3_76_Q,
      O => inst_shifter_buf_4_76_Q
    );
  inst_shifter_buf_4_mux0000_75_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_83_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_67_Q,
      I4 => inst_shifter_buf_3_75_Q,
      O => inst_shifter_buf_4_75_Q
    );
  inst_shifter_buf_4_mux0000_74_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_82_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_66_Q,
      I4 => inst_shifter_buf_3_74_Q,
      O => inst_shifter_buf_4_74_Q
    );
  inst_shifter_buf_4_mux0000_73_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_81_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_65_Q,
      I4 => inst_shifter_buf_3_73_Q,
      O => inst_shifter_buf_4_73_Q
    );
  inst_shifter_buf_4_mux0000_72_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_80_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_64_Q,
      I4 => inst_shifter_buf_3_72_Q,
      O => inst_shifter_buf_4_72_Q
    );
  inst_shifter_buf_4_mux0000_71_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_79_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_63_Q,
      I4 => inst_shifter_buf_3_71_Q,
      O => inst_shifter_buf_4_71_Q
    );
  inst_shifter_buf_4_mux0000_70_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_78_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_62_Q,
      I4 => inst_shifter_buf_3_70_Q,
      O => inst_shifter_buf_4_70_Q
    );
  inst_shifter_buf_4_mux0000_69_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_77_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_61_Q,
      I4 => inst_shifter_buf_3_69_Q,
      O => inst_shifter_buf_4_69_Q
    );
  inst_shifter_buf_4_mux0000_68_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_76_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_60_Q,
      I4 => inst_shifter_buf_3_68_Q,
      O => inst_shifter_buf_4_68_Q
    );
  inst_shifter_buf_4_mux0000_67_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_75_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_59_Q,
      I4 => inst_shifter_buf_3_67_Q,
      O => inst_shifter_buf_4_67_Q
    );
  inst_shifter_buf_4_mux0000_66_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_74_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_58_Q,
      I4 => inst_shifter_buf_3_66_Q,
      O => inst_shifter_buf_4_66_Q
    );
  inst_shifter_buf_4_mux0000_65_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_73_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_57_Q,
      I4 => inst_shifter_buf_3_65_Q,
      O => inst_shifter_buf_4_65_Q
    );
  inst_shifter_buf_4_mux0000_64_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_72_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_56_Q,
      I4 => inst_shifter_buf_3_64_Q,
      O => inst_shifter_buf_4_64_Q
    );
  inst_shifter_buf_4_mux0000_63_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_71_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_55_Q,
      I4 => inst_shifter_buf_3_63_Q,
      O => inst_shifter_buf_4_63_Q
    );
  inst_shifter_buf_4_mux0000_62_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_70_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_54_Q,
      I4 => inst_shifter_buf_3_62_Q,
      O => inst_shifter_buf_4_62_Q
    );
  inst_shifter_buf_4_mux0000_61_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_69_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_53_Q,
      I4 => inst_shifter_buf_3_61_Q,
      O => inst_shifter_buf_4_61_Q
    );
  inst_shifter_buf_4_mux0000_60_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_68_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_52_Q,
      I4 => inst_shifter_buf_3_60_Q,
      O => inst_shifter_buf_4_60_Q
    );
  inst_shifter_buf_4_mux0000_59_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_67_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_51_Q,
      I4 => inst_shifter_buf_3_59_Q,
      O => inst_shifter_buf_4_59_Q
    );
  inst_shifter_buf_4_mux0000_58_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_66_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_50_Q,
      I4 => inst_shifter_buf_3_58_Q,
      O => inst_shifter_buf_4_58_Q
    );
  inst_shifter_buf_4_mux0000_57_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_65_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_49_Q,
      I4 => inst_shifter_buf_3_57_Q,
      O => inst_shifter_buf_4_57_Q
    );
  inst_shifter_buf_4_mux0000_56_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_64_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_48_Q,
      I4 => inst_shifter_buf_3_56_Q,
      O => inst_shifter_buf_4_56_Q
    );
  inst_shifter_buf_4_mux0000_55_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_63_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_47_Q,
      I4 => inst_shifter_buf_3_55_Q,
      O => inst_shifter_buf_4_55_Q
    );
  inst_shifter_buf_4_mux0000_54_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_62_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_46_Q,
      I4 => inst_shifter_buf_3_54_Q,
      O => inst_shifter_buf_4_54_Q
    );
  inst_shifter_buf_4_mux0000_53_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_61_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_45_Q,
      I4 => inst_shifter_buf_3_53_Q,
      O => inst_shifter_buf_4_53_Q
    );
  inst_shifter_buf_4_mux0000_52_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_60_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_44_Q,
      I4 => inst_shifter_buf_3_52_Q,
      O => inst_shifter_buf_4_52_Q
    );
  inst_shifter_buf_4_mux0000_51_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_59_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_43_Q,
      I4 => inst_shifter_buf_3_51_Q,
      O => inst_shifter_buf_4_51_Q
    );
  inst_shifter_buf_4_mux0000_50_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_58_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_42_Q,
      I4 => inst_shifter_buf_3_50_Q,
      O => inst_shifter_buf_4_50_Q
    );
  inst_shifter_buf_4_mux0000_49_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_57_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_41_Q,
      I4 => inst_shifter_buf_3_49_Q,
      O => inst_shifter_buf_4_49_Q
    );
  inst_shifter_buf_4_mux0000_47_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_55_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_39_Q,
      I4 => inst_shifter_buf_3_47_Q,
      O => inst_shifter_buf_4_47_Q
    );
  inst_shifter_buf_4_mux0000_46_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_54_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_38_Q,
      I4 => inst_shifter_buf_3_46_Q,
      O => inst_shifter_buf_4_46_Q
    );
  inst_shifter_buf_4_mux0000_45_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_53_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_37_Q,
      I4 => inst_shifter_buf_3_45_Q,
      O => inst_shifter_buf_4_45_Q
    );
  inst_shifter_buf_4_mux0000_44_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_52_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_36_Q,
      I4 => inst_shifter_buf_3_44_Q,
      O => inst_shifter_buf_4_44_Q
    );
  inst_shifter_buf_4_mux0000_43_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_51_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_35_Q,
      I4 => inst_shifter_buf_3_43_Q,
      O => inst_shifter_buf_4_43_Q
    );
  inst_shifter_buf_4_mux0000_42_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_50_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_34_Q,
      I4 => inst_shifter_buf_3_42_Q,
      O => inst_shifter_buf_4_42_Q
    );
  inst_shifter_buf_4_mux0000_41_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_49_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_33_Q,
      I4 => inst_shifter_buf_3_41_Q,
      O => inst_shifter_buf_4_41_Q
    );
  inst_shifter_buf_4_mux0000_40_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_48_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_32_Q,
      I4 => inst_shifter_buf_3_40_Q,
      O => inst_shifter_buf_4_40_Q
    );
  inst_shifter_buf_4_mux0000_39_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_31_Q,
      I4 => inst_shifter_buf_3_39_Q,
      O => inst_shifter_buf_4_39_Q
    );
  inst_shifter_buf_4_mux0000_38_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_30_Q,
      I4 => inst_shifter_buf_3_38_Q,
      O => inst_shifter_buf_4_38_Q
    );
  inst_shifter_buf_4_mux0000_37_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_29_Q,
      I4 => inst_shifter_buf_3_37_Q,
      O => inst_shifter_buf_4_37_Q
    );
  inst_shifter_buf_4_mux0000_36_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_28_Q,
      I4 => inst_shifter_buf_3_36_Q,
      O => inst_shifter_buf_4_36_Q
    );
  inst_shifter_buf_4_mux0000_35_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_27_Q,
      I4 => inst_shifter_buf_3_35_Q,
      O => inst_shifter_buf_4_35_Q
    );
  inst_shifter_buf_4_mux0000_34_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_26_Q,
      I4 => inst_shifter_buf_3_34_Q,
      O => inst_shifter_buf_4_34_Q
    );
  inst_shifter_buf_4_mux0000_33_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_25_Q,
      I4 => inst_shifter_buf_3_33_Q,
      O => inst_shifter_buf_4_33_Q
    );
  inst_shifter_buf_4_mux0000_31_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_23_Q,
      I4 => inst_shifter_buf_3_31_Q,
      O => inst_shifter_buf_4_31_Q
    );
  inst_shifter_buf_4_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_22_Q,
      I4 => inst_shifter_buf_3_30_Q,
      O => inst_shifter_buf_4_30_Q
    );
  inst_shifter_buf_4_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_21_Q,
      I4 => inst_shifter_buf_3_29_Q,
      O => inst_shifter_buf_4_29_Q
    );
  inst_shifter_buf_4_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_20_Q,
      I4 => inst_shifter_buf_3_28_Q,
      O => inst_shifter_buf_4_28_Q
    );
  inst_shifter_buf_4_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_19_Q,
      I4 => inst_shifter_buf_3_27_Q,
      O => inst_shifter_buf_4_27_Q
    );
  inst_shifter_buf_4_mux0000_26_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_18_Q,
      I4 => inst_shifter_buf_3_26_Q,
      O => inst_shifter_buf_4_26_Q
    );
  inst_shifter_buf_4_mux0000_25_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_33_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_17_Q,
      I4 => inst_shifter_buf_3_25_Q,
      O => inst_shifter_buf_4_25_Q
    );
  inst_shifter_buf_4_mux0000_24_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_16_Q,
      I4 => inst_shifter_buf_3_24_Q,
      O => inst_shifter_buf_4_24_Q
    );
  inst_shifter_buf_4_mux0000_23_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_15_Q,
      I4 => inst_shifter_buf_3_23_Q,
      O => inst_shifter_buf_4_23_Q
    );
  inst_shifter_buf_4_mux0000_22_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_14_Q,
      I4 => inst_shifter_buf_3_22_Q,
      O => inst_shifter_buf_4_22_Q
    );
  inst_shifter_buf_4_mux0000_21_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_13_Q,
      I4 => inst_shifter_buf_3_21_Q,
      O => inst_shifter_buf_4_21_Q
    );
  inst_shifter_buf_4_mux0000_19_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_11_Q,
      I4 => inst_shifter_buf_3_19_Q,
      O => inst_shifter_buf_4_19_Q
    );
  inst_shifter_buf_4_mux0000_18_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_10_Q,
      I4 => inst_shifter_buf_3_18_Q,
      O => inst_shifter_buf_4_18_Q
    );
  inst_shifter_buf_4_mux0000_17_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_9_Q,
      I4 => inst_shifter_buf_3_17_Q,
      O => inst_shifter_buf_4_17_Q
    );
  inst_shifter_buf_4_mux0000_15_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_7_Q,
      I4 => inst_shifter_buf_3_15_Q,
      O => inst_shifter_buf_4_15_Q
    );
  inst_shifter_buf_4_mux0000_14_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_6_Q,
      I4 => inst_shifter_buf_3_14_Q,
      O => inst_shifter_buf_4_14_Q
    );
  inst_shifter_buf_4_mux0000_13_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_5_Q,
      I4 => inst_shifter_buf_3_13_Q,
      O => inst_shifter_buf_4_13_Q
    );
  inst_shifter_buf_4_mux0000_119_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_127_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_111_Q,
      I4 => inst_shifter_buf_3_119_Q,
      O => inst_shifter_buf_4_119_Q
    );
  inst_shifter_buf_4_mux0000_118_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_126_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_110_Q,
      I4 => inst_shifter_buf_3_118_Q,
      O => inst_shifter_buf_4_118_Q
    );
  inst_shifter_buf_4_mux0000_117_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_125_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_109_Q,
      I4 => inst_shifter_buf_3_117_Q,
      O => inst_shifter_buf_4_117_Q
    );
  inst_shifter_buf_4_mux0000_116_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_124_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_108_Q,
      I4 => inst_shifter_buf_3_116_Q,
      O => inst_shifter_buf_4_116_Q
    );
  inst_shifter_buf_4_mux0000_115_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_123_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_107_Q,
      I4 => inst_shifter_buf_3_115_Q,
      O => inst_shifter_buf_4_115_Q
    );
  inst_shifter_buf_4_mux0000_114_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_122_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_106_Q,
      I4 => inst_shifter_buf_3_114_Q,
      O => inst_shifter_buf_4_114_Q
    );
  inst_shifter_buf_4_mux0000_113_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_121_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_105_Q,
      I4 => inst_shifter_buf_3_113_Q,
      O => inst_shifter_buf_4_113_Q
    );
  inst_shifter_buf_4_mux0000_112_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_120_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_104_Q,
      I4 => inst_shifter_buf_3_112_Q,
      O => inst_shifter_buf_4_112_Q
    );
  inst_shifter_buf_4_mux0000_111_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_119_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_103_Q,
      I4 => inst_shifter_buf_3_111_Q,
      O => inst_shifter_buf_4_111_Q
    );
  inst_shifter_buf_4_mux0000_110_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_118_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_102_Q,
      I4 => inst_shifter_buf_3_110_Q,
      O => inst_shifter_buf_4_110_Q
    );
  inst_shifter_buf_4_mux0000_109_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_117_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_101_Q,
      I4 => inst_shifter_buf_3_109_Q,
      O => inst_shifter_buf_4_109_Q
    );
  inst_shifter_buf_4_mux0000_108_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_116_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_100_Q,
      I4 => inst_shifter_buf_3_108_Q,
      O => inst_shifter_buf_4_108_Q
    );
  inst_shifter_buf_4_mux0000_107_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_115_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_99_Q,
      I4 => inst_shifter_buf_3_107_Q,
      O => inst_shifter_buf_4_107_Q
    );
  inst_shifter_buf_4_mux0000_106_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_114_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_98_Q,
      I4 => inst_shifter_buf_3_106_Q,
      O => inst_shifter_buf_4_106_Q
    );
  inst_shifter_buf_4_mux0000_105_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_113_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_97_Q,
      I4 => inst_shifter_buf_3_105_Q,
      O => inst_shifter_buf_4_105_Q
    );
  inst_shifter_buf_4_mux0000_104_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_112_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_96_Q,
      I4 => inst_shifter_buf_3_104_Q,
      O => inst_shifter_buf_4_104_Q
    );
  inst_shifter_buf_4_mux0000_103_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_111_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_95_Q,
      I4 => inst_shifter_buf_3_103_Q,
      O => inst_shifter_buf_4_103_Q
    );
  inst_shifter_buf_4_mux0000_102_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_110_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_94_Q,
      I4 => inst_shifter_buf_3_102_Q,
      O => inst_shifter_buf_4_102_Q
    );
  inst_shifter_buf_4_mux0000_101_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_109_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_93_Q,
      I4 => inst_shifter_buf_3_101_Q,
      O => inst_shifter_buf_4_101_Q
    );
  inst_shifter_buf_4_mux0000_100_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_108_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_92_Q,
      I4 => inst_shifter_buf_3_100_Q,
      O => inst_shifter_buf_4_100_Q
    );
  inst_shifter_buf_3_mux0000_9_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_13_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_5_Q,
      I4 => inst_shifter_buf_2_9_Q,
      O => inst_shifter_buf_3_9_Q
    );
  inst_shifter_buf_3_mux0000_99_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_103_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_95_Q,
      I4 => inst_shifter_buf_2_99_Q,
      O => inst_shifter_buf_3_99_Q
    );
  inst_shifter_buf_3_mux0000_98_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_102_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_94_Q,
      I4 => inst_shifter_buf_2_98_Q,
      O => inst_shifter_buf_3_98_Q
    );
  inst_shifter_buf_3_mux0000_97_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_101_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_93_Q,
      I4 => inst_shifter_buf_2_97_Q,
      O => inst_shifter_buf_3_97_Q
    );
  inst_shifter_buf_3_mux0000_96_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_100_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_92_Q,
      I4 => inst_shifter_buf_2_96_Q,
      O => inst_shifter_buf_3_96_Q
    );
  inst_shifter_buf_3_mux0000_95_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_99_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_91_Q,
      I4 => inst_shifter_buf_2_95_Q,
      O => inst_shifter_buf_3_95_Q
    );
  inst_shifter_buf_3_mux0000_94_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_98_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_90_Q,
      I4 => inst_shifter_buf_2_94_Q,
      O => inst_shifter_buf_3_94_Q
    );
  inst_shifter_buf_3_mux0000_93_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_97_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_89_Q,
      I4 => inst_shifter_buf_2_93_Q,
      O => inst_shifter_buf_3_93_Q
    );
  inst_shifter_buf_3_mux0000_92_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_96_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_88_Q,
      I4 => inst_shifter_buf_2_92_Q,
      O => inst_shifter_buf_3_92_Q
    );
  inst_shifter_buf_3_mux0000_91_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_95_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_87_Q,
      I4 => inst_shifter_buf_2_91_Q,
      O => inst_shifter_buf_3_91_Q
    );
  inst_shifter_buf_3_mux0000_90_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_94_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_86_Q,
      I4 => inst_shifter_buf_2_90_Q,
      O => inst_shifter_buf_3_90_Q
    );
  inst_shifter_buf_3_mux0000_89_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_93_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_85_Q,
      I4 => inst_shifter_buf_2_89_Q,
      O => inst_shifter_buf_3_89_Q
    );
  inst_shifter_buf_3_mux0000_88_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_92_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_84_Q,
      I4 => inst_shifter_buf_2_88_Q,
      O => inst_shifter_buf_3_88_Q
    );
  inst_shifter_buf_3_mux0000_87_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_91_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_83_Q,
      I4 => inst_shifter_buf_2_87_Q,
      O => inst_shifter_buf_3_87_Q
    );
  inst_shifter_buf_3_mux0000_86_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_90_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_82_Q,
      I4 => inst_shifter_buf_2_86_Q,
      O => inst_shifter_buf_3_86_Q
    );
  inst_shifter_buf_3_mux0000_85_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_89_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_81_Q,
      I4 => inst_shifter_buf_2_85_Q,
      O => inst_shifter_buf_3_85_Q
    );
  inst_shifter_buf_3_mux0000_84_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_88_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_80_Q,
      I4 => inst_shifter_buf_2_84_Q,
      O => inst_shifter_buf_3_84_Q
    );
  inst_shifter_buf_3_mux0000_83_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_87_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_79_Q,
      I4 => inst_shifter_buf_2_83_Q,
      O => inst_shifter_buf_3_83_Q
    );
  inst_shifter_buf_3_mux0000_82_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_86_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_78_Q,
      I4 => inst_shifter_buf_2_82_Q,
      O => inst_shifter_buf_3_82_Q
    );
  inst_shifter_buf_3_mux0000_81_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_85_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_77_Q,
      I4 => inst_shifter_buf_2_81_Q,
      O => inst_shifter_buf_3_81_Q
    );
  inst_shifter_buf_3_mux0000_80_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_84_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_76_Q,
      I4 => inst_shifter_buf_2_80_Q,
      O => inst_shifter_buf_3_80_Q
    );
  inst_shifter_buf_3_mux0000_7_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_11_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_3_Q,
      I4 => inst_shifter_buf_2_7_Q,
      O => inst_shifter_buf_3_7_Q
    );
  inst_shifter_buf_3_mux0000_79_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_83_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_75_Q,
      I4 => inst_shifter_buf_2_79_Q,
      O => inst_shifter_buf_3_79_Q
    );
  inst_shifter_buf_3_mux0000_78_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_82_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_74_Q,
      I4 => inst_shifter_buf_2_78_Q,
      O => inst_shifter_buf_3_78_Q
    );
  inst_shifter_buf_3_mux0000_77_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_81_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_73_Q,
      I4 => inst_shifter_buf_2_77_Q,
      O => inst_shifter_buf_3_77_Q
    );
  inst_shifter_buf_3_mux0000_76_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_80_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_72_Q,
      I4 => inst_shifter_buf_2_76_Q,
      O => inst_shifter_buf_3_76_Q
    );
  inst_shifter_buf_3_mux0000_75_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_79_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_71_Q,
      I4 => inst_shifter_buf_2_75_Q,
      O => inst_shifter_buf_3_75_Q
    );
  inst_shifter_buf_3_mux0000_74_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_78_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_70_Q,
      I4 => inst_shifter_buf_2_74_Q,
      O => inst_shifter_buf_3_74_Q
    );
  inst_shifter_buf_3_mux0000_73_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_77_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_69_Q,
      I4 => inst_shifter_buf_2_73_Q,
      O => inst_shifter_buf_3_73_Q
    );
  inst_shifter_buf_3_mux0000_72_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_76_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_68_Q,
      I4 => inst_shifter_buf_2_72_Q,
      O => inst_shifter_buf_3_72_Q
    );
  inst_shifter_buf_3_mux0000_71_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_75_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_67_Q,
      I4 => inst_shifter_buf_2_71_Q,
      O => inst_shifter_buf_3_71_Q
    );
  inst_shifter_buf_3_mux0000_70_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_74_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_66_Q,
      I4 => inst_shifter_buf_2_70_Q,
      O => inst_shifter_buf_3_70_Q
    );
  inst_shifter_buf_3_mux0000_6_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_10_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_2_Q,
      I4 => inst_shifter_buf_2_6_Q,
      O => inst_shifter_buf_3_6_Q
    );
  inst_shifter_buf_3_mux0000_69_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_73_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_65_Q,
      I4 => inst_shifter_buf_2_69_Q,
      O => inst_shifter_buf_3_69_Q
    );
  inst_shifter_buf_3_mux0000_68_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_72_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_64_Q,
      I4 => inst_shifter_buf_2_68_Q,
      O => inst_shifter_buf_3_68_Q
    );
  inst_shifter_buf_3_mux0000_67_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_71_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_63_Q,
      I4 => inst_shifter_buf_2_67_Q,
      O => inst_shifter_buf_3_67_Q
    );
  inst_shifter_buf_3_mux0000_66_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_70_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_62_Q,
      I4 => inst_shifter_buf_2_66_Q,
      O => inst_shifter_buf_3_66_Q
    );
  inst_shifter_buf_3_mux0000_65_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_69_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_61_Q,
      I4 => inst_shifter_buf_2_65_Q,
      O => inst_shifter_buf_3_65_Q
    );
  inst_shifter_buf_3_mux0000_64_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_68_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_60_Q,
      I4 => inst_shifter_buf_2_64_Q,
      O => inst_shifter_buf_3_64_Q
    );
  inst_shifter_buf_3_mux0000_63_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_67_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_59_Q,
      I4 => inst_shifter_buf_2_63_Q,
      O => inst_shifter_buf_3_63_Q
    );
  inst_shifter_buf_3_mux0000_62_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_66_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_58_Q,
      I4 => inst_shifter_buf_2_62_Q,
      O => inst_shifter_buf_3_62_Q
    );
  inst_shifter_buf_3_mux0000_61_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_65_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_57_Q,
      I4 => inst_shifter_buf_2_61_Q,
      O => inst_shifter_buf_3_61_Q
    );
  inst_shifter_buf_3_mux0000_60_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_64_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_56_Q,
      I4 => inst_shifter_buf_2_60_Q,
      O => inst_shifter_buf_3_60_Q
    );
  inst_shifter_buf_3_mux0000_59_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_63_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_55_Q,
      I4 => inst_shifter_buf_2_59_Q,
      O => inst_shifter_buf_3_59_Q
    );
  inst_shifter_buf_3_mux0000_58_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_62_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_54_Q,
      I4 => inst_shifter_buf_2_58_Q,
      O => inst_shifter_buf_3_58_Q
    );
  inst_shifter_buf_3_mux0000_57_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_61_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_53_Q,
      I4 => inst_shifter_buf_2_57_Q,
      O => inst_shifter_buf_3_57_Q
    );
  inst_shifter_buf_3_mux0000_55_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_59_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_51_Q,
      I4 => inst_shifter_buf_2_55_Q,
      O => inst_shifter_buf_3_55_Q
    );
  inst_shifter_buf_3_mux0000_54_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_58_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_50_Q,
      I4 => inst_shifter_buf_2_54_Q,
      O => inst_shifter_buf_3_54_Q
    );
  inst_shifter_buf_3_mux0000_53_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_57_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_49_Q,
      I4 => inst_shifter_buf_2_53_Q,
      O => inst_shifter_buf_3_53_Q
    );
  inst_shifter_buf_3_mux0000_52_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_56_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_48_Q,
      I4 => inst_shifter_buf_2_52_Q,
      O => inst_shifter_buf_3_52_Q
    );
  inst_shifter_buf_3_mux0000_51_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_55_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_47_Q,
      I4 => inst_shifter_buf_2_51_Q,
      O => inst_shifter_buf_3_51_Q
    );
  inst_shifter_buf_3_mux0000_50_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_54_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_46_Q,
      I4 => inst_shifter_buf_2_50_Q,
      O => inst_shifter_buf_3_50_Q
    );
  inst_shifter_buf_3_mux0000_49_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_53_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_45_Q,
      I4 => inst_shifter_buf_2_49_Q,
      O => inst_shifter_buf_3_49_Q
    );
  inst_shifter_buf_3_mux0000_47_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_51_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_43_Q,
      I4 => inst_shifter_buf_2_47_Q,
      O => inst_shifter_buf_3_47_Q
    );
  inst_shifter_buf_3_mux0000_46_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_50_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_42_Q,
      I4 => inst_shifter_buf_2_46_Q,
      O => inst_shifter_buf_3_46_Q
    );
  inst_shifter_buf_3_mux0000_45_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_49_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_41_Q,
      I4 => inst_shifter_buf_2_45_Q,
      O => inst_shifter_buf_3_45_Q
    );
  inst_shifter_buf_3_mux0000_44_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_48_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_40_Q,
      I4 => inst_shifter_buf_2_44_Q,
      O => inst_shifter_buf_3_44_Q
    );
  inst_shifter_buf_3_mux0000_43_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_39_Q,
      I4 => inst_shifter_buf_2_43_Q,
      O => inst_shifter_buf_3_43_Q
    );
  inst_shifter_buf_3_mux0000_42_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_38_Q,
      I4 => inst_shifter_buf_2_42_Q,
      O => inst_shifter_buf_3_42_Q
    );
  inst_shifter_buf_3_mux0000_41_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_37_Q,
      I4 => inst_shifter_buf_2_41_Q,
      O => inst_shifter_buf_3_41_Q
    );
  inst_shifter_buf_3_mux0000_39_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_35_Q,
      I4 => inst_shifter_buf_2_39_Q,
      O => inst_shifter_buf_3_39_Q
    );
  inst_shifter_buf_3_mux0000_38_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_34_Q,
      I4 => inst_shifter_buf_2_38_Q,
      O => inst_shifter_buf_3_38_Q
    );
  inst_shifter_buf_3_mux0000_37_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_33_Q,
      I4 => inst_shifter_buf_2_37_Q,
      O => inst_shifter_buf_3_37_Q
    );
  inst_shifter_buf_3_mux0000_36_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_32_Q,
      I4 => inst_shifter_buf_2_36_Q,
      O => inst_shifter_buf_3_36_Q
    );
  inst_shifter_buf_3_mux0000_35_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_31_Q,
      I4 => inst_shifter_buf_2_35_Q,
      O => inst_shifter_buf_3_35_Q
    );
  inst_shifter_buf_3_mux0000_34_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_30_Q,
      I4 => inst_shifter_buf_2_34_Q,
      O => inst_shifter_buf_3_34_Q
    );
  inst_shifter_buf_3_mux0000_33_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_29_Q,
      I4 => inst_shifter_buf_2_33_Q,
      O => inst_shifter_buf_3_33_Q
    );
  inst_shifter_buf_3_mux0000_31_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_27_Q,
      I4 => inst_shifter_buf_2_31_Q,
      O => inst_shifter_buf_3_31_Q
    );
  inst_shifter_buf_3_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_26_Q,
      I4 => inst_shifter_buf_2_30_Q,
      O => inst_shifter_buf_3_30_Q
    );
  inst_shifter_buf_3_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_33_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_25_Q,
      I4 => inst_shifter_buf_2_29_Q,
      O => inst_shifter_buf_3_29_Q
    );
  inst_shifter_buf_3_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_24_Q,
      I4 => inst_shifter_buf_2_28_Q,
      O => inst_shifter_buf_3_28_Q
    );
  inst_shifter_buf_3_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_23_Q,
      I4 => inst_shifter_buf_2_27_Q,
      O => inst_shifter_buf_3_27_Q
    );
  inst_shifter_buf_3_mux0000_26_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_22_Q,
      I4 => inst_shifter_buf_2_26_Q,
      O => inst_shifter_buf_3_26_Q
    );
  inst_shifter_buf_3_mux0000_25_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_21_Q,
      I4 => inst_shifter_buf_2_25_Q,
      O => inst_shifter_buf_3_25_Q
    );
  inst_shifter_buf_3_mux0000_23_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_19_Q,
      I4 => inst_shifter_buf_2_23_Q,
      O => inst_shifter_buf_3_23_Q
    );
  inst_shifter_buf_3_mux0000_22_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_18_Q,
      I4 => inst_shifter_buf_2_22_Q,
      O => inst_shifter_buf_3_22_Q
    );
  inst_shifter_buf_3_mux0000_21_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_17_Q,
      I4 => inst_shifter_buf_2_21_Q,
      O => inst_shifter_buf_3_21_Q
    );
  inst_shifter_buf_3_mux0000_20_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_16_Q,
      I4 => inst_shifter_buf_2_20_Q,
      O => inst_shifter_buf_3_20_Q
    );
  inst_shifter_buf_3_mux0000_19_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_15_Q,
      I4 => inst_shifter_buf_2_19_Q,
      O => inst_shifter_buf_3_19_Q
    );
  inst_shifter_buf_3_mux0000_18_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_14_Q,
      I4 => inst_shifter_buf_2_18_Q,
      O => inst_shifter_buf_3_18_Q
    );
  inst_shifter_buf_3_mux0000_15_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_11_Q,
      I4 => inst_shifter_buf_2_15_Q,
      O => inst_shifter_buf_3_15_Q
    );
  inst_shifter_buf_3_mux0000_14_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_10_Q,
      I4 => inst_shifter_buf_2_14_Q,
      O => inst_shifter_buf_3_14_Q
    );
  inst_shifter_buf_3_mux0000_13_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_9_Q,
      I4 => inst_shifter_buf_2_13_Q,
      O => inst_shifter_buf_3_13_Q
    );
  inst_shifter_buf_3_mux0000_123_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_127_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_119_Q,
      I4 => inst_shifter_buf_2_123_Q,
      O => inst_shifter_buf_3_123_Q
    );
  inst_shifter_buf_3_mux0000_122_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_126_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_118_Q,
      I4 => inst_shifter_buf_2_122_Q,
      O => inst_shifter_buf_3_122_Q
    );
  inst_shifter_buf_3_mux0000_121_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_125_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_117_Q,
      I4 => inst_shifter_buf_2_121_Q,
      O => inst_shifter_buf_3_121_Q
    );
  inst_shifter_buf_3_mux0000_120_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_124_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_116_Q,
      I4 => inst_shifter_buf_2_120_Q,
      O => inst_shifter_buf_3_120_Q
    );
  inst_shifter_buf_3_mux0000_11_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_15_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_7_Q,
      I4 => inst_shifter_buf_2_11_Q,
      O => inst_shifter_buf_3_11_Q
    );
  inst_shifter_buf_3_mux0000_119_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_123_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_115_Q,
      I4 => inst_shifter_buf_2_119_Q,
      O => inst_shifter_buf_3_119_Q
    );
  inst_shifter_buf_3_mux0000_118_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_122_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_114_Q,
      I4 => inst_shifter_buf_2_118_Q,
      O => inst_shifter_buf_3_118_Q
    );
  inst_shifter_buf_3_mux0000_117_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_121_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_113_Q,
      I4 => inst_shifter_buf_2_117_Q,
      O => inst_shifter_buf_3_117_Q
    );
  inst_shifter_buf_3_mux0000_116_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_120_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_112_Q,
      I4 => inst_shifter_buf_2_116_Q,
      O => inst_shifter_buf_3_116_Q
    );
  inst_shifter_buf_3_mux0000_115_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_119_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_111_Q,
      I4 => inst_shifter_buf_2_115_Q,
      O => inst_shifter_buf_3_115_Q
    );
  inst_shifter_buf_3_mux0000_114_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_118_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_110_Q,
      I4 => inst_shifter_buf_2_114_Q,
      O => inst_shifter_buf_3_114_Q
    );
  inst_shifter_buf_3_mux0000_113_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_117_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_109_Q,
      I4 => inst_shifter_buf_2_113_Q,
      O => inst_shifter_buf_3_113_Q
    );
  inst_shifter_buf_3_mux0000_112_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_116_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_108_Q,
      I4 => inst_shifter_buf_2_112_Q,
      O => inst_shifter_buf_3_112_Q
    );
  inst_shifter_buf_3_mux0000_111_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_115_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_107_Q,
      I4 => inst_shifter_buf_2_111_Q,
      O => inst_shifter_buf_3_111_Q
    );
  inst_shifter_buf_3_mux0000_110_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_114_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_106_Q,
      I4 => inst_shifter_buf_2_110_Q,
      O => inst_shifter_buf_3_110_Q
    );
  inst_shifter_buf_3_mux0000_10_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_14_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_6_Q,
      I4 => inst_shifter_buf_2_10_Q,
      O => inst_shifter_buf_3_10_Q
    );
  inst_shifter_buf_3_mux0000_109_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_113_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_105_Q,
      I4 => inst_shifter_buf_2_109_Q,
      O => inst_shifter_buf_3_109_Q
    );
  inst_shifter_buf_3_mux0000_108_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_112_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_104_Q,
      I4 => inst_shifter_buf_2_108_Q,
      O => inst_shifter_buf_3_108_Q
    );
  inst_shifter_buf_3_mux0000_107_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_111_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_103_Q,
      I4 => inst_shifter_buf_2_107_Q,
      O => inst_shifter_buf_3_107_Q
    );
  inst_shifter_buf_3_mux0000_106_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_110_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_102_Q,
      I4 => inst_shifter_buf_2_106_Q,
      O => inst_shifter_buf_3_106_Q
    );
  inst_shifter_buf_3_mux0000_105_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_109_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_101_Q,
      I4 => inst_shifter_buf_2_105_Q,
      O => inst_shifter_buf_3_105_Q
    );
  inst_shifter_buf_3_mux0000_104_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_108_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_100_Q,
      I4 => inst_shifter_buf_2_104_Q,
      O => inst_shifter_buf_3_104_Q
    );
  inst_shifter_buf_3_mux0000_103_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_107_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_99_Q,
      I4 => inst_shifter_buf_2_103_Q,
      O => inst_shifter_buf_3_103_Q
    );
  inst_shifter_buf_3_mux0000_102_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_106_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_98_Q,
      I4 => inst_shifter_buf_2_102_Q,
      O => inst_shifter_buf_3_102_Q
    );
  inst_shifter_buf_3_mux0000_101_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_105_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_97_Q,
      I4 => inst_shifter_buf_2_101_Q,
      O => inst_shifter_buf_3_101_Q
    );
  inst_shifter_buf_3_mux0000_100_2 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_104_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_96_Q,
      I4 => inst_shifter_buf_2_100_Q,
      O => inst_shifter_buf_3_100_Q
    );
  inst_shifter_buf_2_mux0000_9_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_11_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_7_Q,
      I4 => inst_shifter_buf_1_9_Q,
      O => inst_shifter_buf_2_9_Q
    );
  inst_shifter_buf_2_mux0000_99_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_101_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_97_Q,
      I4 => inst_shifter_buf_1_99_Q,
      O => inst_shifter_buf_2_99_Q
    );
  inst_shifter_buf_2_mux0000_98_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_100_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_96_Q,
      I4 => inst_shifter_buf_1_98_Q,
      O => inst_shifter_buf_2_98_Q
    );
  inst_shifter_buf_2_mux0000_97_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_99_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_95_Q,
      I4 => inst_shifter_buf_1_97_Q,
      O => inst_shifter_buf_2_97_Q
    );
  inst_shifter_buf_2_mux0000_96_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_98_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_94_Q,
      I4 => inst_shifter_buf_1_96_Q,
      O => inst_shifter_buf_2_96_Q
    );
  inst_shifter_buf_2_mux0000_95_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_97_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_93_Q,
      I4 => inst_shifter_buf_1_95_Q,
      O => inst_shifter_buf_2_95_Q
    );
  inst_shifter_buf_2_mux0000_94_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_96_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_92_Q,
      I4 => inst_shifter_buf_1_94_Q,
      O => inst_shifter_buf_2_94_Q
    );
  inst_shifter_buf_2_mux0000_93_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_95_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_91_Q,
      I4 => inst_shifter_buf_1_93_Q,
      O => inst_shifter_buf_2_93_Q
    );
  inst_shifter_buf_2_mux0000_92_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_94_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_90_Q,
      I4 => inst_shifter_buf_1_92_Q,
      O => inst_shifter_buf_2_92_Q
    );
  inst_shifter_buf_2_mux0000_91_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_93_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_89_Q,
      I4 => inst_shifter_buf_1_91_Q,
      O => inst_shifter_buf_2_91_Q
    );
  inst_shifter_buf_2_mux0000_90_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_92_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_88_Q,
      I4 => inst_shifter_buf_1_90_Q,
      O => inst_shifter_buf_2_90_Q
    );
  inst_shifter_buf_2_mux0000_89_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_91_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_87_Q,
      I4 => inst_shifter_buf_1_89_Q,
      O => inst_shifter_buf_2_89_Q
    );
  inst_shifter_buf_2_mux0000_88_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_90_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_86_Q,
      I4 => inst_shifter_buf_1_88_Q,
      O => inst_shifter_buf_2_88_Q
    );
  inst_shifter_buf_2_mux0000_87_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_89_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_85_Q,
      I4 => inst_shifter_buf_1_87_Q,
      O => inst_shifter_buf_2_87_Q
    );
  inst_shifter_buf_2_mux0000_86_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_88_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_84_Q,
      I4 => inst_shifter_buf_1_86_Q,
      O => inst_shifter_buf_2_86_Q
    );
  inst_shifter_buf_2_mux0000_85_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_87_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_83_Q,
      I4 => inst_shifter_buf_1_85_Q,
      O => inst_shifter_buf_2_85_Q
    );
  inst_shifter_buf_2_mux0000_84_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_86_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_82_Q,
      I4 => inst_shifter_buf_1_84_Q,
      O => inst_shifter_buf_2_84_Q
    );
  inst_shifter_buf_2_mux0000_83_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_85_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_81_Q,
      I4 => inst_shifter_buf_1_83_Q,
      O => inst_shifter_buf_2_83_Q
    );
  inst_shifter_buf_2_mux0000_82_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_84_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_80_Q,
      I4 => inst_shifter_buf_1_82_Q,
      O => inst_shifter_buf_2_82_Q
    );
  inst_shifter_buf_2_mux0000_81_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_83_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_79_Q,
      I4 => inst_shifter_buf_1_81_Q,
      O => inst_shifter_buf_2_81_Q
    );
  inst_shifter_buf_2_mux0000_80_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_82_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_78_Q,
      I4 => inst_shifter_buf_1_80_Q,
      O => inst_shifter_buf_2_80_Q
    );
  inst_shifter_buf_2_mux0000_7_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_5_Q,
      I4 => inst_shifter_buf_1_7_Q,
      O => inst_shifter_buf_2_7_Q
    );
  inst_shifter_buf_2_mux0000_79_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_81_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_77_Q,
      I4 => inst_shifter_buf_1_79_Q,
      O => inst_shifter_buf_2_79_Q
    );
  inst_shifter_buf_2_mux0000_78_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_80_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_76_Q,
      I4 => inst_shifter_buf_1_78_Q,
      O => inst_shifter_buf_2_78_Q
    );
  inst_shifter_buf_2_mux0000_77_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_79_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_75_Q,
      I4 => inst_shifter_buf_1_77_Q,
      O => inst_shifter_buf_2_77_Q
    );
  inst_shifter_buf_2_mux0000_76_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_78_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_74_Q,
      I4 => inst_shifter_buf_1_76_Q,
      O => inst_shifter_buf_2_76_Q
    );
  inst_shifter_buf_2_mux0000_75_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_77_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_73_Q,
      I4 => inst_shifter_buf_1_75_Q,
      O => inst_shifter_buf_2_75_Q
    );
  inst_shifter_buf_2_mux0000_74_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_76_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_72_Q,
      I4 => inst_shifter_buf_1_74_Q,
      O => inst_shifter_buf_2_74_Q
    );
  inst_shifter_buf_2_mux0000_73_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_75_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_71_Q,
      I4 => inst_shifter_buf_1_73_Q,
      O => inst_shifter_buf_2_73_Q
    );
  inst_shifter_buf_2_mux0000_72_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_74_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_70_Q,
      I4 => inst_shifter_buf_1_72_Q,
      O => inst_shifter_buf_2_72_Q
    );
  inst_shifter_buf_2_mux0000_71_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_73_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_69_Q,
      I4 => inst_shifter_buf_1_71_Q,
      O => inst_shifter_buf_2_71_Q
    );
  inst_shifter_buf_2_mux0000_70_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_72_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_68_Q,
      I4 => inst_shifter_buf_1_70_Q,
      O => inst_shifter_buf_2_70_Q
    );
  inst_shifter_buf_2_mux0000_6_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_8_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_4_Q,
      I4 => inst_shifter_buf_1_6_Q,
      O => inst_shifter_buf_2_6_Q
    );
  inst_shifter_buf_2_mux0000_69_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_71_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_67_Q,
      I4 => inst_shifter_buf_1_69_Q,
      O => inst_shifter_buf_2_69_Q
    );
  inst_shifter_buf_2_mux0000_68_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_70_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_66_Q,
      I4 => inst_shifter_buf_1_68_Q,
      O => inst_shifter_buf_2_68_Q
    );
  inst_shifter_buf_2_mux0000_67_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_69_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_65_Q,
      I4 => inst_shifter_buf_1_67_Q,
      O => inst_shifter_buf_2_67_Q
    );
  inst_shifter_buf_2_mux0000_3_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_5_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_1_Q,
      I4 => inst_shifter_buf_1_3_Q,
      O => inst_shifter_buf_2_3_Q
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
  inst_shifter_buf_2_mux0000_11_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_13_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_9_Q,
      I4 => inst_shifter_buf_1_11_Q,
      O => inst_shifter_buf_2_11_Q
    );
  inst_shifter_buf_2_mux0000_10_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_12_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_8_Q,
      I4 => inst_shifter_buf_1_10_Q,
      O => inst_shifter_buf_2_10_Q
    );
  inst_shifter_buf_1_mux0000_9_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(10),
      I2 => shift_dir,
      I3 => op2(8),
      I4 => op2(9),
      O => inst_shifter_buf_1_9_Q
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
  inst_shifter_buf_2_mux0000_19_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_17_Q,
      I4 => inst_shifter_buf_1_19_Q,
      O => inst_shifter_buf_2_19_Q
    );
  inst_shifter_buf_2_mux0000_18_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_16_Q,
      I4 => inst_shifter_buf_1_18_Q,
      O => inst_shifter_buf_2_18_Q
    );
  inst_shifter_buf_2_mux0000_15_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_13_Q,
      I4 => inst_shifter_buf_1_15_Q,
      O => inst_shifter_buf_2_15_Q
    );
  inst_shifter_buf_2_mux0000_14_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_16_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_12_Q,
      I4 => inst_shifter_buf_1_14_Q,
      O => inst_shifter_buf_2_14_Q
    );
  inst_shifter_buf_2_mux0000_37_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_39_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_35_Q,
      I4 => inst_shifter_buf_1_37_Q,
      O => inst_shifter_buf_2_37_Q
    );
  inst_shifter_buf_2_mux0000_101_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_103_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_99_Q,
      I4 => inst_shifter_buf_1_101_Q,
      O => inst_shifter_buf_2_101_Q
    );
  inst_shifter_buf_2_mux0000_107_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_109_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_105_Q,
      I4 => inst_shifter_buf_1_107_Q,
      O => inst_shifter_buf_2_107_Q
    );
  inst_shifter_buf_2_mux0000_106_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_108_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_104_Q,
      I4 => inst_shifter_buf_1_106_Q,
      O => inst_shifter_buf_2_106_Q
    );
  inst_shifter_buf_2_mux0000_105_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_107_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_103_Q,
      I4 => inst_shifter_buf_1_105_Q,
      O => inst_shifter_buf_2_105_Q
    );
  inst_shifter_buf_2_mux0000_103_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_105_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_101_Q,
      I4 => inst_shifter_buf_1_103_Q,
      O => inst_shifter_buf_2_103_Q
    );
  inst_shifter_buf_2_mux0000_102_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_104_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_100_Q,
      I4 => inst_shifter_buf_1_102_Q,
      O => inst_shifter_buf_2_102_Q
    );
  inst_shifter_buf_1_mux0000_105_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(106),
      I2 => shift_dir,
      I3 => op2(104),
      I4 => op2(105),
      O => inst_shifter_buf_1_105_Q
    );
  inst_shifter_buf_1_mux0000_103_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(104),
      I2 => shift_dir,
      I3 => op2(102),
      I4 => op2(103),
      O => inst_shifter_buf_1_103_Q
    );
  inst_shifter_buf_1_mux0000_101_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(102),
      I2 => shift_dir,
      I3 => op2(100),
      I4 => op2(101),
      O => inst_shifter_buf_1_101_Q
    );
  inst_shifter_buf_2_mux0000_53_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_55_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_51_Q,
      I4 => inst_shifter_buf_1_53_Q,
      O => inst_shifter_buf_2_53_Q
    );
  inst_shifter_buf_2_mux0000_35_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_37_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_33_Q,
      I4 => inst_shifter_buf_1_35_Q,
      O => inst_shifter_buf_2_35_Q
    );
  inst_shifter_buf_2_mux0000_34_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_32_Q,
      I4 => inst_shifter_buf_1_34_Q,
      O => inst_shifter_buf_2_34_Q
    );
  inst_shifter_buf_2_mux0000_33_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_35_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_31_Q,
      I4 => inst_shifter_buf_1_33_Q,
      O => inst_shifter_buf_2_33_Q
    );
  inst_shifter_buf_2_mux0000_31_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_33_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_29_Q,
      I4 => inst_shifter_buf_1_31_Q,
      O => inst_shifter_buf_2_31_Q
    );
  inst_shifter_buf_2_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_32_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_28_Q,
      I4 => inst_shifter_buf_1_30_Q,
      O => inst_shifter_buf_2_30_Q
    );
  inst_shifter_buf_2_mux0000_22_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_20_Q,
      I4 => inst_shifter_buf_1_22_Q,
      O => inst_shifter_buf_2_22_Q
    );
  inst_shifter_buf_1_mux0000_35_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(36),
      I2 => shift_dir,
      I3 => op2(34),
      I4 => op2(35),
      O => inst_shifter_buf_1_35_Q
    );
  inst_shifter_buf_1_mux0000_33_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(34),
      I2 => shift_dir,
      I3 => op2(32),
      I4 => op2(33),
      O => inst_shifter_buf_1_33_Q
    );
  inst_shifter_buf_2_mux0000_104_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_106_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_102_Q,
      I4 => inst_shifter_buf_1_104_Q,
      O => inst_shifter_buf_2_104_Q
    );
  inst_shifter_buf_1_mux0000_104_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(105),
      I2 => shift_dir,
      I3 => op2(103),
      I4 => op2(104),
      O => inst_shifter_buf_1_104_Q
    );
  inst_shifter_buf_2_mux0000_45_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_47_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_43_Q,
      I4 => inst_shifter_buf_1_45_Q,
      O => inst_shifter_buf_2_45_Q
    );
  inst_shifter_buf_2_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_31_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_27_Q,
      I4 => inst_shifter_buf_1_29_Q,
      O => inst_shifter_buf_2_29_Q
    );
  inst_shifter_buf_2_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_29_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_25_Q,
      I4 => inst_shifter_buf_1_27_Q,
      O => inst_shifter_buf_2_27_Q
    );
  inst_shifter_buf_2_mux0000_26_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_24_Q,
      I4 => inst_shifter_buf_1_26_Q,
      O => inst_shifter_buf_2_26_Q
    );
  inst_shifter_buf_2_mux0000_25_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_27_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_23_Q,
      I4 => inst_shifter_buf_1_25_Q,
      O => inst_shifter_buf_2_25_Q
    );
  inst_shifter_buf_2_mux0000_23_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_25_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_21_Q,
      I4 => inst_shifter_buf_1_23_Q,
      O => inst_shifter_buf_2_23_Q
    );
  inst_shifter_buf_1_mux0000_97_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(98),
      I2 => shift_dir,
      I3 => op2(96),
      I4 => op2(97),
      O => inst_shifter_buf_1_97_Q
    );
  inst_shifter_buf_1_mux0000_96_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(97),
      I2 => shift_dir,
      I3 => op2(95),
      I4 => op2(96),
      O => inst_shifter_buf_1_96_Q
    );
  inst_shifter_buf_1_mux0000_95_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(96),
      I2 => shift_dir,
      I3 => op2(94),
      I4 => op2(95),
      O => inst_shifter_buf_1_95_Q
    );
  inst_shifter_buf_1_mux0000_31_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(32),
      I2 => shift_dir,
      I3 => op2(30),
      I4 => op2(31),
      O => inst_shifter_buf_1_31_Q
    );
  inst_shifter_buf_1_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(30),
      I2 => shift_dir,
      I3 => op2(28),
      I4 => op2(29),
      O => inst_shifter_buf_1_29_Q
    );
  inst_shifter_buf_1_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(28),
      I2 => shift_dir,
      I3 => op2(26),
      I4 => op2(27),
      O => inst_shifter_buf_1_27_Q
    );
  inst_shifter_buf_1_mux0000_25_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(26),
      I2 => shift_dir,
      I3 => op2(24),
      I4 => op2(25),
      O => inst_shifter_buf_1_25_Q
    );
  inst_shifter_buf_1_mux0000_1_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(2),
      I2 => shift_dir,
      I3 => op2(0),
      I4 => op2(1),
      O => inst_shifter_buf_1_1_Q
    );
  inst_shifter_buf_2_mux0000_43_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_45_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_41_Q,
      I4 => inst_shifter_buf_1_43_Q,
      O => inst_shifter_buf_2_43_Q
    );
  inst_shifter_buf_2_mux0000_42_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_40_Q,
      I4 => inst_shifter_buf_1_42_Q,
      O => inst_shifter_buf_2_42_Q
    );
  inst_shifter_buf_2_mux0000_41_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_43_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_39_Q,
      I4 => inst_shifter_buf_1_41_Q,
      O => inst_shifter_buf_2_41_Q
    );
  inst_shifter_buf_2_mux0000_39_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_37_Q,
      I4 => inst_shifter_buf_1_39_Q,
      O => inst_shifter_buf_2_39_Q
    );
  inst_shifter_buf_2_mux0000_38_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_36_Q,
      I4 => inst_shifter_buf_1_38_Q,
      O => inst_shifter_buf_2_38_Q
    );
  inst_shifter_buf_1_mux0000_43_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(44),
      I2 => shift_dir,
      I3 => op2(42),
      I4 => op2(43),
      O => inst_shifter_buf_1_43_Q
    );
  inst_shifter_buf_1_mux0000_41_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(42),
      I2 => shift_dir,
      I3 => op2(40),
      I4 => op2(41),
      O => inst_shifter_buf_1_41_Q
    );
  inst_shifter_buf_1_mux0000_39_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(40),
      I2 => shift_dir,
      I3 => op2(38),
      I4 => op2(39),
      O => inst_shifter_buf_1_39_Q
    );
  inst_shifter_buf_1_mux0000_37_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(38),
      I2 => shift_dir,
      I3 => op2(36),
      I4 => op2(37),
      O => inst_shifter_buf_1_37_Q
    );
  inst_shifter_buf_2_mux0000_115_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_117_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_113_Q,
      I4 => inst_shifter_buf_1_115_Q,
      O => inst_shifter_buf_2_115_Q
    );
  inst_shifter_buf_2_mux0000_114_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_116_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_112_Q,
      I4 => inst_shifter_buf_1_114_Q,
      O => inst_shifter_buf_2_114_Q
    );
  inst_shifter_buf_2_mux0000_113_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_115_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_111_Q,
      I4 => inst_shifter_buf_1_113_Q,
      O => inst_shifter_buf_2_113_Q
    );
  inst_shifter_buf_2_mux0000_111_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_113_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_109_Q,
      I4 => inst_shifter_buf_1_111_Q,
      O => inst_shifter_buf_2_111_Q
    );
  inst_shifter_buf_2_mux0000_110_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_112_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_108_Q,
      I4 => inst_shifter_buf_1_110_Q,
      O => inst_shifter_buf_2_110_Q
    );
  inst_shifter_buf_2_mux0000_109_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_111_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_107_Q,
      I4 => inst_shifter_buf_1_109_Q,
      O => inst_shifter_buf_2_109_Q
    );
  inst_shifter_buf_1_mux0000_113_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(114),
      I2 => shift_dir,
      I3 => op2(112),
      I4 => op2(113),
      O => inst_shifter_buf_1_113_Q
    );
  inst_shifter_buf_1_mux0000_111_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(112),
      I2 => shift_dir,
      I3 => op2(110),
      I4 => op2(111),
      O => inst_shifter_buf_1_111_Q
    );
  inst_shifter_buf_1_mux0000_109_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(110),
      I2 => shift_dir,
      I3 => op2(108),
      I4 => op2(109),
      O => inst_shifter_buf_1_109_Q
    );
  inst_shifter_buf_1_mux0000_107_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(108),
      I2 => shift_dir,
      I3 => op2(106),
      I4 => op2(107),
      O => inst_shifter_buf_1_107_Q
    );
  inst_shifter_buf_2_mux0000_112_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_114_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_110_Q,
      I4 => inst_shifter_buf_1_112_Q,
      O => inst_shifter_buf_2_112_Q
    );
  inst_shifter_buf_2_mux0000_108_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_110_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_106_Q,
      I4 => inst_shifter_buf_1_108_Q,
      O => inst_shifter_buf_2_108_Q
    );
  inst_shifter_buf_2_mux0000_100_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_102_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_98_Q,
      I4 => inst_shifter_buf_1_100_Q,
      O => inst_shifter_buf_2_100_Q
    );
  inst_shifter_buf_1_mux0000_99_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(100),
      I2 => shift_dir,
      I3 => op2(98),
      I4 => op2(99),
      O => inst_shifter_buf_1_99_Q
    );
  inst_shifter_buf_1_mux0000_98_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(99),
      I2 => shift_dir,
      I3 => op2(97),
      I4 => op2(98),
      O => inst_shifter_buf_1_98_Q
    );
  inst_shifter_buf_1_mux0000_94_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(95),
      I2 => shift_dir,
      I3 => op2(93),
      I4 => op2(94),
      O => inst_shifter_buf_1_94_Q
    );
  inst_shifter_buf_1_mux0000_112_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(113),
      I2 => shift_dir,
      I3 => op2(111),
      I4 => op2(112),
      O => inst_shifter_buf_1_112_Q
    );
  inst_shifter_buf_1_mux0000_110_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(111),
      I2 => shift_dir,
      I3 => op2(109),
      I4 => op2(110),
      O => inst_shifter_buf_1_110_Q
    );
  inst_shifter_buf_1_mux0000_108_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(109),
      I2 => shift_dir,
      I3 => op2(107),
      I4 => op2(108),
      O => inst_shifter_buf_1_108_Q
    );
  inst_shifter_buf_1_mux0000_106_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(107),
      I2 => shift_dir,
      I3 => op2(105),
      I4 => op2(106),
      O => inst_shifter_buf_1_106_Q
    );
  inst_shifter_buf_1_mux0000_102_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(103),
      I2 => shift_dir,
      I3 => op2(101),
      I4 => op2(102),
      O => inst_shifter_buf_1_102_Q
    );
  inst_shifter_buf_1_mux0000_100_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(101),
      I2 => shift_dir,
      I3 => op2(99),
      I4 => op2(100),
      O => inst_shifter_buf_1_100_Q
    );
  inst_shifter_buf_2_mux0000_66_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_68_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_64_Q,
      I4 => inst_shifter_buf_1_66_Q,
      O => inst_shifter_buf_2_66_Q
    );
  inst_shifter_buf_2_mux0000_65_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_67_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_63_Q,
      I4 => inst_shifter_buf_1_65_Q,
      O => inst_shifter_buf_2_65_Q
    );
  inst_shifter_buf_2_mux0000_64_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_66_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_62_Q,
      I4 => inst_shifter_buf_1_64_Q,
      O => inst_shifter_buf_2_64_Q
    );
  inst_shifter_buf_1_mux0000_93_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(94),
      I2 => shift_dir,
      I3 => op2(92),
      I4 => op2(93),
      O => inst_shifter_buf_1_93_Q
    );
  inst_shifter_buf_1_mux0000_92_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(93),
      I2 => shift_dir,
      I3 => op2(91),
      I4 => op2(92),
      O => inst_shifter_buf_1_92_Q
    );
  inst_shifter_buf_1_mux0000_91_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(92),
      I2 => shift_dir,
      I3 => op2(90),
      I4 => op2(91),
      O => inst_shifter_buf_1_91_Q
    );
  inst_shifter_buf_1_mux0000_90_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(91),
      I2 => shift_dir,
      I3 => op2(89),
      I4 => op2(90),
      O => inst_shifter_buf_1_90_Q
    );
  inst_shifter_buf_1_mux0000_89_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(90),
      I2 => shift_dir,
      I3 => op2(88),
      I4 => op2(89),
      O => inst_shifter_buf_1_89_Q
    );
  inst_shifter_buf_1_mux0000_88_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(89),
      I2 => shift_dir,
      I3 => op2(87),
      I4 => op2(88),
      O => inst_shifter_buf_1_88_Q
    );
  inst_shifter_buf_1_mux0000_87_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(88),
      I2 => shift_dir,
      I3 => op2(86),
      I4 => op2(87),
      O => inst_shifter_buf_1_87_Q
    );
  inst_shifter_buf_1_mux0000_86_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(87),
      I2 => shift_dir,
      I3 => op2(85),
      I4 => op2(86),
      O => inst_shifter_buf_1_86_Q
    );
  inst_shifter_buf_1_mux0000_85_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(86),
      I2 => shift_dir,
      I3 => op2(84),
      I4 => op2(85),
      O => inst_shifter_buf_1_85_Q
    );
  inst_shifter_buf_1_mux0000_84_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(85),
      I2 => shift_dir,
      I3 => op2(83),
      I4 => op2(84),
      O => inst_shifter_buf_1_84_Q
    );
  inst_shifter_buf_1_mux0000_83_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(84),
      I2 => shift_dir,
      I3 => op2(82),
      I4 => op2(83),
      O => inst_shifter_buf_1_83_Q
    );
  inst_shifter_buf_1_mux0000_82_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(83),
      I2 => shift_dir,
      I3 => op2(81),
      I4 => op2(82),
      O => inst_shifter_buf_1_82_Q
    );
  inst_shifter_buf_1_mux0000_81_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(82),
      I2 => shift_dir,
      I3 => op2(80),
      I4 => op2(81),
      O => inst_shifter_buf_1_81_Q
    );
  inst_shifter_buf_1_mux0000_80_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(81),
      I2 => shift_dir,
      I3 => op2(79),
      I4 => op2(80),
      O => inst_shifter_buf_1_80_Q
    );
  inst_shifter_buf_1_mux0000_79_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(80),
      I2 => shift_dir,
      I3 => op2(78),
      I4 => op2(79),
      O => inst_shifter_buf_1_79_Q
    );
  inst_shifter_buf_1_mux0000_78_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(79),
      I2 => shift_dir,
      I3 => op2(77),
      I4 => op2(78),
      O => inst_shifter_buf_1_78_Q
    );
  inst_shifter_buf_1_mux0000_77_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(78),
      I2 => shift_dir,
      I3 => op2(76),
      I4 => op2(77),
      O => inst_shifter_buf_1_77_Q
    );
  inst_shifter_buf_1_mux0000_76_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(77),
      I2 => shift_dir,
      I3 => op2(75),
      I4 => op2(76),
      O => inst_shifter_buf_1_76_Q
    );
  inst_shifter_buf_1_mux0000_75_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(76),
      I2 => shift_dir,
      I3 => op2(74),
      I4 => op2(75),
      O => inst_shifter_buf_1_75_Q
    );
  inst_shifter_buf_1_mux0000_74_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(75),
      I2 => shift_dir,
      I3 => op2(73),
      I4 => op2(74),
      O => inst_shifter_buf_1_74_Q
    );
  inst_shifter_buf_1_mux0000_73_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(74),
      I2 => shift_dir,
      I3 => op2(72),
      I4 => op2(73),
      O => inst_shifter_buf_1_73_Q
    );
  inst_shifter_buf_1_mux0000_72_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(73),
      I2 => shift_dir,
      I3 => op2(71),
      I4 => op2(72),
      O => inst_shifter_buf_1_72_Q
    );
  inst_shifter_buf_1_mux0000_71_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(72),
      I2 => shift_dir,
      I3 => op2(70),
      I4 => op2(71),
      O => inst_shifter_buf_1_71_Q
    );
  inst_shifter_buf_1_mux0000_70_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(71),
      I2 => shift_dir,
      I3 => op2(69),
      I4 => op2(70),
      O => inst_shifter_buf_1_70_Q
    );
  inst_shifter_buf_1_mux0000_69_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(70),
      I2 => shift_dir,
      I3 => op2(68),
      I4 => op2(69),
      O => inst_shifter_buf_1_69_Q
    );
  inst_shifter_buf_1_mux0000_68_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(69),
      I2 => shift_dir,
      I3 => op2(67),
      I4 => op2(68),
      O => inst_shifter_buf_1_68_Q
    );
  inst_shifter_buf_1_mux0000_67_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(68),
      I2 => shift_dir,
      I3 => op2(66),
      I4 => op2(67),
      O => inst_shifter_buf_1_67_Q
    );
  inst_shifter_buf_1_mux0000_66_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(67),
      I2 => shift_dir,
      I3 => op2(65),
      I4 => op2(66),
      O => inst_shifter_buf_1_66_Q
    );
  res_60_81 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_92_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_28_Q,
      I4 => inst_shifter_buf_5_60_Q,
      O => res_60_81_1559
    );
  res_60_108 : LUT5
    generic map(
      INIT => X"FFFFF888"
    )
    port map (
      I0 => N01,
      I1 => res_60_81_1559,
      I2 => res_add(60),
      I3 => res_or0001,
      I4 => res_60_45,
      O => res(60)
    );
  res_57_34 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(57),
      I1 => res_cmp_eq0004,
      I2 => op2(57),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_57_34_1540
    );
  res_57_44 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => op2(57),
      I1 => res_cmp_eq0004,
      I2 => op1(57),
      I3 => N278,
      O => res_57_44_1541
    );
  res_57_103 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_25_Q,
      I4 => inst_shifter_buf_5_57_Q,
      I5 => inst_shifter_buf_5_89_Q,
      O => res_57_103_1539
    );
  res_41_34 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(41),
      I1 => res_cmp_eq0004,
      I2 => op2(41),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_41_34_1462
    );
  res_41_44 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => op2(41),
      I1 => res_cmp_eq0004,
      I2 => op1(41),
      I3 => N278,
      O => res_41_44_1463
    );
  res_69_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(69),
      I1 => res_cmp_eq0004,
      I2 => op1(69),
      I3 => op2(5),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_69_16_1606
    );
  res_69_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(69),
      I1 => res_cmp_eq0004,
      I2 => op2(69),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_69_51_1607
    );
  res_69_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_37_Q,
      I4 => inst_shifter_buf_5_69_Q,
      I5 => inst_shifter_buf_5_101_Q,
      O => res_69_97_1608
    );
  res_68_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(68),
      I1 => res_cmp_eq0004,
      I2 => op1(68),
      I3 => op2(4),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_68_16_1602
    );
  res_68_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(68),
      I1 => res_cmp_eq0004,
      I2 => op2(68),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_68_51_1603
    );
  res_68_88 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_100_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_36_Q,
      I4 => inst_shifter_buf_5_68_Q,
      O => res_68_88_1604
    );
  res_70_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(70),
      I1 => res_cmp_eq0004,
      I2 => op1(70),
      I3 => op2(6),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_70_16_1613
    );
  res_70_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(70),
      I1 => res_cmp_eq0004,
      I2 => op2(70),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_70_51_1614
    );
  res_70_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_38_Q,
      I4 => inst_shifter_buf_5_70_Q,
      I5 => inst_shifter_buf_5_102_Q,
      O => res_70_97_1615
    );
  inst_shifter_buf_2_mux0000_63_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_65_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_61_Q,
      I4 => inst_shifter_buf_1_63_Q,
      O => inst_shifter_buf_2_63_Q
    );
  inst_shifter_buf_2_mux0000_62_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_64_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_60_Q,
      I4 => inst_shifter_buf_1_62_Q,
      O => inst_shifter_buf_2_62_Q
    );
  inst_shifter_buf_2_mux0000_61_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_63_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_59_Q,
      I4 => inst_shifter_buf_1_61_Q,
      O => inst_shifter_buf_2_61_Q
    );
  inst_shifter_buf_2_mux0000_54_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_56_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_52_Q,
      I4 => inst_shifter_buf_1_54_Q,
      O => inst_shifter_buf_2_54_Q
    );
  inst_shifter_buf_2_mux0000_51_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_53_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_49_Q,
      I4 => inst_shifter_buf_1_51_Q,
      O => inst_shifter_buf_2_51_Q
    );
  inst_shifter_buf_2_mux0000_50_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_52_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_48_Q,
      I4 => inst_shifter_buf_1_50_Q,
      O => inst_shifter_buf_2_50_Q
    );
  inst_shifter_buf_2_mux0000_49_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_51_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_47_Q,
      I4 => inst_shifter_buf_1_49_Q,
      O => inst_shifter_buf_2_49_Q
    );
  inst_shifter_buf_2_mux0000_47_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_49_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_45_Q,
      I4 => inst_shifter_buf_1_47_Q,
      O => inst_shifter_buf_2_47_Q
    );
  inst_shifter_buf_2_mux0000_46_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_48_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_44_Q,
      I4 => inst_shifter_buf_1_46_Q,
      O => inst_shifter_buf_2_46_Q
    );
  inst_shifter_buf_1_mux0000_65_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(66),
      I2 => shift_dir,
      I3 => op2(64),
      I4 => op2(65),
      O => inst_shifter_buf_1_65_Q
    );
  inst_shifter_buf_1_mux0000_64_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(65),
      I2 => shift_dir,
      I3 => op2(63),
      I4 => op2(64),
      O => inst_shifter_buf_1_64_Q
    );
  inst_shifter_buf_1_mux0000_63_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(64),
      I2 => shift_dir,
      I3 => op2(62),
      I4 => op2(63),
      O => inst_shifter_buf_1_63_Q
    );
  inst_shifter_buf_1_mux0000_51_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(52),
      I2 => shift_dir,
      I3 => op2(50),
      I4 => op2(51),
      O => inst_shifter_buf_1_51_Q
    );
  inst_shifter_buf_1_mux0000_49_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(50),
      I2 => shift_dir,
      I3 => op2(48),
      I4 => op2(49),
      O => inst_shifter_buf_1_49_Q
    );
  inst_shifter_buf_1_mux0000_47_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(48),
      I2 => shift_dir,
      I3 => op2(46),
      I4 => op2(47),
      O => inst_shifter_buf_1_47_Q
    );
  inst_shifter_buf_1_mux0000_45_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(46),
      I2 => shift_dir,
      I3 => op2(44),
      I4 => op2(45),
      O => inst_shifter_buf_1_45_Q
    );
  res_71_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(71),
      I1 => res_cmp_eq0004,
      I2 => op1(71),
      I3 => op2(7),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_71_16_1617
    );
  res_71_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(71),
      I1 => res_cmp_eq0004,
      I2 => op2(71),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_71_51_1618
    );
  res_71_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_39_Q,
      I4 => inst_shifter_buf_5_71_Q,
      I5 => inst_shifter_buf_5_103_Q,
      O => res_71_97_1619
    );
  res_72_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(72),
      I1 => res_cmp_eq0004,
      I2 => op1(72),
      I3 => op2(8),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_72_16_1621
    );
  res_72_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(72),
      I1 => res_cmp_eq0004,
      I2 => op2(72),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_72_51_1622
    );
  res_72_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_40_Q,
      I4 => inst_shifter_buf_5_72_Q,
      I5 => inst_shifter_buf_5_104_Q,
      O => res_72_97_1623
    );
  res_73_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(73),
      I1 => res_cmp_eq0004,
      I2 => op1(73),
      I3 => op2(9),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_73_16_1625
    );
  res_73_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(73),
      I1 => res_cmp_eq0004,
      I2 => op2(73),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_73_51_1626
    );
  res_73_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_41_Q,
      I4 => inst_shifter_buf_5_73_Q,
      I5 => inst_shifter_buf_5_105_Q,
      O => res_73_97_1627
    );
  inst_shifter_buf_2_mux0000_59_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_61_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_57_Q,
      I4 => inst_shifter_buf_1_59_Q,
      O => inst_shifter_buf_2_59_Q
    );
  inst_shifter_buf_2_mux0000_58_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_60_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_56_Q,
      I4 => inst_shifter_buf_1_58_Q,
      O => inst_shifter_buf_2_58_Q
    );
  inst_shifter_buf_2_mux0000_57_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_59_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_55_Q,
      I4 => inst_shifter_buf_1_57_Q,
      O => inst_shifter_buf_2_57_Q
    );
  inst_shifter_buf_2_mux0000_55_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_57_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_53_Q,
      I4 => inst_shifter_buf_1_55_Q,
      O => inst_shifter_buf_2_55_Q
    );
  inst_shifter_buf_1_mux0000_61_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(62),
      I2 => shift_dir,
      I3 => op2(60),
      I4 => op2(61),
      O => inst_shifter_buf_1_61_Q
    );
  inst_shifter_buf_1_mux0000_59_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(60),
      I2 => shift_dir,
      I3 => op2(58),
      I4 => op2(59),
      O => inst_shifter_buf_1_59_Q
    );
  inst_shifter_buf_1_mux0000_57_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(58),
      I2 => shift_dir,
      I3 => op2(56),
      I4 => op2(57),
      O => inst_shifter_buf_1_57_Q
    );
  inst_shifter_buf_1_mux0000_55_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(56),
      I2 => shift_dir,
      I3 => op2(54),
      I4 => op2(55),
      O => inst_shifter_buf_1_55_Q
    );
  inst_shifter_buf_1_mux0000_53_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(54),
      I2 => shift_dir,
      I3 => op2(52),
      I4 => op2(53),
      O => inst_shifter_buf_1_53_Q
    );
  res_74_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(74),
      I1 => res_cmp_eq0004,
      I2 => op1(74),
      I3 => op2(10),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_74_16_1629
    );
  res_74_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(74),
      I1 => res_cmp_eq0004,
      I2 => op2(74),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_74_51_1630
    );
  res_74_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_42_Q,
      I4 => inst_shifter_buf_5_74_Q,
      I5 => inst_shifter_buf_5_106_Q,
      O => res_74_97_1631
    );
  res_75_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(75),
      I1 => res_cmp_eq0004,
      I2 => op1(75),
      I3 => op2(11),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_75_16_1633
    );
  res_75_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(75),
      I1 => res_cmp_eq0004,
      I2 => op2(75),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_75_51_1634
    );
  res_75_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_43_Q,
      I4 => inst_shifter_buf_5_75_Q,
      I5 => inst_shifter_buf_5_107_Q,
      O => res_75_97_1635
    );
  inst_shifter_buf_4_mux0000_1_SW0 : LUT5
    generic map(
      INIT => X"FFFF1BBB"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_1_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_3_Q,
      I4 => op1(2),
      O => N285
    );
  res_76_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(76),
      I1 => res_cmp_eq0004,
      I2 => op1(76),
      I3 => op2(12),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_76_16_1637
    );
  res_76_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(76),
      I1 => res_cmp_eq0004,
      I2 => op2(76),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_76_51_1638
    );
  res_76_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_44_Q,
      I4 => inst_shifter_buf_5_76_Q,
      I5 => inst_shifter_buf_5_108_Q,
      O => res_76_97_1639
    );
  inst_shifter_buf_2_mux0000_123_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_125_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_121_Q,
      I4 => inst_shifter_buf_1_123_Q,
      O => inst_shifter_buf_2_123_Q
    );
  inst_shifter_buf_2_mux0000_122_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_124_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_120_Q,
      I4 => inst_shifter_buf_1_122_Q,
      O => inst_shifter_buf_2_122_Q
    );
  inst_shifter_buf_2_mux0000_121_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_123_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_119_Q,
      I4 => inst_shifter_buf_1_121_Q,
      O => inst_shifter_buf_2_121_Q
    );
  inst_shifter_buf_2_mux0000_120_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_122_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_118_Q,
      I4 => inst_shifter_buf_1_120_Q,
      O => inst_shifter_buf_2_120_Q
    );
  inst_shifter_buf_2_mux0000_119_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_121_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_117_Q,
      I4 => inst_shifter_buf_1_119_Q,
      O => inst_shifter_buf_2_119_Q
    );
  inst_shifter_buf_2_mux0000_118_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_120_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_116_Q,
      I4 => inst_shifter_buf_1_118_Q,
      O => inst_shifter_buf_2_118_Q
    );
  inst_shifter_buf_2_mux0000_117_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_119_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_115_Q,
      I4 => inst_shifter_buf_1_117_Q,
      O => inst_shifter_buf_2_117_Q
    );
  inst_shifter_buf_1_mux0000_125_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(126),
      I2 => shift_dir,
      I3 => op2(124),
      I4 => op2(125),
      O => inst_shifter_buf_1_125_Q
    );
  inst_shifter_buf_1_mux0000_123_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(124),
      I2 => shift_dir,
      I3 => op2(122),
      I4 => op2(123),
      O => inst_shifter_buf_1_123_Q
    );
  inst_shifter_buf_1_mux0000_121_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(122),
      I2 => shift_dir,
      I3 => op2(120),
      I4 => op2(121),
      O => inst_shifter_buf_1_121_Q
    );
  inst_shifter_buf_1_mux0000_120_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(121),
      I2 => shift_dir,
      I3 => op2(119),
      I4 => op2(120),
      O => inst_shifter_buf_1_120_Q
    );
  inst_shifter_buf_1_mux0000_119_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(120),
      I2 => shift_dir,
      I3 => op2(118),
      I4 => op2(119),
      O => inst_shifter_buf_1_119_Q
    );
  inst_shifter_buf_1_mux0000_117_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(118),
      I2 => shift_dir,
      I3 => op2(116),
      I4 => op2(117),
      O => inst_shifter_buf_1_117_Q
    );
  inst_shifter_buf_1_mux0000_115_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(116),
      I2 => shift_dir,
      I3 => op2(114),
      I4 => op2(115),
      O => inst_shifter_buf_1_115_Q
    );
  inst_shifter_buf_2_mux0000_124_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_126_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_122_Q,
      I4 => inst_shifter_buf_1_124_Q,
      O => inst_shifter_buf_2_124_Q
    );
  inst_shifter_buf_2_mux0000_116_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_118_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_114_Q,
      I4 => inst_shifter_buf_1_116_Q,
      O => inst_shifter_buf_2_116_Q
    );
  inst_shifter_buf_1_mux0000_126_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(127),
      I2 => shift_dir,
      I3 => op2(125),
      I4 => op2(126),
      O => inst_shifter_buf_1_126_Q
    );
  inst_shifter_buf_1_mux0000_124_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(125),
      I2 => shift_dir,
      I3 => op2(123),
      I4 => op2(124),
      O => inst_shifter_buf_1_124_Q
    );
  inst_shifter_buf_1_mux0000_122_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(123),
      I2 => shift_dir,
      I3 => op2(121),
      I4 => op2(122),
      O => inst_shifter_buf_1_122_Q
    );
  inst_shifter_buf_1_mux0000_118_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(119),
      I2 => shift_dir,
      I3 => op2(117),
      I4 => op2(118),
      O => inst_shifter_buf_1_118_Q
    );
  inst_shifter_buf_1_mux0000_116_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(117),
      I2 => shift_dir,
      I3 => op2(115),
      I4 => op2(116),
      O => inst_shifter_buf_1_116_Q
    );
  inst_shifter_buf_1_mux0000_114_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(115),
      I2 => shift_dir,
      I3 => op2(113),
      I4 => op2(114),
      O => inst_shifter_buf_1_114_Q
    );
  res_77_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(77),
      I1 => res_cmp_eq0004,
      I2 => op1(77),
      I3 => op2(13),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_77_16_1641
    );
  res_77_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(77),
      I1 => res_cmp_eq0004,
      I2 => op2(77),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_77_51_1642
    );
  res_77_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_45_Q,
      I4 => inst_shifter_buf_5_77_Q,
      I5 => inst_shifter_buf_5_109_Q,
      O => res_77_97_1643
    );
  res_78_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(78),
      I1 => res_cmp_eq0004,
      I2 => op1(78),
      I3 => op2(14),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_78_16_1645
    );
  res_78_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(78),
      I1 => res_cmp_eq0004,
      I2 => op2(78),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_78_51_1646
    );
  res_78_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_46_Q,
      I4 => inst_shifter_buf_5_78_Q,
      I5 => inst_shifter_buf_5_110_Q,
      O => res_78_97_1647
    );
  inst_shifter_buf_5_mux0000_24_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_8_Q,
      I4 => inst_shifter_buf_4_24_Q,
      O => inst_shifter_buf_5_24_Q
    );
  inst_shifter_buf_4_mux0000_8_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_16_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_0_Q,
      I4 => inst_shifter_buf_3_8_Q,
      O => inst_shifter_buf_4_8_Q
    );
  res_79_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(79),
      I1 => res_cmp_eq0004,
      I2 => op1(79),
      I3 => op2(15),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_79_16_1649
    );
  res_79_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(79),
      I1 => res_cmp_eq0004,
      I2 => op2(79),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_79_51_1650
    );
  res_79_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_47_Q,
      I4 => inst_shifter_buf_5_79_Q,
      I5 => inst_shifter_buf_5_111_Q,
      O => res_79_97_1651
    );
  inst_shifter_buf_4_mux0000_48_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_56_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_40_Q,
      I4 => inst_shifter_buf_3_48_Q,
      O => inst_shifter_buf_4_48_Q
    );
  inst_shifter_buf_4_mux0000_32_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_40_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_24_Q,
      I4 => inst_shifter_buf_3_32_Q,
      O => inst_shifter_buf_4_32_Q
    );
  inst_shifter_buf_3_mux0000_56_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_60_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_52_Q,
      I4 => inst_shifter_buf_2_56_Q,
      O => inst_shifter_buf_3_56_Q
    );
  inst_shifter_buf_3_mux0000_48_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_52_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_44_Q,
      I4 => inst_shifter_buf_2_48_Q,
      O => inst_shifter_buf_3_48_Q
    );
  inst_shifter_buf_3_mux0000_40_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_36_Q,
      I4 => inst_shifter_buf_2_40_Q,
      O => inst_shifter_buf_3_40_Q
    );
  inst_shifter_buf_3_mux0000_32_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_36_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_28_Q,
      I4 => inst_shifter_buf_2_32_Q,
      O => inst_shifter_buf_3_32_Q
    );
  inst_shifter_buf_3_mux0000_24_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_20_Q,
      I4 => inst_shifter_buf_2_24_Q,
      O => inst_shifter_buf_3_24_Q
    );
  inst_shifter_buf_3_mux0000_17_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_21_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_13_Q,
      I4 => inst_shifter_buf_2_17_Q,
      O => inst_shifter_buf_3_17_Q
    );
  inst_shifter_buf_3_mux0000_16_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_12_Q,
      I4 => inst_shifter_buf_2_16_Q,
      O => inst_shifter_buf_3_16_Q
    );
  inst_shifter_buf_2_mux0000_60_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_62_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_58_Q,
      I4 => inst_shifter_buf_1_60_Q,
      O => inst_shifter_buf_2_60_Q
    );
  inst_shifter_buf_2_mux0000_5_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_7_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_3_Q,
      I4 => inst_shifter_buf_1_5_Q,
      O => inst_shifter_buf_2_5_Q
    );
  inst_shifter_buf_2_mux0000_56_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_58_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_54_Q,
      I4 => inst_shifter_buf_1_56_Q,
      O => inst_shifter_buf_2_56_Q
    );
  inst_shifter_buf_2_mux0000_52_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_54_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_50_Q,
      I4 => inst_shifter_buf_1_52_Q,
      O => inst_shifter_buf_2_52_Q
    );
  inst_shifter_buf_2_mux0000_48_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_50_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_46_Q,
      I4 => inst_shifter_buf_1_48_Q,
      O => inst_shifter_buf_2_48_Q
    );
  inst_shifter_buf_2_mux0000_44_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_46_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_42_Q,
      I4 => inst_shifter_buf_1_44_Q,
      O => inst_shifter_buf_2_44_Q
    );
  inst_shifter_buf_2_mux0000_40_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_42_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_38_Q,
      I4 => inst_shifter_buf_1_40_Q,
      O => inst_shifter_buf_2_40_Q
    );
  inst_shifter_buf_2_mux0000_36_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_38_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_34_Q,
      I4 => inst_shifter_buf_1_36_Q,
      O => inst_shifter_buf_2_36_Q
    );
  inst_shifter_buf_2_mux0000_32_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_34_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_30_Q,
      I4 => inst_shifter_buf_1_32_Q,
      O => inst_shifter_buf_2_32_Q
    );
  inst_shifter_buf_2_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_30_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_26_Q,
      I4 => inst_shifter_buf_1_28_Q,
      O => inst_shifter_buf_2_28_Q
    );
  inst_shifter_buf_2_mux0000_24_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_26_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_22_Q,
      I4 => inst_shifter_buf_1_24_Q,
      O => inst_shifter_buf_2_24_Q
    );
  inst_shifter_buf_2_mux0000_21_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_23_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_19_Q,
      I4 => inst_shifter_buf_1_21_Q,
      O => inst_shifter_buf_2_21_Q
    );
  inst_shifter_buf_2_mux0000_20_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_22_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_18_Q,
      I4 => inst_shifter_buf_1_20_Q,
      O => inst_shifter_buf_2_20_Q
    );
  inst_shifter_buf_2_mux0000_17_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_19_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_15_Q,
      I4 => inst_shifter_buf_1_17_Q,
      O => inst_shifter_buf_2_17_Q
    );
  inst_shifter_buf_2_mux0000_13_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_15_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_11_Q,
      I4 => inst_shifter_buf_1_13_Q,
      O => inst_shifter_buf_2_13_Q
    );
  inst_shifter_buf_1_mux0000_7_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(8),
      I2 => shift_dir,
      I3 => op2(6),
      I4 => op2(7),
      O => inst_shifter_buf_1_7_Q
    );
  inst_shifter_buf_1_mux0000_62_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(63),
      I2 => shift_dir,
      I3 => op2(61),
      I4 => op2(62),
      O => inst_shifter_buf_1_62_Q
    );
  inst_shifter_buf_1_mux0000_60_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(61),
      I2 => shift_dir,
      I3 => op2(59),
      I4 => op2(60),
      O => inst_shifter_buf_1_60_Q
    );
  inst_shifter_buf_1_mux0000_5_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(6),
      I2 => shift_dir,
      I3 => op2(4),
      I4 => op2(5),
      O => inst_shifter_buf_1_5_Q
    );
  inst_shifter_buf_1_mux0000_58_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(59),
      I2 => shift_dir,
      I3 => op2(57),
      I4 => op2(58),
      O => inst_shifter_buf_1_58_Q
    );
  inst_shifter_buf_1_mux0000_56_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(57),
      I2 => shift_dir,
      I3 => op2(55),
      I4 => op2(56),
      O => inst_shifter_buf_1_56_Q
    );
  inst_shifter_buf_1_mux0000_54_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(55),
      I2 => shift_dir,
      I3 => op2(53),
      I4 => op2(54),
      O => inst_shifter_buf_1_54_Q
    );
  inst_shifter_buf_1_mux0000_52_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(53),
      I2 => shift_dir,
      I3 => op2(51),
      I4 => op2(52),
      O => inst_shifter_buf_1_52_Q
    );
  inst_shifter_buf_1_mux0000_50_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(51),
      I2 => shift_dir,
      I3 => op2(49),
      I4 => op2(50),
      O => inst_shifter_buf_1_50_Q
    );
  inst_shifter_buf_1_mux0000_48_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(49),
      I2 => shift_dir,
      I3 => op2(47),
      I4 => op2(48),
      O => inst_shifter_buf_1_48_Q
    );
  inst_shifter_buf_1_mux0000_46_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(47),
      I2 => shift_dir,
      I3 => op2(45),
      I4 => op2(46),
      O => inst_shifter_buf_1_46_Q
    );
  inst_shifter_buf_1_mux0000_44_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(45),
      I2 => shift_dir,
      I3 => op2(43),
      I4 => op2(44),
      O => inst_shifter_buf_1_44_Q
    );
  inst_shifter_buf_1_mux0000_42_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(43),
      I2 => shift_dir,
      I3 => op2(41),
      I4 => op2(42),
      O => inst_shifter_buf_1_42_Q
    );
  inst_shifter_buf_1_mux0000_40_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(41),
      I2 => shift_dir,
      I3 => op2(39),
      I4 => op2(40),
      O => inst_shifter_buf_1_40_Q
    );
  inst_shifter_buf_1_mux0000_3_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(4),
      I2 => shift_dir,
      I3 => op2(2),
      I4 => op2(3),
      O => inst_shifter_buf_1_3_Q
    );
  inst_shifter_buf_1_mux0000_38_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(39),
      I2 => shift_dir,
      I3 => op2(37),
      I4 => op2(38),
      O => inst_shifter_buf_1_38_Q
    );
  inst_shifter_buf_1_mux0000_36_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(37),
      I2 => shift_dir,
      I3 => op2(35),
      I4 => op2(36),
      O => inst_shifter_buf_1_36_Q
    );
  inst_shifter_buf_1_mux0000_34_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(35),
      I2 => shift_dir,
      I3 => op2(33),
      I4 => op2(34),
      O => inst_shifter_buf_1_34_Q
    );
  inst_shifter_buf_1_mux0000_32_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(33),
      I2 => shift_dir,
      I3 => op2(31),
      I4 => op2(32),
      O => inst_shifter_buf_1_32_Q
    );
  inst_shifter_buf_1_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(31),
      I2 => shift_dir,
      I3 => op2(29),
      I4 => op2(30),
      O => inst_shifter_buf_1_30_Q
    );
  inst_shifter_buf_1_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(29),
      I2 => shift_dir,
      I3 => op2(27),
      I4 => op2(28),
      O => inst_shifter_buf_1_28_Q
    );
  inst_shifter_buf_1_mux0000_26_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(27),
      I2 => shift_dir,
      I3 => op2(25),
      I4 => op2(26),
      O => inst_shifter_buf_1_26_Q
    );
  inst_shifter_buf_1_mux0000_24_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(25),
      I2 => shift_dir,
      I3 => op2(23),
      I4 => op2(24),
      O => inst_shifter_buf_1_24_Q
    );
  inst_shifter_buf_1_mux0000_23_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(24),
      I2 => shift_dir,
      I3 => op2(22),
      I4 => op2(23),
      O => inst_shifter_buf_1_23_Q
    );
  inst_shifter_buf_1_mux0000_22_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(23),
      I2 => shift_dir,
      I3 => op2(21),
      I4 => op2(22),
      O => inst_shifter_buf_1_22_Q
    );
  inst_shifter_buf_1_mux0000_21_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(22),
      I2 => shift_dir,
      I3 => op2(20),
      I4 => op2(21),
      O => inst_shifter_buf_1_21_Q
    );
  inst_shifter_buf_1_mux0000_20_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(21),
      I2 => shift_dir,
      I3 => op2(19),
      I4 => op2(20),
      O => inst_shifter_buf_1_20_Q
    );
  inst_shifter_buf_1_mux0000_19_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(20),
      I2 => shift_dir,
      I3 => op2(18),
      I4 => op2(19),
      O => inst_shifter_buf_1_19_Q
    );
  inst_shifter_buf_1_mux0000_17_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(18),
      I2 => shift_dir,
      I3 => op2(16),
      I4 => op2(17),
      O => inst_shifter_buf_1_17_Q
    );
  inst_shifter_buf_1_mux0000_15_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(16),
      I2 => shift_dir,
      I3 => op2(14),
      I4 => op2(15),
      O => inst_shifter_buf_1_15_Q
    );
  inst_shifter_buf_1_mux0000_13_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(14),
      I2 => shift_dir,
      I3 => op2(12),
      I4 => op2(13),
      O => inst_shifter_buf_1_13_Q
    );
  inst_shifter_buf_1_mux0000_11_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(12),
      I2 => shift_dir,
      I3 => op2(10),
      I4 => op2(11),
      O => inst_shifter_buf_1_11_Q
    );
  res_80_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(80),
      I1 => res_cmp_eq0004,
      I2 => op1(80),
      I3 => op2(16),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_80_16_1656
    );
  res_80_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(80),
      I1 => res_cmp_eq0004,
      I2 => op2(80),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_80_51_1657
    );
  res_80_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_48_Q,
      I4 => inst_shifter_buf_5_80_Q,
      I5 => inst_shifter_buf_5_112_Q,
      O => res_80_97_1658
    );
  res_81_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(81),
      I1 => res_cmp_eq0004,
      I2 => op1(81),
      I3 => op2(17),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_81_16_1660
    );
  res_81_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(81),
      I1 => res_cmp_eq0004,
      I2 => op2(81),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_81_51_1661
    );
  res_81_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_49_Q,
      I4 => inst_shifter_buf_5_81_Q,
      I5 => inst_shifter_buf_5_113_Q,
      O => res_81_97_1662
    );
  res_82_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(82),
      I1 => res_cmp_eq0004,
      I2 => op1(82),
      I3 => op2(18),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_82_16_1664
    );
  res_82_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(82),
      I1 => res_cmp_eq0004,
      I2 => op2(82),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_82_51_1665
    );
  res_82_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_50_Q,
      I4 => inst_shifter_buf_5_82_Q,
      I5 => inst_shifter_buf_5_114_Q,
      O => res_82_97_1666
    );
  res_83_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(83),
      I1 => res_cmp_eq0004,
      I2 => op1(83),
      I3 => op2(19),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_83_16_1668
    );
  res_83_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(83),
      I1 => res_cmp_eq0004,
      I2 => op2(83),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_83_51_1669
    );
  res_83_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_51_Q,
      I4 => inst_shifter_buf_5_83_Q,
      I5 => inst_shifter_buf_5_115_Q,
      O => res_83_97_1670
    );
  inst_shifter_buf_2_mux0000_125_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_127_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_123_Q,
      I4 => inst_shifter_buf_1_125_Q,
      O => inst_shifter_buf_2_125_Q
    );
  inst_shifter_buf_1_mux0000_127_1 : LUT5
    generic map(
      INIT => X"CE4EC444"
    )
    port map (
      I0 => op1(0),
      I1 => op2(127),
      I2 => shift_dir,
      I3 => shift_type,
      I4 => op2(126),
      O => inst_shifter_buf_1_127_Q
    );
  inst_shifter_buf_2_mux0000_127_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_125_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_1_127_Q,
      O => inst_shifter_buf_2_127_Q
    );
  res_84_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(84),
      I1 => res_cmp_eq0004,
      I2 => op1(84),
      I3 => op2(20),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_84_16_1672
    );
  res_84_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(84),
      I1 => res_cmp_eq0004,
      I2 => op2(84),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_84_51_1673
    );
  res_84_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_52_Q,
      I4 => inst_shifter_buf_5_84_Q,
      I5 => inst_shifter_buf_5_116_Q,
      O => res_84_97_1674
    );
  res_85_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(85),
      I1 => res_cmp_eq0004,
      I2 => op1(85),
      I3 => op2(21),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_85_16_1676
    );
  res_85_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(85),
      I1 => res_cmp_eq0004,
      I2 => op2(85),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_85_51_1677
    );
  res_85_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_53_Q,
      I4 => inst_shifter_buf_5_85_Q,
      I5 => inst_shifter_buf_5_117_Q,
      O => res_85_97_1678
    );
  res_86_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(86),
      I1 => res_cmp_eq0004,
      I2 => op1(86),
      I3 => op2(22),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_86_16_1680
    );
  res_86_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(86),
      I1 => res_cmp_eq0004,
      I2 => op2(86),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_86_51_1681
    );
  res_86_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_54_Q,
      I4 => inst_shifter_buf_5_86_Q,
      I5 => inst_shifter_buf_5_118_Q,
      O => res_86_97_1682
    );
  res_87_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(87),
      I1 => res_cmp_eq0004,
      I2 => op1(87),
      I3 => op2(23),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_87_16_1684
    );
  res_87_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(87),
      I1 => res_cmp_eq0004,
      I2 => op2(87),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_87_51_1685
    );
  res_87_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_55_Q,
      I4 => inst_shifter_buf_5_87_Q,
      I5 => inst_shifter_buf_5_119_Q,
      O => res_87_97_1686
    );
  res_88_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(88),
      I1 => res_cmp_eq0004,
      I2 => op1(88),
      I3 => op2(24),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_88_16_1688
    );
  res_88_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(88),
      I1 => res_cmp_eq0004,
      I2 => op2(88),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_88_51_1689
    );
  res_88_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_56_Q,
      I4 => inst_shifter_buf_5_88_Q,
      I5 => inst_shifter_buf_5_120_Q,
      O => res_88_97_1690
    );
  res_89_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(89),
      I1 => res_cmp_eq0004,
      I2 => op1(89),
      I3 => op2(25),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_89_16_1692
    );
  res_89_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(89),
      I1 => res_cmp_eq0004,
      I2 => op2(89),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_89_51_1693
    );
  res_89_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_57_Q,
      I4 => inst_shifter_buf_5_89_Q,
      I5 => inst_shifter_buf_5_121_Q,
      O => res_89_97_1694
    );
  res_90_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(90),
      I1 => res_cmp_eq0004,
      I2 => op1(90),
      I3 => op2(26),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_90_16_1699
    );
  res_90_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(90),
      I1 => res_cmp_eq0004,
      I2 => op2(90),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_90_51_1700
    );
  res_90_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_58_Q,
      I4 => inst_shifter_buf_5_90_Q,
      I5 => inst_shifter_buf_5_122_Q,
      O => res_90_97_1701
    );
  inst_shifter_buf_5_mux0000_36_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_52_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_20_Q,
      I4 => inst_shifter_buf_4_36_Q,
      O => inst_shifter_buf_5_36_Q
    );
  inst_shifter_buf_5_mux0000_32_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_48_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_16_Q,
      I4 => inst_shifter_buf_4_32_Q,
      O => inst_shifter_buf_5_32_Q
    );
  inst_shifter_buf_5_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_44_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_12_Q,
      I4 => inst_shifter_buf_4_28_Q,
      O => inst_shifter_buf_5_28_Q
    );
  inst_shifter_buf_5_mux0000_25_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_41_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_9_Q,
      I4 => inst_shifter_buf_4_25_Q,
      O => inst_shifter_buf_5_25_Q
    );
  inst_shifter_buf_4_mux0000_20_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_28_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_12_Q,
      I4 => inst_shifter_buf_3_20_Q,
      O => inst_shifter_buf_4_20_Q
    );
  inst_shifter_buf_4_mux0000_16_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_24_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_8_Q,
      I4 => inst_shifter_buf_3_16_Q,
      O => inst_shifter_buf_4_16_Q
    );
  inst_shifter_buf_4_mux0000_12_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_20_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_4_Q,
      I4 => inst_shifter_buf_3_12_Q,
      O => inst_shifter_buf_4_12_Q
    );
  inst_shifter_buf_2_mux0000_16_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_18_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_14_Q,
      I4 => inst_shifter_buf_1_16_Q,
      O => inst_shifter_buf_2_16_Q
    );
  inst_shifter_buf_1_mux0000_8_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(9),
      I2 => shift_dir,
      I3 => op2(7),
      I4 => op2(8),
      O => inst_shifter_buf_1_8_Q
    );
  inst_shifter_buf_1_mux0000_4_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(5),
      I2 => shift_dir,
      I3 => op2(3),
      I4 => op2(4),
      O => inst_shifter_buf_1_4_Q
    );
  inst_shifter_buf_1_mux0000_18_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(19),
      I2 => shift_dir,
      I3 => op2(17),
      I4 => op2(18),
      O => inst_shifter_buf_1_18_Q
    );
  inst_shifter_buf_1_mux0000_16_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(17),
      I2 => shift_dir,
      I3 => op2(15),
      I4 => op2(16),
      O => inst_shifter_buf_1_16_Q
    );
  res_91_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(91),
      I1 => res_cmp_eq0004,
      I2 => op1(91),
      I3 => op2(27),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_91_16_1703
    );
  res_91_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(91),
      I1 => res_cmp_eq0004,
      I2 => op2(91),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_91_51_1704
    );
  res_91_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_59_Q,
      I4 => inst_shifter_buf_5_91_Q,
      I5 => inst_shifter_buf_5_123_Q,
      O => res_91_97_1705
    );
  res_92_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(92),
      I1 => res_cmp_eq0004,
      I2 => op1(92),
      I3 => op2(28),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_92_16_1707
    );
  res_92_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(92),
      I1 => res_cmp_eq0004,
      I2 => op2(92),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_92_51_1708
    );
  res_92_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_60_Q,
      I4 => inst_shifter_buf_5_92_Q,
      I5 => inst_shifter_buf_5_124_Q,
      O => res_92_97_1709
    );
  res_93_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(93),
      I1 => res_cmp_eq0004,
      I2 => op1(93),
      I3 => op2(29),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_93_16_1711
    );
  res_93_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(93),
      I1 => res_cmp_eq0004,
      I2 => op2(93),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_93_51_1712
    );
  res_93_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_61_Q,
      I4 => inst_shifter_buf_5_93_Q,
      I5 => inst_shifter_buf_5_125_Q,
      O => res_93_97_1713
    );
  res_94_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(94),
      I1 => res_cmp_eq0004,
      I2 => op1(94),
      I3 => op2(30),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_94_16_1715
    );
  res_94_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(94),
      I1 => res_cmp_eq0004,
      I2 => op2(94),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_94_51_1716
    );
  res_94_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_62_Q,
      I4 => inst_shifter_buf_5_94_Q,
      I5 => inst_shifter_buf_5_126_Q,
      O => res_94_97_1717
    );
  res_95_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(95),
      I1 => res_cmp_eq0004,
      I2 => op1(95),
      I3 => op2(31),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_95_16_1719
    );
  res_95_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(95),
      I1 => res_cmp_eq0004,
      I2 => op2(95),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_95_51_1720
    );
  res_95_97 : LUT6
    generic map(
      INIT => X"AAA288802A220800"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_63_Q,
      I4 => inst_shifter_buf_5_95_Q,
      I5 => inst_shifter_buf_5_127_Q,
      O => res_95_97_1721
    );
  res_96_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(96),
      I1 => res_cmp_eq0004,
      I2 => op1(96),
      I3 => op2(32),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_96_16_1723
    );
  res_96_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(96),
      I1 => res_cmp_eq0004,
      I2 => op2(96),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_96_51_1724
    );
  res_97_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(97),
      I1 => res_cmp_eq0004,
      I2 => op1(97),
      I3 => op2(33),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_97_16_1727
    );
  res_97_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(97),
      I1 => res_cmp_eq0004,
      I2 => op2(97),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_97_51_1728
    );
  res_98_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(98),
      I1 => res_cmp_eq0004,
      I2 => op1(98),
      I3 => op2(34),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_98_16_1731
    );
  res_98_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(98),
      I1 => res_cmp_eq0004,
      I2 => op2(98),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_98_51_1732
    );
  res_99_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(99),
      I1 => res_cmp_eq0004,
      I2 => op1(99),
      I3 => op2(35),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_99_16_1735
    );
  res_99_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(99),
      I1 => res_cmp_eq0004,
      I2 => op2(99),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_99_51_1736
    );
  res_100_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(100),
      I1 => res_cmp_eq0004,
      I2 => op1(100),
      I3 => op2(36),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_100_16_1243
    );
  res_100_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(100),
      I1 => res_cmp_eq0004,
      I2 => op2(100),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_100_51_1244
    );
  inst_shifter_buf_2_mux0000_12_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_14_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_10_Q,
      I4 => inst_shifter_buf_1_12_Q,
      O => inst_shifter_buf_2_12_Q
    );
  inst_shifter_buf_1_mux0000_14_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(15),
      I2 => shift_dir,
      I3 => op2(13),
      I4 => op2(14),
      O => inst_shifter_buf_1_14_Q
    );
  inst_shifter_buf_1_mux0000_12_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(13),
      I2 => shift_dir,
      I3 => op2(11),
      I4 => op2(12),
      O => inst_shifter_buf_1_12_Q
    );
  inst_shifter_buf_1_mux0000_10_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(11),
      I2 => shift_dir,
      I3 => op2(9),
      I4 => op2(10),
      O => inst_shifter_buf_1_10_Q
    );
  res_101_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(101),
      I1 => res_cmp_eq0004,
      I2 => op1(101),
      I3 => op2(37),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_101_16_1247
    );
  res_101_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(101),
      I1 => res_cmp_eq0004,
      I2 => op2(101),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_101_51_1248
    );
  res_102_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(102),
      I1 => res_cmp_eq0004,
      I2 => op1(102),
      I3 => op2(38),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_102_16_1251
    );
  res_102_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(102),
      I1 => res_cmp_eq0004,
      I2 => op2(102),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_102_51_1252
    );
  res_103_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(103),
      I1 => res_cmp_eq0004,
      I2 => op1(103),
      I3 => op2(39),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_103_16_1255
    );
  res_103_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(103),
      I1 => res_cmp_eq0004,
      I2 => op2(103),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_103_51_1256
    );
  res_104_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(104),
      I1 => res_cmp_eq0004,
      I2 => op1(104),
      I3 => op2(40),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_104_16_1259
    );
  res_104_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(104),
      I1 => res_cmp_eq0004,
      I2 => op2(104),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_104_51_1260
    );
  res_105_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(105),
      I1 => res_cmp_eq0004,
      I2 => op1(105),
      I3 => op2(41),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_105_16_1263
    );
  res_105_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(105),
      I1 => res_cmp_eq0004,
      I2 => op2(105),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_105_51_1264
    );
  res_106_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(106),
      I1 => res_cmp_eq0004,
      I2 => op1(106),
      I3 => op2(42),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_106_16_1267
    );
  res_106_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(106),
      I1 => res_cmp_eq0004,
      I2 => op2(106),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_106_51_1268
    );
  res_107_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(107),
      I1 => res_cmp_eq0004,
      I2 => op1(107),
      I3 => op2(43),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_107_16_1271
    );
  res_107_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(107),
      I1 => res_cmp_eq0004,
      I2 => op2(107),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_107_51_1272
    );
  res_108_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(108),
      I1 => res_cmp_eq0004,
      I2 => op1(108),
      I3 => op2(44),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_108_16_1275
    );
  res_108_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(108),
      I1 => res_cmp_eq0004,
      I2 => op2(108),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_108_51_1276
    );
  res_109_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(109),
      I1 => res_cmp_eq0004,
      I2 => op1(109),
      I3 => op2(45),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_109_16_1279
    );
  res_109_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(109),
      I1 => res_cmp_eq0004,
      I2 => op2(109),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_109_51_1280
    );
  res_110_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(110),
      I1 => res_cmp_eq0004,
      I2 => op1(110),
      I3 => op2(46),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_110_16_1286
    );
  res_110_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(110),
      I1 => res_cmp_eq0004,
      I2 => op2(110),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_110_51_1287
    );
  res_111_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(111),
      I1 => res_cmp_eq0004,
      I2 => op1(111),
      I3 => op2(47),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_111_16_1290
    );
  res_111_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(111),
      I1 => res_cmp_eq0004,
      I2 => op2(111),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_111_51_1291
    );
  shift_dir1 : LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(0),
      I2 => op_ctrl(1),
      I3 => op_ctrl(4),
      I4 => op_ctrl(3),
      O => shift_dir
    );
  inst_shifter_buf_1_mux0000_6_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(7),
      I2 => shift_dir,
      I3 => op2(5),
      I4 => op2(6),
      O => inst_shifter_buf_1_6_Q
    );
  inst_shifter_buf_1_mux0000_2_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(0),
      I1 => op2(3),
      I2 => shift_dir,
      I3 => op2(1),
      I4 => op2(2),
      O => inst_shifter_buf_1_2_Q
    );
  res_112_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(112),
      I1 => res_cmp_eq0004,
      I2 => op1(112),
      I3 => op2(48),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_112_16_1294
    );
  res_112_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(112),
      I1 => res_cmp_eq0004,
      I2 => op2(112),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_112_51_1295
    );
  res_113_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(113),
      I1 => res_cmp_eq0004,
      I2 => op1(113),
      I3 => op2(49),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_113_16_1298
    );
  res_113_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(113),
      I1 => res_cmp_eq0004,
      I2 => op2(113),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_113_51_1299
    );
  res_114_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(114),
      I1 => res_cmp_eq0004,
      I2 => op1(114),
      I3 => op2(50),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_114_16_1302
    );
  res_114_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(114),
      I1 => res_cmp_eq0004,
      I2 => op2(114),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_114_51_1303
    );
  res_115_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(115),
      I1 => res_cmp_eq0004,
      I2 => op1(115),
      I3 => op2(51),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_115_16_1306
    );
  res_115_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(115),
      I1 => res_cmp_eq0004,
      I2 => op2(115),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_115_51_1307
    );
  res_116_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(116),
      I1 => res_cmp_eq0004,
      I2 => op1(116),
      I3 => op2(52),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_116_16_1310
    );
  res_116_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(116),
      I1 => res_cmp_eq0004,
      I2 => op2(116),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_116_51_1311
    );
  res_117_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(117),
      I1 => res_cmp_eq0004,
      I2 => op1(117),
      I3 => op2(53),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_117_16_1314
    );
  res_117_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(117),
      I1 => res_cmp_eq0004,
      I2 => op2(117),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_117_51_1315
    );
  res_118_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(118),
      I1 => res_cmp_eq0004,
      I2 => op1(118),
      I3 => op2(54),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_118_16_1318
    );
  res_118_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(118),
      I1 => res_cmp_eq0004,
      I2 => op2(118),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_118_51_1319
    );
  res_119_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(119),
      I1 => res_cmp_eq0004,
      I2 => op1(119),
      I3 => op2(55),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_119_16_1322
    );
  res_119_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(119),
      I1 => res_cmp_eq0004,
      I2 => op2(119),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_119_51_1323
    );
  res_120_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(120),
      I1 => res_cmp_eq0004,
      I2 => op1(120),
      I3 => op2(56),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_120_16_1329
    );
  res_120_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(120),
      I1 => res_cmp_eq0004,
      I2 => op2(120),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_120_51_1330
    );
  res_121_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(121),
      I1 => res_cmp_eq0004,
      I2 => op1(121),
      I3 => op2(57),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_121_16_1333
    );
  res_121_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(121),
      I1 => res_cmp_eq0004,
      I2 => op2(121),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_121_51_1334
    );
  res_122_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(122),
      I1 => res_cmp_eq0004,
      I2 => op1(122),
      I3 => op2(58),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_122_16_1337
    );
  res_122_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(122),
      I1 => res_cmp_eq0004,
      I2 => op2(122),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_122_51_1338
    );
  res_123_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(123),
      I1 => res_cmp_eq0004,
      I2 => op1(123),
      I3 => op2(59),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_123_16_1341
    );
  res_123_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(123),
      I1 => res_cmp_eq0004,
      I2 => op2(123),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_123_51_1342
    );
  res_124_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(124),
      I1 => res_cmp_eq0004,
      I2 => op1(124),
      I3 => op2(60),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_124_16_1345
    );
  res_124_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(124),
      I1 => res_cmp_eq0004,
      I2 => op2(124),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_124_51_1346
    );
  res_125_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(125),
      I1 => res_cmp_eq0004,
      I2 => op1(125),
      I3 => op2(61),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_125_16_1349
    );
  res_125_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(125),
      I1 => res_cmp_eq0004,
      I2 => op2(125),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_125_51_1350
    );
  res_126_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(126),
      I1 => res_cmp_eq0004,
      I2 => op1(126),
      I3 => op2(62),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_126_16_1353
    );
  res_126_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(126),
      I1 => res_cmp_eq0004,
      I2 => op2(126),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_126_51_1354
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
      O => N299
    );
  overflow_or0000 : LUT6
    generic map(
      INIT => X"000004A200005402"
    )
    port map (
      I0 => res_add(127),
      I1 => efct_op2(127),
      I2 => op_ctrl(1),
      I3 => op1(127),
      I4 => N299,
      I5 => op2(127),
      O => overflow
    );
  res_127_16 : LUT6
    generic map(
      INIT => X"FFAAAAAAFF080808"
    )
    port map (
      I0 => op2(127),
      I1 => res_cmp_eq0004,
      I2 => op1(127),
      I3 => op2(63),
      I4 => res_cmp_eq0006,
      I5 => N278,
      O => res_127_16_1357
    );
  res_127_51 : LUT6
    generic map(
      INIT => X"AFAFAAAAAD0DA808"
    )
    port map (
      I0 => op1(127),
      I1 => res_cmp_eq0004,
      I2 => op2(127),
      I3 => res_cmp_eq0001,
      I4 => res_cmp_eq0003,
      I5 => N144,
      O => res_127_51_1358
    );
  res_0_401 : LUT5
    generic map(
      INIT => X"FFFFEEE2"
    )
    port map (
      I0 => res_0_155_1238,
      I1 => op_ctrl(2),
      I2 => res_0_217_1239,
      I3 => res_0_357_1240,
      I4 => res_0_8_1241,
      O => res(0)
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
  res_64_61 : LUT6
    generic map(
      INIT => X"EFEFEEEEAFABAEAA"
    )
    port map (
      I0 => N303,
      I1 => op2(64),
      I2 => op1(64),
      I3 => res_cmp_eq0004,
      I4 => res_cmp_eq0003,
      I5 => N278,
      O => res_64_61_1576
    );
  res_0_217 : LUT6
    generic map(
      INIT => X"1010501000004000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(3),
      I2 => op_ctrl(4),
      I3 => op2(0),
      I4 => op_ctrl(0),
      I5 => shifter_out(0),
      O => res_0_217_1239
    );
  res_39_107 : LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => res_39_45_1452,
      I1 => res_39_38_1451,
      I2 => res_or0001,
      I3 => res_add(39),
      I4 => N305,
      I5 => N01,
      O => res(39)
    );
  res_38_107 : LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => res_38_45_1449,
      I1 => res_38_38_1448,
      I2 => res_or0001,
      I3 => res_add(38),
      I4 => N307,
      I5 => N01,
      O => res(38)
    );
  res_49_107_SW0 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_81_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_17_Q,
      I4 => inst_shifter_buf_5_49_Q,
      O => N309
    );
  res_49_107 : LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => res_49_45_1499,
      I1 => res_49_38_1498,
      I2 => res_or0001,
      I3 => res_add(49),
      I4 => N309,
      I5 => N01,
      O => res(49)
    );
  res_48_107_SW0 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_80_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_5_16_Q,
      I4 => inst_shifter_buf_5_48_Q,
      O => N311
    );
  res_48_107 : LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => res_48_45_1496,
      I1 => res_48_38_1495,
      I2 => res_or0001,
      I3 => res_add(48),
      I4 => N311,
      I5 => N01,
      O => res(48)
    );
  Madd_res_add_Madd_lut_128_Q : LUT5
    generic map(
      INIT => X"5DF72A80"
    )
    port map (
      I0 => signe,
      I1 => op2(127),
      I2 => N8,
      I3 => op1(127),
      I4 => comp_op2,
      O => Madd_res_add_Madd_lut(128)
    );
  res_65_61 : LUT6
    generic map(
      INIT => X"EFEEEFEEEFEEABAA"
    )
    port map (
      I0 => res_65_21,
      I1 => op2(65),
      I2 => op1(65),
      I3 => res_cmp_eq0003,
      I4 => N278,
      I5 => res_65_29_1585,
      O => res_65_61_1586
    );
  res_66_61 : LUT6
    generic map(
      INIT => X"EFEEEFEEEFEEABAA"
    )
    port map (
      I0 => res_66_21,
      I1 => op2(66),
      I2 => op1(66),
      I3 => res_cmp_eq0003,
      I4 => N278,
      I5 => res_66_29_1592,
      O => res_66_61_1593
    );
  res_67_61 : LUT6
    generic map(
      INIT => X"EFEEEFEEEFEEABAA"
    )
    port map (
      I0 => res_67_21,
      I1 => op2(67),
      I2 => op1(67),
      I3 => res_cmp_eq0003,
      I4 => N278,
      I5 => res_67_29_1599,
      O => res_67_61_1600
    );
  Madd_res_add_Madd_lut_0_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(0),
      I1 => op2(0),
      I2 => comp_op2,
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
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
      I3 => N8,
      O => Madd_res_add_Madd_lut(62)
    );
  Madd_res_add_Madd_lut_63_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(63),
      I1 => op2(63),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(63)
    );
  Madd_res_add_Madd_lut_64_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(64),
      I1 => op2(64),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(64)
    );
  Madd_res_add_Madd_lut_65_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(65),
      I1 => op2(65),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(65)
    );
  Madd_res_add_Madd_lut_66_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(66),
      I1 => op2(66),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(66)
    );
  Madd_res_add_Madd_lut_67_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(67),
      I1 => op2(67),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(67)
    );
  Madd_res_add_Madd_lut_68_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(68),
      I1 => op2(68),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(68)
    );
  Madd_res_add_Madd_lut_69_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(69),
      I1 => op2(69),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(69)
    );
  Madd_res_add_Madd_lut_70_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(70),
      I1 => op2(70),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(70)
    );
  Madd_res_add_Madd_lut_71_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(71),
      I1 => op2(71),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(71)
    );
  Madd_res_add_Madd_lut_72_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(72),
      I1 => op2(72),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(72)
    );
  Madd_res_add_Madd_lut_73_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(73),
      I1 => op2(73),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(73)
    );
  Madd_res_add_Madd_lut_74_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(74),
      I1 => op2(74),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(74)
    );
  Madd_res_add_Madd_lut_75_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(75),
      I1 => op2(75),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(75)
    );
  Madd_res_add_Madd_lut_76_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(76),
      I1 => op2(76),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(76)
    );
  Madd_res_add_Madd_lut_77_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(77),
      I1 => op2(77),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(77)
    );
  Madd_res_add_Madd_lut_78_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(78),
      I1 => op2(78),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(78)
    );
  Madd_res_add_Madd_lut_79_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(79),
      I1 => op2(79),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(79)
    );
  Madd_res_add_Madd_lut_80_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(80),
      I1 => op2(80),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(80)
    );
  Madd_res_add_Madd_lut_81_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(81),
      I1 => op2(81),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(81)
    );
  Madd_res_add_Madd_lut_82_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(82),
      I1 => op2(82),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(82)
    );
  Madd_res_add_Madd_lut_83_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(83),
      I1 => op2(83),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(83)
    );
  Madd_res_add_Madd_lut_84_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(84),
      I1 => op2(84),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(84)
    );
  Madd_res_add_Madd_lut_85_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(85),
      I1 => op2(85),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(85)
    );
  Madd_res_add_Madd_lut_86_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(86),
      I1 => op2(86),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(86)
    );
  Madd_res_add_Madd_lut_87_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(87),
      I1 => op2(87),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(87)
    );
  Madd_res_add_Madd_lut_88_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(88),
      I1 => op2(88),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(88)
    );
  Madd_res_add_Madd_lut_89_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(89),
      I1 => op2(89),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(89)
    );
  Madd_res_add_Madd_lut_90_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(90),
      I1 => op2(90),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(90)
    );
  Madd_res_add_Madd_lut_91_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(91),
      I1 => op2(91),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(91)
    );
  Madd_res_add_Madd_lut_92_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(92),
      I1 => op2(92),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(92)
    );
  Madd_res_add_Madd_lut_93_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(93),
      I1 => op2(93),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(93)
    );
  Madd_res_add_Madd_lut_94_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(94),
      I1 => op2(94),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(94)
    );
  Madd_res_add_Madd_lut_95_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(95),
      I1 => op2(95),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(95)
    );
  Madd_res_add_Madd_lut_96_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(96),
      I1 => op2(96),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(96)
    );
  Madd_res_add_Madd_lut_97_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(97),
      I1 => op2(97),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(97)
    );
  Madd_res_add_Madd_lut_98_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(98),
      I1 => op2(98),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(98)
    );
  Madd_res_add_Madd_lut_99_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(99),
      I1 => op2(99),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(99)
    );
  Madd_res_add_Madd_lut_100_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(100),
      I1 => op2(100),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(100)
    );
  Madd_res_add_Madd_lut_101_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(101),
      I1 => op2(101),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(101)
    );
  Madd_res_add_Madd_lut_102_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(102),
      I1 => op2(102),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(102)
    );
  Madd_res_add_Madd_lut_103_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(103),
      I1 => op2(103),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(103)
    );
  Madd_res_add_Madd_lut_104_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(104),
      I1 => op2(104),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(104)
    );
  Madd_res_add_Madd_lut_105_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(105),
      I1 => op2(105),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(105)
    );
  Madd_res_add_Madd_lut_106_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(106),
      I1 => op2(106),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(106)
    );
  Madd_res_add_Madd_lut_107_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(107),
      I1 => op2(107),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(107)
    );
  Madd_res_add_Madd_lut_108_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(108),
      I1 => op2(108),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(108)
    );
  Madd_res_add_Madd_lut_109_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(109),
      I1 => op2(109),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(109)
    );
  Madd_res_add_Madd_lut_110_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(110),
      I1 => op2(110),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(110)
    );
  Madd_res_add_Madd_lut_111_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(111),
      I1 => op2(111),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(111)
    );
  Madd_res_add_Madd_lut_112_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(112),
      I1 => op2(112),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(112)
    );
  Madd_res_add_Madd_lut_113_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(113),
      I1 => op2(113),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(113)
    );
  Madd_res_add_Madd_lut_114_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(114),
      I1 => op2(114),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(114)
    );
  Madd_res_add_Madd_lut_115_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(115),
      I1 => op2(115),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(115)
    );
  Madd_res_add_Madd_lut_116_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(116),
      I1 => op2(116),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(116)
    );
  Madd_res_add_Madd_lut_117_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(117),
      I1 => op2(117),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(117)
    );
  Madd_res_add_Madd_lut_118_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(118),
      I1 => op2(118),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(118)
    );
  Madd_res_add_Madd_lut_119_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(119),
      I1 => op2(119),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(119)
    );
  Madd_res_add_Madd_lut_120_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(120),
      I1 => op2(120),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(120)
    );
  Madd_res_add_Madd_lut_121_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(121),
      I1 => op2(121),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(121)
    );
  Madd_res_add_Madd_lut_122_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(122),
      I1 => op2(122),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(122)
    );
  Madd_res_add_Madd_lut_123_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(123),
      I1 => op2(123),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(123)
    );
  Madd_res_add_Madd_lut_124_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(124),
      I1 => op2(124),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(124)
    );
  Madd_res_add_Madd_lut_125_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(125),
      I1 => op2(125),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(125)
    );
  Madd_res_add_Madd_lut_126_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(126),
      I1 => op2(126),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(126)
    );
  res_5_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(5),
      I2 => op2(5),
      I3 => res_add(5),
      I4 => res_or0001,
      I5 => res_5_38_1553,
      O => res_5_62_1554
    );
  res_7_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(7),
      I2 => op2(7),
      I3 => res_add(7),
      I4 => res_or0001,
      I5 => res_7_38_1653,
      O => res_7_62_1654
    );
  res_6_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(6),
      I2 => op2(6),
      I3 => res_add(6),
      I4 => res_or0001,
      I5 => res_6_38_1610,
      O => res_6_62_1611
    );
  res_3_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(3),
      I2 => op2(3),
      I3 => res_add(3),
      I4 => res_or0001,
      I5 => res_3_38_1454,
      O => res_3_62_1455
    );
  res_2_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(2),
      I2 => op2(2),
      I3 => res_add(2),
      I4 => res_or0001,
      I5 => res_2_38_1416,
      O => res_2_62_1417
    );
  res_15_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(15),
      I2 => op2(15),
      I3 => res_add(15),
      I4 => res_or0001,
      I5 => res_15_38_1370,
      O => res_15_62_1371
    );
  res_14_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(14),
      I2 => op2(14),
      I3 => res_add(14),
      I4 => res_or0001,
      I5 => res_14_38_1367,
      O => res_14_62_1368
    );
  res_13_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(13),
      I2 => op2(13),
      I3 => res_add(13),
      I4 => res_or0001,
      I5 => res_13_38_1364,
      O => res_13_62_1365
    );
  res_11_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(11),
      I2 => op2(11),
      I3 => res_add(11),
      I4 => res_or0001,
      I5 => res_11_38_1326,
      O => res_11_62_1327
    );
  res_10_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(10),
      I2 => op2(10),
      I3 => res_add(10),
      I4 => res_or0001,
      I5 => res_10_38_1283,
      O => res_10_62_1284
    );
  res_18_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(18),
      I2 => op2(18),
      I3 => res_add(18),
      I4 => res_or0001,
      I5 => res_18_38_1379,
      O => res_18_62_1380
    );
  res_19_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(19),
      I2 => op2(19),
      I3 => res_add(19),
      I4 => res_or0001,
      I5 => res_19_38_1382,
      O => res_19_62_1383
    );
  res_21_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(21),
      I2 => op2(21),
      I3 => res_add(21),
      I4 => res_or0001,
      I5 => res_21_38_1391,
      O => res_21_62_1392
    );
  res_22_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(22),
      I2 => op2(22),
      I3 => res_add(22),
      I4 => res_or0001,
      I5 => res_22_38_1394,
      O => res_22_62_1395
    );
  res_23_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(23),
      I2 => op2(23),
      I3 => res_add(23),
      I4 => res_or0001,
      I5 => res_23_38_1397,
      O => res_23_62_1398
    );
  res_26_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(26),
      I2 => op2(26),
      I3 => res_add(26),
      I4 => res_or0001,
      I5 => res_26_38_1406,
      O => res_26_62_1407
    );
  res_8_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(8),
      I2 => op2(8),
      I3 => res_add(8),
      I4 => res_or0001,
      I5 => res_8_38_1696,
      O => res_8_62_1697
    );
  res_24_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(24),
      I2 => op2(24),
      I3 => res_add(24),
      I4 => res_or0001,
      I5 => res_24_38_1400,
      O => res_24_62_1401
    );
  res_1_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(1),
      I2 => op2(1),
      I3 => res_add(1),
      I4 => res_or0001,
      I5 => res_1_38_1385,
      O => res_1_62_1386
    );
  res_17_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(17),
      I2 => op2(17),
      I3 => res_add(17),
      I4 => res_or0001,
      I5 => res_17_38_1376,
      O => res_17_62_1377
    );
  res_16_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(16),
      I2 => op2(16),
      I3 => res_add(16),
      I4 => res_or0001,
      I5 => res_16_38_1373,
      O => res_16_62_1374
    );
  res_34_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(34),
      I2 => op2(34),
      I3 => res_add(34),
      I4 => res_or0001,
      I5 => res_34_38_1432,
      O => res_34_62_1433
    );
  res_35_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(35),
      I2 => op2(35),
      I3 => res_add(35),
      I4 => res_or0001,
      I5 => res_35_38_1436,
      O => res_35_62_1437
    );
  res_4_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(4),
      I2 => op2(4),
      I3 => res_add(4),
      I4 => res_or0001,
      I5 => res_4_38_1501,
      O => res_4_62_1502
    );
  res_28_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(28),
      I2 => op2(28),
      I3 => res_add(28),
      I4 => res_or0001,
      I5 => res_28_38_1411,
      O => res_28_62_1412
    );
  res_20_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(20),
      I2 => op2(20),
      I3 => res_add(20),
      I4 => res_or0001,
      I5 => res_20_38_1388,
      O => res_20_62_1389
    );
  res_12_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(12),
      I2 => op2(12),
      I3 => res_add(12),
      I4 => res_or0001,
      I5 => res_12_38_1361,
      O => res_12_62_1362
    );
  res_33_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(33),
      I2 => op2(33),
      I3 => res_add(33),
      I4 => res_or0001,
      I5 => res_33_38_1427,
      O => res_33_62_1428
    );
  res_32_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(32),
      I2 => op2(32),
      I3 => res_add(32),
      I4 => res_or0001,
      I5 => res_32_38_1423,
      O => res_32_62_1424
    );
  res_9_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(9),
      I2 => op2(9),
      I3 => res_add(9),
      I4 => res_or0001,
      I5 => res_9_38_1739,
      O => res_9_62_1740
    );
  res_25_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(25),
      I2 => op2(25),
      I3 => res_add(25),
      I4 => res_or0001,
      I5 => res_25_38_1403,
      O => res_25_62_1404
    );
  res_44_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(44),
      I2 => op2(44),
      I3 => res_add(44),
      I4 => res_or0001,
      I5 => res_44_38_1476,
      O => res_44_62_1477
    );
  res_36_62 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(36),
      I2 => op2(36),
      I3 => res_add(36),
      I4 => res_or0001,
      I5 => res_36_38_1439,
      O => res_36_62_1440
    );
  res_57_104 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_57_34_1540,
      I1 => res_57_44_1541,
      I2 => res_add(57),
      I3 => res_or0001,
      I4 => res_57_103_1539,
      O => res(57)
    );
  res_41_105 : LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => res_41_34_1462,
      I1 => res_41_44_1463,
      I2 => res_add(41),
      I3 => res_or0001,
      I4 => N01,
      I5 => res_41_94_1464,
      O => res(41)
    );
  res_69_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_69_97_1608,
      I1 => res_69_16_1606,
      I2 => res_add(69),
      I3 => res_or0001,
      I4 => res_69_51_1607,
      O => res(69)
    );
  res_68_115 : LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => res_68_16_1602,
      I1 => res_68_51_1603,
      I2 => N01,
      I3 => res_68_88_1604,
      I4 => res_add(68),
      I5 => res_or0001,
      O => res(68)
    );
  res_70_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_70_97_1615,
      I1 => res_70_16_1613,
      I2 => res_add(70),
      I3 => res_or0001,
      I4 => res_70_51_1614,
      O => res(70)
    );
  res_71_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_71_97_1619,
      I1 => res_71_16_1617,
      I2 => res_add(71),
      I3 => res_or0001,
      I4 => res_71_51_1618,
      O => res(71)
    );
  res_72_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_72_97_1623,
      I1 => res_72_16_1621,
      I2 => res_add(72),
      I3 => res_or0001,
      I4 => res_72_51_1622,
      O => res(72)
    );
  res_73_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_73_97_1627,
      I1 => res_73_16_1625,
      I2 => res_add(73),
      I3 => res_or0001,
      I4 => res_73_51_1626,
      O => res(73)
    );
  res_74_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_74_97_1631,
      I1 => res_74_16_1629,
      I2 => res_add(74),
      I3 => res_or0001,
      I4 => res_74_51_1630,
      O => res(74)
    );
  res_75_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_75_97_1635,
      I1 => res_75_16_1633,
      I2 => res_add(75),
      I3 => res_or0001,
      I4 => res_75_51_1634,
      O => res(75)
    );
  res_76_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_76_97_1639,
      I1 => res_76_16_1637,
      I2 => res_add(76),
      I3 => res_or0001,
      I4 => res_76_51_1638,
      O => res(76)
    );
  res_77_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_77_97_1643,
      I1 => res_77_16_1641,
      I2 => res_add(77),
      I3 => res_or0001,
      I4 => res_77_51_1642,
      O => res(77)
    );
  res_78_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_78_97_1647,
      I1 => res_78_16_1645,
      I2 => res_add(78),
      I3 => res_or0001,
      I4 => res_78_51_1646,
      O => res(78)
    );
  res_79_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_79_97_1651,
      I1 => res_79_16_1649,
      I2 => res_add(79),
      I3 => res_or0001,
      I4 => res_79_51_1650,
      O => res(79)
    );
  res_80_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_80_97_1658,
      I1 => res_80_16_1656,
      I2 => res_add(80),
      I3 => res_or0001,
      I4 => res_80_51_1657,
      O => res(80)
    );
  res_81_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_81_97_1662,
      I1 => res_81_16_1660,
      I2 => res_add(81),
      I3 => res_or0001,
      I4 => res_81_51_1661,
      O => res(81)
    );
  res_82_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_82_97_1666,
      I1 => res_82_16_1664,
      I2 => res_add(82),
      I3 => res_or0001,
      I4 => res_82_51_1665,
      O => res(82)
    );
  res_83_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_83_97_1670,
      I1 => res_83_16_1668,
      I2 => res_add(83),
      I3 => res_or0001,
      I4 => res_83_51_1669,
      O => res(83)
    );
  res_84_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_84_97_1674,
      I1 => res_84_16_1672,
      I2 => res_add(84),
      I3 => res_or0001,
      I4 => res_84_51_1673,
      O => res(84)
    );
  res_85_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_85_97_1678,
      I1 => res_85_16_1676,
      I2 => res_add(85),
      I3 => res_or0001,
      I4 => res_85_51_1677,
      O => res(85)
    );
  res_86_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_86_97_1682,
      I1 => res_86_16_1680,
      I2 => res_add(86),
      I3 => res_or0001,
      I4 => res_86_51_1681,
      O => res(86)
    );
  res_87_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_87_97_1686,
      I1 => res_87_16_1684,
      I2 => res_add(87),
      I3 => res_or0001,
      I4 => res_87_51_1685,
      O => res(87)
    );
  res_88_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_88_97_1690,
      I1 => res_88_16_1688,
      I2 => res_add(88),
      I3 => res_or0001,
      I4 => res_88_51_1689,
      O => res(88)
    );
  res_89_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_89_97_1694,
      I1 => res_89_16_1692,
      I2 => res_add(89),
      I3 => res_or0001,
      I4 => res_89_51_1693,
      O => res(89)
    );
  res_90_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_90_97_1701,
      I1 => res_90_16_1699,
      I2 => res_add(90),
      I3 => res_or0001,
      I4 => res_90_51_1700,
      O => res(90)
    );
  res_91_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_91_97_1705,
      I1 => res_91_16_1703,
      I2 => res_add(91),
      I3 => res_or0001,
      I4 => res_91_51_1704,
      O => res(91)
    );
  res_92_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_92_97_1709,
      I1 => res_92_16_1707,
      I2 => res_add(92),
      I3 => res_or0001,
      I4 => res_92_51_1708,
      O => res(92)
    );
  res_93_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_93_97_1713,
      I1 => res_93_16_1711,
      I2 => res_add(93),
      I3 => res_or0001,
      I4 => res_93_51_1712,
      O => res(93)
    );
  res_94_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_94_97_1717,
      I1 => res_94_16_1715,
      I2 => res_add(94),
      I3 => res_or0001,
      I4 => res_94_51_1716,
      O => res(94)
    );
  res_95_114 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_95_97_1721,
      I1 => res_95_16_1719,
      I2 => res_add(95),
      I3 => res_or0001,
      I4 => res_95_51_1720,
      O => res(95)
    );
  res_96_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_96_81_1725,
      I1 => res_96_16_1723,
      I2 => res_add(96),
      I3 => res_or0001,
      I4 => res_96_51_1724,
      O => res(96)
    );
  res_97_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_97_81_1729,
      I1 => res_97_16_1727,
      I2 => res_add(97),
      I3 => res_or0001,
      I4 => res_97_51_1728,
      O => res(97)
    );
  res_98_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_98_81_1733,
      I1 => res_98_16_1731,
      I2 => res_add(98),
      I3 => res_or0001,
      I4 => res_98_51_1732,
      O => res(98)
    );
  res_99_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_99_81_1737,
      I1 => res_99_16_1735,
      I2 => res_add(99),
      I3 => res_or0001,
      I4 => res_99_51_1736,
      O => res(99)
    );
  res_100_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_100_81_1245,
      I1 => res_100_16_1243,
      I2 => res_add(100),
      I3 => res_or0001,
      I4 => res_100_51_1244,
      O => res(100)
    );
  res_101_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_101_81_1249,
      I1 => res_101_16_1247,
      I2 => res_add(101),
      I3 => res_or0001,
      I4 => res_101_51_1248,
      O => res(101)
    );
  res_102_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_102_81_1253,
      I1 => res_102_16_1251,
      I2 => res_add(102),
      I3 => res_or0001,
      I4 => res_102_51_1252,
      O => res(102)
    );
  res_103_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_103_81_1257,
      I1 => res_103_16_1255,
      I2 => res_add(103),
      I3 => res_or0001,
      I4 => res_103_51_1256,
      O => res(103)
    );
  res_104_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_104_81_1261,
      I1 => res_104_16_1259,
      I2 => res_add(104),
      I3 => res_or0001,
      I4 => res_104_51_1260,
      O => res(104)
    );
  res_105_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_105_81_1265,
      I1 => res_105_16_1263,
      I2 => res_add(105),
      I3 => res_or0001,
      I4 => res_105_51_1264,
      O => res(105)
    );
  res_106_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_106_81_1269,
      I1 => res_106_16_1267,
      I2 => res_add(106),
      I3 => res_or0001,
      I4 => res_106_51_1268,
      O => res(106)
    );
  res_107_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_107_81_1273,
      I1 => res_107_16_1271,
      I2 => res_add(107),
      I3 => res_or0001,
      I4 => res_107_51_1272,
      O => res(107)
    );
  res_108_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_108_81_1277,
      I1 => res_108_16_1275,
      I2 => res_add(108),
      I3 => res_or0001,
      I4 => res_108_51_1276,
      O => res(108)
    );
  res_109_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_109_81_1281,
      I1 => res_109_16_1279,
      I2 => res_add(109),
      I3 => res_or0001,
      I4 => res_109_51_1280,
      O => res(109)
    );
  res_110_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_110_81_1288,
      I1 => res_110_16_1286,
      I2 => res_add(110),
      I3 => res_or0001,
      I4 => res_110_51_1287,
      O => res(110)
    );
  res_111_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_111_81_1292,
      I1 => res_111_16_1290,
      I2 => res_add(111),
      I3 => res_or0001,
      I4 => res_111_51_1291,
      O => res(111)
    );
  res_112_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_112_81_1296,
      I1 => res_112_16_1294,
      I2 => res_add(112),
      I3 => res_or0001,
      I4 => res_112_51_1295,
      O => res(112)
    );
  res_113_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_113_81_1300,
      I1 => res_113_16_1298,
      I2 => res_add(113),
      I3 => res_or0001,
      I4 => res_113_51_1299,
      O => res(113)
    );
  res_114_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_114_81_1304,
      I1 => res_114_16_1302,
      I2 => res_add(114),
      I3 => res_or0001,
      I4 => res_114_51_1303,
      O => res(114)
    );
  res_115_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_115_81_1308,
      I1 => res_115_16_1306,
      I2 => res_add(115),
      I3 => res_or0001,
      I4 => res_115_51_1307,
      O => res(115)
    );
  res_116_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_116_81_1312,
      I1 => res_116_16_1310,
      I2 => res_add(116),
      I3 => res_or0001,
      I4 => res_116_51_1311,
      O => res(116)
    );
  res_117_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_117_81_1316,
      I1 => res_117_16_1314,
      I2 => res_add(117),
      I3 => res_or0001,
      I4 => res_117_51_1315,
      O => res(117)
    );
  res_118_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_118_81_1320,
      I1 => res_118_16_1318,
      I2 => res_add(118),
      I3 => res_or0001,
      I4 => res_118_51_1319,
      O => res(118)
    );
  res_119_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_119_81_1324,
      I1 => res_119_16_1322,
      I2 => res_add(119),
      I3 => res_or0001,
      I4 => res_119_51_1323,
      O => res(119)
    );
  res_120_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_120_81_1331,
      I1 => res_120_16_1329,
      I2 => res_add(120),
      I3 => res_or0001,
      I4 => res_120_51_1330,
      O => res(120)
    );
  res_121_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_121_81_1335,
      I1 => res_121_16_1333,
      I2 => res_add(121),
      I3 => res_or0001,
      I4 => res_121_51_1334,
      O => res(121)
    );
  res_122_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_122_81_1339,
      I1 => res_122_16_1337,
      I2 => res_add(122),
      I3 => res_or0001,
      I4 => res_122_51_1338,
      O => res(122)
    );
  res_123_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_123_81_1343,
      I1 => res_123_16_1341,
      I2 => res_add(123),
      I3 => res_or0001,
      I4 => res_123_51_1342,
      O => res(123)
    );
  res_124_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_124_81_1347,
      I1 => res_124_16_1345,
      I2 => res_add(124),
      I3 => res_or0001,
      I4 => res_124_51_1346,
      O => res(124)
    );
  res_125_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_125_81_1351,
      I1 => res_125_16_1349,
      I2 => res_add(125),
      I3 => res_or0001,
      I4 => res_125_51_1350,
      O => res(125)
    );
  res_126_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_126_81_1355,
      I1 => res_126_16_1353,
      I2 => res_add(126),
      I3 => res_or0001,
      I4 => res_126_51_1354,
      O => res(126)
    );
  res_127_97 : LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
    port map (
      I0 => res_127_81_1359,
      I1 => res_127_16_1357,
      I2 => res_add(127),
      I3 => res_or0001,
      I4 => res_127_51_1358,
      O => res(127)
    );
  res_0_8 : LUT5
    generic map(
      INIT => X"00008000"
    )
    port map (
      I0 => nul,
      I1 => op_ctrl(3),
      I2 => op_ctrl(0),
      I3 => op_ctrl(1),
      I4 => op_ctrl(4),
      O => res_0_8_1241
    );
  efct_op2_128_11 : LUT5
    generic map(
      INIT => X"FFFF4D1B"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(4),
      O => N8
    );
  res_100_311 : LUT5
    generic map(
      INIT => X"00020080"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(3),
      I2 => op_ctrl(4),
      I3 => op_ctrl(0),
      I4 => op_ctrl(1),
      O => N278
    );
  inst_shifter_buf_4_mux0000_126_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_118_Q,
      I4 => inst_shifter_buf_3_126_Q,
      O => inst_shifter_buf_4_126_Q
    );
  inst_shifter_buf_4_mux0000_124_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_116_Q,
      I4 => inst_shifter_buf_3_124_Q,
      O => inst_shifter_buf_4_124_Q
    );
  inst_shifter_buf_4_mux0000_122_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_114_Q,
      I4 => inst_shifter_buf_3_122_Q,
      O => inst_shifter_buf_4_122_Q
    );
  inst_shifter_buf_4_mux0000_120_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_112_Q,
      I4 => inst_shifter_buf_3_120_Q,
      O => inst_shifter_buf_4_120_Q
    );
  inst_shifter_buf_3_mux0000_126_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_122_Q,
      I4 => inst_shifter_buf_2_126_Q,
      O => inst_shifter_buf_3_126_Q
    );
  inst_shifter_buf_3_mux0000_124_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_120_Q,
      I4 => inst_shifter_buf_2_124_Q,
      O => inst_shifter_buf_3_124_Q
    );
  inst_shifter_buf_4_mux0000_127_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_119_Q,
      I4 => inst_shifter_buf_3_127_Q,
      O => inst_shifter_buf_4_127_Q
    );
  inst_shifter_buf_4_mux0000_125_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_117_Q,
      I4 => inst_shifter_buf_3_125_Q,
      O => inst_shifter_buf_4_125_Q
    );
  inst_shifter_buf_4_mux0000_123_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_115_Q,
      I4 => inst_shifter_buf_3_123_Q,
      O => inst_shifter_buf_4_123_Q
    );
  inst_shifter_buf_4_mux0000_121_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_113_Q,
      I4 => inst_shifter_buf_3_121_Q,
      O => inst_shifter_buf_4_121_Q
    );
  inst_shifter_buf_3_mux0000_127_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_123_Q,
      I4 => inst_shifter_buf_2_127_Q,
      O => inst_shifter_buf_3_127_Q
    );
  inst_shifter_buf_3_mux0000_125_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_sign_extd(32),
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_121_Q,
      I4 => inst_shifter_buf_2_125_Q,
      O => inst_shifter_buf_3_125_Q
    );
  res_5_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_5_62_1554,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_37_Q,
      I5 => inst_shifter_buf_5_5_Q,
      O => res(5)
    );
  res_7_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_7_62_1654,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_39_Q,
      I5 => inst_shifter_buf_5_7_Q,
      O => res(7)
    );
  res_6_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_6_62_1611,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_38_Q,
      I5 => inst_shifter_buf_5_6_Q,
      O => res(6)
    );
  res_3_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_3_62_1455,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_35_Q,
      I5 => inst_shifter_buf_5_3_Q,
      O => res(3)
    );
  res_2_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_2_62_1417,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_34_Q,
      I5 => inst_shifter_buf_5_2_Q,
      O => res(2)
    );
  res_15_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_15_62_1371,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_47_Q,
      I5 => inst_shifter_buf_5_15_Q,
      O => res(15)
    );
  res_14_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_14_62_1368,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_46_Q,
      I5 => inst_shifter_buf_5_14_Q,
      O => res(14)
    );
  res_13_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_13_62_1365,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_45_Q,
      I5 => inst_shifter_buf_5_13_Q,
      O => res(13)
    );
  res_11_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_11_62_1327,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_43_Q,
      I5 => inst_shifter_buf_5_11_Q,
      O => res(11)
    );
  res_10_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_10_62_1284,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_42_Q,
      I5 => inst_shifter_buf_5_10_Q,
      O => res(10)
    );
  res_8_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_8_62_1697,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_40_Q,
      I5 => inst_shifter_buf_5_8_Q,
      O => res(8)
    );
  res_1_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_1_62_1386,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_33_Q,
      I5 => inst_shifter_buf_5_1_Q,
      O => res(1)
    );
  res_16_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_16_62_1374,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_48_Q,
      I5 => inst_shifter_buf_5_16_Q,
      O => res(16)
    );
  res_4_90 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_4_62_1502,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_36_Q,
      I5 => inst_shifter_buf_5_4_Q,
      O => res(4)
    );
  inst_shifter_buf_4_mux0000_0_1 : LUT4
    generic map(
      INIT => X"E444"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_0_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_8_Q,
      O => inst_shifter_buf_4_0_Q
    );
  res_96_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_96_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_64_Q,
      I5 => shift_dir,
      O => res_96_81_1725
    );
  res_97_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_97_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_65_Q,
      I5 => shift_dir,
      O => res_97_81_1729
    );
  res_98_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_98_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_66_Q,
      I5 => shift_dir,
      O => res_98_81_1733
    );
  res_99_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_99_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_67_Q,
      I5 => shift_dir,
      O => res_99_81_1737
    );
  res_100_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_100_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_68_Q,
      I5 => shift_dir,
      O => res_100_81_1245
    );
  res_101_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_101_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_69_Q,
      I5 => shift_dir,
      O => res_101_81_1249
    );
  res_102_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_102_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_70_Q,
      I5 => shift_dir,
      O => res_102_81_1253
    );
  res_103_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_103_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_71_Q,
      I5 => shift_dir,
      O => res_103_81_1257
    );
  res_104_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_104_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_72_Q,
      I5 => shift_dir,
      O => res_104_81_1261
    );
  res_105_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_105_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_73_Q,
      I5 => shift_dir,
      O => res_105_81_1265
    );
  res_106_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_106_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_74_Q,
      I5 => shift_dir,
      O => res_106_81_1269
    );
  res_107_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_107_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_75_Q,
      I5 => shift_dir,
      O => res_107_81_1273
    );
  res_108_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_108_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_76_Q,
      I5 => shift_dir,
      O => res_108_81_1277
    );
  res_109_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_109_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_77_Q,
      I5 => shift_dir,
      O => res_109_81_1281
    );
  res_110_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_110_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_78_Q,
      I5 => shift_dir,
      O => res_110_81_1288
    );
  res_111_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_111_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_79_Q,
      I5 => shift_dir,
      O => res_111_81_1292
    );
  res_112_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_112_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_80_Q,
      I5 => shift_dir,
      O => res_112_81_1296
    );
  res_113_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_113_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_81_Q,
      I5 => shift_dir,
      O => res_113_81_1300
    );
  res_114_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_114_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_82_Q,
      I5 => shift_dir,
      O => res_114_81_1304
    );
  res_115_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_115_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_83_Q,
      I5 => shift_dir,
      O => res_115_81_1308
    );
  res_116_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_116_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_84_Q,
      I5 => shift_dir,
      O => res_116_81_1312
    );
  res_117_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_117_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_85_Q,
      I5 => shift_dir,
      O => res_117_81_1316
    );
  res_118_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_118_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_86_Q,
      I5 => shift_dir,
      O => res_118_81_1320
    );
  res_119_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_119_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_87_Q,
      I5 => shift_dir,
      O => res_119_81_1324
    );
  res_120_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_120_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_88_Q,
      I5 => shift_dir,
      O => res_120_81_1331
    );
  res_121_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_121_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_89_Q,
      I5 => shift_dir,
      O => res_121_81_1335
    );
  res_122_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_122_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_90_Q,
      I5 => shift_dir,
      O => res_122_81_1339
    );
  res_123_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_123_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_91_Q,
      I5 => shift_dir,
      O => res_123_81_1343
    );
  res_124_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_124_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_92_Q,
      I5 => shift_dir,
      O => res_124_81_1347
    );
  res_125_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_125_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_93_Q,
      I5 => shift_dir,
      O => res_125_81_1351
    );
  res_126_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_126_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_94_Q,
      I5 => shift_dir,
      O => res_126_81_1355
    );
  res_127_81 : LUT6
    generic map(
      INIT => X"AA20AA20AAA8AA20"
    )
    port map (
      I0 => N01,
      I1 => op1(5),
      I2 => inst_shifter_buf_5_127_Q,
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_5_95_Q,
      I5 => shift_dir,
      O => res_127_81_1359
    );
  Madd_res_add_Madd_lut_127_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(127),
      I1 => op2(127),
      I2 => comp_op2,
      I3 => N8,
      O => Madd_res_add_Madd_lut(127)
    );
  res_cmp_eq00031 : LUT5
    generic map(
      INIT => X"00000004"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(3),
      I2 => op_ctrl(4),
      I3 => op_ctrl(0),
      I4 => op_ctrl(1),
      O => res_cmp_eq0003
    );
  res_65_29 : LUT6
    generic map(
      INIT => X"0000000010000000"
    )
    port map (
      I0 => op1(65),
      I1 => op_ctrl(3),
      I2 => op_ctrl(2),
      I3 => op_ctrl(1),
      I4 => op_ctrl(0),
      I5 => op_ctrl(4),
      O => res_65_29_1585
    );
  res_66_29 : LUT6
    generic map(
      INIT => X"0000000010000000"
    )
    port map (
      I0 => op1(66),
      I1 => op_ctrl(3),
      I2 => op_ctrl(2),
      I3 => op_ctrl(1),
      I4 => op_ctrl(0),
      I5 => op_ctrl(4),
      O => res_66_29_1592
    );
  res_67_29 : LUT6
    generic map(
      INIT => X"0000000010000000"
    )
    port map (
      I0 => op1(67),
      I1 => op_ctrl(3),
      I2 => op_ctrl(2),
      I3 => op_ctrl(1),
      I4 => op_ctrl(0),
      I5 => op_ctrl(4),
      O => res_67_29_1599
    );
  inst_shifter_buf_2_mux0000_126_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_124_Q,
      I2 => shift_dir,
      I3 => shift_type,
      I4 => op2(127),
      I5 => inst_shifter_buf_1_126_Q,
      O => inst_shifter_buf_2_126_Q
    );
  inst_shifter_buf_4_mux0000_1_Q : LUT6
    generic map(
      INIT => X"F151B111B111B111"
    )
    port map (
      I0 => op1(3),
      I1 => N285,
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_9_Q,
      I4 => inst_shifter_buf_2_5_Q,
      I5 => op1(2),
      O => inst_shifter_buf_4_1_Q
    );
  res_31_88_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(31),
      I2 => op2(31),
      I3 => res_add(31),
      I4 => res_or0001,
      I5 => res_31_38_1421,
      O => N319
    );
  res_31_88 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => N319,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_63_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_31_Q,
      O => res(31)
    );
  res_30_88_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(30),
      I2 => op2(30),
      I3 => res_add(30),
      I4 => res_or0001,
      I5 => res_30_38_1419,
      O => N321
    );
  res_30_88 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => N321,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_62_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_30_Q,
      O => res(30)
    );
  res_29_88_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(29),
      I2 => op2(29),
      I3 => res_add(29),
      I4 => res_or0001,
      I5 => res_29_38_1414,
      O => N323
    );
  res_29_88 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => N323,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_61_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_29_Q,
      O => res(29)
    );
  res_27_88_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF020202"
    )
    port map (
      I0 => res_cmp_eq0003,
      I1 => op1(27),
      I2 => op2(27),
      I3 => res_add(27),
      I4 => res_or0001,
      I5 => res_27_38_1409,
      O => N325
    );
  res_27_88 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => N325,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_59_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_27_Q,
      O => res(27)
    );
  res_37_95 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_69_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_5_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_37_Q,
      O => res_37_95_1446
    );
  res_33_95 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_65_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_1_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_33_Q,
      O => res_33_95_1429
    );
  res_32_95 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_64_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_0_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_32_Q,
      O => res_32_95_1425
    );
  res_40_95 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_72_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_8_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_40_Q,
      O => res_40_95_1460
    );
  res_44_95 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_76_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_12_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_44_Q,
      O => res_44_95_1478
    );
  res_36_95 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_68_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_4_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_36_Q,
      O => res_36_95_1441
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
  res_41_94 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_73_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_9_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_41_Q,
      O => res_41_94_1464
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
  res_39_107_SW0 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_71_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_7_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_39_Q,
      O => N305
    );
  res_38_107_SW0 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(5),
      I1 => inst_shifter_buf_5_70_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_6_Q,
      I4 => op1(4),
      I5 => inst_shifter_buf_5_38_Q,
      O => N307
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
  res_18_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_18_62_1380,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_50_Q,
      I5 => inst_shifter_buf_5_18_Q,
      O => res(18)
    );
  res_19_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_19_62_1383,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_51_Q,
      I5 => inst_shifter_buf_5_19_Q,
      O => res(19)
    );
  res_21_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_21_62_1392,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_53_Q,
      I5 => inst_shifter_buf_5_21_Q,
      O => res(21)
    );
  res_22_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_22_62_1395,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_54_Q,
      I5 => inst_shifter_buf_5_22_Q,
      O => res(22)
    );
  res_23_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_23_62_1398,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_55_Q,
      I5 => inst_shifter_buf_5_23_Q,
      O => res(23)
    );
  res_26_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_26_62_1407,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_58_Q,
      I5 => inst_shifter_buf_5_26_Q,
      O => res(26)
    );
  res_24_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_24_62_1401,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_56_Q,
      I5 => inst_shifter_buf_5_24_Q,
      O => res(24)
    );
  res_17_85 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_17_62_1377,
      I1 => N01,
      I2 => op1(5),
      I3 => shift_dir,
      I4 => inst_shifter_buf_5_49_Q,
      I5 => inst_shifter_buf_5_17_Q,
      O => res(17)
    );
  res_28_89 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_28_62_1412,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_60_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_28_Q,
      O => res(28)
    );
  res_20_89 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_20_62_1389,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_52_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_20_Q,
      O => res(20)
    );
  res_12_89 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_12_62_1362,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_44_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_12_Q,
      O => res(12)
    );
  res_9_89 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_9_62_1740,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_41_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_9_Q,
      O => res(9)
    );
  res_25_89 : LUT6
    generic map(
      INIT => X"EEAEAEAEEAAAAAAA"
    )
    port map (
      I0 => res_25_62_1404,
      I1 => N01,
      I2 => op1(5),
      I3 => inst_shifter_buf_5_57_Q,
      I4 => shift_dir,
      I5 => inst_shifter_buf_5_25_Q,
      O => res(25)
    );
  inst_shifter_sign_extd_32_1 : LUT6
    generic map(
      INIT => X"0000400000000000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(4),
      I2 => op_ctrl(2),
      I3 => op_ctrl(0),
      I4 => op_ctrl(3),
      I5 => op2(127),
      O => inst_shifter_sign_extd(32)
    );
  inst_shifter_buf_6_mux0000_100_11 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => op2(127),
      I1 => shift_type,
      I2 => shift_dir,
      I3 => op1(5),
      O => inst_shifter_N01
    );
  res_0_155_SW0 : LUT6
    generic map(
      INIT => X"BCA89480BCA89581"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(0),
      I2 => op_ctrl(1),
      I3 => res_add(128),
      I4 => op1(0),
      I5 => op2(0),
      O => N315
    );
  inst_shifter_buf_5_mux0000_17_1 : LUT6
    generic map(
      INIT => X"DDDF888A55570002"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => N285,
      I4 => inst_shifter_buf_4_17_Q,
      I5 => inst_shifter_buf_4_33_Q,
      O => inst_shifter_buf_5_17_Q
    );
  inst_shifter_buf_5_mux0000_5_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_29_Q,
      I4 => inst_shifter_buf_3_21_Q,
      I5 => inst_shifter_buf_4_5_Q,
      O => inst_shifter_buf_5_5_Q
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
  inst_shifter_buf_5_mux0000_7_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_31_Q,
      I4 => inst_shifter_buf_3_23_Q,
      I5 => inst_shifter_buf_4_7_Q,
      O => inst_shifter_buf_5_7_Q
    );
  inst_shifter_buf_5_mux0000_6_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_30_Q,
      I4 => inst_shifter_buf_3_22_Q,
      I5 => inst_shifter_buf_4_6_Q,
      O => inst_shifter_buf_5_6_Q
    );
  inst_shifter_buf_5_mux0000_1_1 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_25_Q,
      I4 => inst_shifter_buf_3_17_Q,
      I5 => inst_shifter_buf_4_1_Q,
      O => inst_shifter_buf_5_1_Q
    );
  inst_shifter_buf_4_mux0000_7_1 : LUT6
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
      O => inst_shifter_buf_4_7_Q
    );
  inst_shifter_buf_4_mux0000_6_1 : LUT6
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
      O => inst_shifter_buf_4_6_Q
    );
  inst_shifter_buf_4_mux0000_5_1 : LUT6
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
      O => inst_shifter_buf_4_5_Q
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
  inst_shifter_buf_5_mux0000_127_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_111_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_127_Q,
      O => inst_shifter_buf_5_127_Q
    );
  inst_shifter_buf_5_mux0000_126_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_110_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_126_Q,
      O => inst_shifter_buf_5_126_Q
    );
  inst_shifter_buf_5_mux0000_125_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_109_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_125_Q,
      O => inst_shifter_buf_5_125_Q
    );
  inst_shifter_buf_5_mux0000_124_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_108_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_124_Q,
      O => inst_shifter_buf_5_124_Q
    );
  inst_shifter_buf_5_mux0000_123_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_107_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_123_Q,
      O => inst_shifter_buf_5_123_Q
    );
  inst_shifter_buf_5_mux0000_122_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_106_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_122_Q,
      O => inst_shifter_buf_5_122_Q
    );
  inst_shifter_buf_5_mux0000_121_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_105_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_121_Q,
      O => inst_shifter_buf_5_121_Q
    );
  inst_shifter_buf_5_mux0000_120_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_104_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_120_Q,
      O => inst_shifter_buf_5_120_Q
    );
  inst_shifter_buf_5_mux0000_119_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_103_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_119_Q,
      O => inst_shifter_buf_5_119_Q
    );
  inst_shifter_buf_5_mux0000_118_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_102_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_118_Q,
      O => inst_shifter_buf_5_118_Q
    );
  inst_shifter_buf_5_mux0000_117_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_101_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_117_Q,
      O => inst_shifter_buf_5_117_Q
    );
  inst_shifter_buf_5_mux0000_116_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_100_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_116_Q,
      O => inst_shifter_buf_5_116_Q
    );
  inst_shifter_buf_5_mux0000_115_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_99_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_115_Q,
      O => inst_shifter_buf_5_115_Q
    );
  inst_shifter_buf_5_mux0000_114_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_98_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_114_Q,
      O => inst_shifter_buf_5_114_Q
    );
  inst_shifter_buf_5_mux0000_113_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_97_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_113_Q,
      O => inst_shifter_buf_5_113_Q
    );
  inst_shifter_buf_5_mux0000_112_1 : LUT6
    generic map(
      INIT => X"FD5D5D5DA8080808"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_96_Q,
      I2 => shift_dir,
      I3 => op2(127),
      I4 => shift_type,
      I5 => inst_shifter_buf_4_112_Q,
      O => inst_shifter_buf_5_112_Q
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
  inst_shifter_buf_3_mux0000_4_Q : MUXF7
    port map (
      I0 => N327,
      I1 => N328,
      S => op1(2),
      O => inst_shifter_buf_3_4_Q
    );
  inst_shifter_buf_3_mux0000_4_F : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_buf_1_6_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_2_Q,
      I4 => inst_shifter_buf_1_4_Q,
      O => N327
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
      O => N328
    );
  inst_shifter_buf_3_mux0000_8_Q : MUXF7
    port map (
      I0 => N329,
      I1 => N330,
      S => op1(1),
      O => inst_shifter_buf_3_8_Q
    );
  inst_shifter_buf_3_mux0000_8_F : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_2_12_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_1_4_Q,
      I4 => inst_shifter_buf_1_8_Q,
      O => N329
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
      O => N330
    );
  res_0_357 : MUXF7
    port map (
      I0 => N331,
      I1 => N332,
      S => op_ctrl(3),
      O => res_0_357_1240
    );
  res_0_357_F : LUT6
    generic map(
      INIT => X"1551510114505000"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(0),
      I2 => op_ctrl(1),
      I3 => op1(0),
      I4 => op2(0),
      I5 => res_add(0),
      O => N331
    );
  res_0_357_G : LUT5
    generic map(
      INIT => X"55010105"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => N11,
      I2 => nul,
      I3 => op_ctrl(0),
      I4 => op1(127),
      O => N332
    );
  inst_shifter_buf_3_mux0000_0_74 : MUXF7
    port map (
      I0 => N333,
      I1 => N334,
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
      O => N333
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
      O => N334
    );
  res_0_155 : MUXF7
    port map (
      I0 => N335,
      I1 => N336,
      S => op_ctrl(4),
      O => res_0_155_1238
    );
  res_0_155_F : LUT4
    generic map(
      INIT => X"D888"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => N315,
      I2 => res_add(0),
      I3 => N11,
      O => N335
    );
  res_0_155_G : LUT6
    generic map(
      INIT => X"F8F98889F0F10001"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(3),
      I3 => op1(127),
      I4 => N315,
      I5 => shifter_out(0),
      O => N336
    );
  res_65_211 : LUT6
    generic map(
      INIT => X"FFFFAAAAFFFFA808"
    )
    port map (
      I0 => op1(65),
      I1 => res_cmp_eq0004,
      I2 => op2(65),
      I3 => res_cmp_eq0001,
      I4 => op2(1),
      I5 => N144,
      O => res_65_211_1583
    );
  res_65_212 : LUT5
    generic map(
      INIT => X"AAAAA808"
    )
    port map (
      I0 => op1(65),
      I1 => res_cmp_eq0004,
      I2 => op2(65),
      I3 => res_cmp_eq0001,
      I4 => N144,
      O => res_65_212_1584
    );
  res_65_21_f7 : MUXF7
    port map (
      I0 => res_65_212_1584,
      I1 => res_65_211_1583,
      S => res_cmp_eq0006,
      O => res_65_21
    );
  res_66_211 : LUT6
    generic map(
      INIT => X"FFFFAAAAFFFFA808"
    )
    port map (
      I0 => op1(66),
      I1 => res_cmp_eq0004,
      I2 => op2(66),
      I3 => res_cmp_eq0001,
      I4 => op2(2),
      I5 => N144,
      O => res_66_211_1590
    );
  res_66_212 : LUT5
    generic map(
      INIT => X"AAAAA808"
    )
    port map (
      I0 => op1(66),
      I1 => res_cmp_eq0004,
      I2 => op2(66),
      I3 => res_cmp_eq0001,
      I4 => N144,
      O => res_66_212_1591
    );
  res_66_21_f7 : MUXF7
    port map (
      I0 => res_66_212_1591,
      I1 => res_66_211_1590,
      S => res_cmp_eq0006,
      O => res_66_21
    );
  res_67_211 : LUT6
    generic map(
      INIT => X"FFFFAAAAFFFFA808"
    )
    port map (
      I0 => op1(67),
      I1 => res_cmp_eq0004,
      I2 => op2(67),
      I3 => res_cmp_eq0001,
      I4 => op2(3),
      I5 => N144,
      O => res_67_211_1597
    );
  res_67_212 : LUT5
    generic map(
      INIT => X"AAAAA808"
    )
    port map (
      I0 => op1(67),
      I1 => res_cmp_eq0004,
      I2 => op2(67),
      I3 => res_cmp_eq0001,
      I4 => N144,
      O => res_67_212_1598
    );
  res_67_21_f7 : MUXF7
    port map (
      I0 => res_67_212_1598,
      I1 => res_67_211_1597,
      S => res_cmp_eq0006,
      O => res_67_21
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
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_buf_1_6_Q,
      I2 => op1(1),
      I3 => inst_shifter_buf_1_8_Q,
      I4 => inst_shifter_buf_2_12_Q,
      O => inst_shifter_buf_3_mux0000_12_1_964
    );
  inst_shifter_buf_3_mux0000_12_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_3_mux0000_12_1_964,
      I1 => inst_shifter_buf_3_mux0000(12),
      S => shift_dir,
      O => inst_shifter_buf_3_12_Q
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
      O => inst_shifter_buf_4_mux0000_9_1_966
    );
  inst_shifter_buf_4_mux0000_9_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_4_mux0000_9_1_966,
      I1 => inst_shifter_buf_4_mux0000(9),
      S => shift_dir,
      O => inst_shifter_buf_4_9_Q
    );
  res_64_61_SW01 : LUT6
    generic map(
      INIT => X"FFFFAAAAFFFFA808"
    )
    port map (
      I0 => op1(64),
      I1 => res_cmp_eq0004,
      I2 => op2(64),
      I3 => res_cmp_eq0001,
      I4 => op2(0),
      I5 => N144,
      O => res_64_61_SW0
    );
  res_64_61_SW02 : LUT5
    generic map(
      INIT => X"AAAAA808"
    )
    port map (
      I0 => op1(64),
      I1 => res_cmp_eq0004,
      I2 => op2(64),
      I3 => res_cmp_eq0001,
      I4 => N144,
      O => res_64_61_SW01_1578
    );
  res_64_61_SW0_f7 : MUXF7
    port map (
      I0 => res_64_61_SW01_1578,
      I1 => res_64_61_SW0,
      S => res_cmp_eq0006,
      O => N303
    );
  res_37_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(37),
      I1 => op2(37),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_37_461_1444
    );
  res_37_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(37),
      I1 => N144,
      I2 => op2(37),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_37_462_1445
    );
  res_37_46_f7 : MUXF7
    port map (
      I0 => res_37_462_1445,
      I1 => res_37_461_1444,
      S => res_cmp_eq0004,
      O => res_37_46
    );
  res_47_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(47),
      I1 => op2(47),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_47_461_1491
    );
  res_47_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(47),
      I1 => N144,
      I2 => op2(47),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_47_462_1492
    );
  res_47_46_f7 : MUXF7
    port map (
      I0 => res_47_462_1492,
      I1 => res_47_461_1491,
      S => res_cmp_eq0004,
      O => res_47_46
    );
  res_46_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(46),
      I1 => op2(46),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_46_461_1486
    );
  res_46_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(46),
      I1 => N144,
      I2 => op2(46),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_46_462_1487
    );
  res_46_46_f7 : MUXF7
    port map (
      I0 => res_46_462_1487,
      I1 => res_46_461_1486,
      S => res_cmp_eq0004,
      O => res_46_46
    );
  res_45_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(45),
      I1 => op2(45),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_45_461_1481
    );
  res_45_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(45),
      I1 => N144,
      I2 => op2(45),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_45_462_1482
    );
  res_45_46_f7 : MUXF7
    port map (
      I0 => res_45_462_1482,
      I1 => res_45_461_1481,
      S => res_cmp_eq0004,
      O => res_45_46
    );
  res_43_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(43),
      I1 => op2(43),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_43_461_1472
    );
  res_43_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(43),
      I1 => N144,
      I2 => op2(43),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_43_462_1473
    );
  res_43_46_f7 : MUXF7
    port map (
      I0 => res_43_462_1473,
      I1 => res_43_461_1472,
      S => res_cmp_eq0004,
      O => res_43_46
    );
  res_42_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(42),
      I1 => op2(42),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_42_461_1467
    );
  res_42_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(42),
      I1 => N144,
      I2 => op2(42),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_42_462_1468
    );
  res_42_46_f7 : MUXF7
    port map (
      I0 => res_42_462_1468,
      I1 => res_42_461_1467,
      S => res_cmp_eq0004,
      O => res_42_46
    );
  res_50_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(50),
      I1 => op2(50),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_50_461_1505
    );
  res_50_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(50),
      I1 => N144,
      I2 => op2(50),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_50_462_1506
    );
  res_50_46_f7 : MUXF7
    port map (
      I0 => res_50_462_1506,
      I1 => res_50_461_1505,
      S => res_cmp_eq0004,
      O => res_50_46
    );
  res_40_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(40),
      I1 => op2(40),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_40_461_1458
    );
  res_40_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(40),
      I1 => N144,
      I2 => op2(40),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_40_462_1459
    );
  res_40_46_f7 : MUXF7
    port map (
      I0 => res_40_462_1459,
      I1 => res_40_461_1458,
      S => res_cmp_eq0004,
      O => res_40_46
    );
  res_51_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(51),
      I1 => op2(51),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_51_461_1510
    );
  res_51_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(51),
      I1 => N144,
      I2 => op2(51),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_51_462_1511
    );
  res_51_46_f7 : MUXF7
    port map (
      I0 => res_51_462_1511,
      I1 => res_51_461_1510,
      S => res_cmp_eq0004,
      O => res_51_46
    );
  res_53_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(53),
      I1 => op2(53),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_53_461_1520
    );
  res_53_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(53),
      I1 => N144,
      I2 => op2(53),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_53_462_1521
    );
  res_53_46_f7 : MUXF7
    port map (
      I0 => res_53_462_1521,
      I1 => res_53_461_1520,
      S => res_cmp_eq0004,
      O => res_53_46
    );
  res_54_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(54),
      I1 => op2(54),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_54_461_1525
    );
  res_54_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(54),
      I1 => N144,
      I2 => op2(54),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_54_462_1526
    );
  res_54_46_f7 : MUXF7
    port map (
      I0 => res_54_462_1526,
      I1 => res_54_461_1525,
      S => res_cmp_eq0004,
      O => res_54_46
    );
  res_55_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(55),
      I1 => op2(55),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_55_461_1530
    );
  res_55_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(55),
      I1 => N144,
      I2 => op2(55),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_55_462_1531
    );
  res_55_46_f7 : MUXF7
    port map (
      I0 => res_55_462_1531,
      I1 => res_55_461_1530,
      S => res_cmp_eq0004,
      O => res_55_46
    );
  res_58_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(58),
      I1 => op2(58),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_58_461_1544
    );
  res_58_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(58),
      I1 => N144,
      I2 => op2(58),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_58_462_1545
    );
  res_58_46_f7 : MUXF7
    port map (
      I0 => res_58_462_1545,
      I1 => res_58_461_1544,
      S => res_cmp_eq0004,
      O => res_58_46
    );
  res_56_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(56),
      I1 => op2(56),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_56_461_1535
    );
  res_56_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(56),
      I1 => N144,
      I2 => op2(56),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_56_462_1536
    );
  res_56_46_f7 : MUXF7
    port map (
      I0 => res_56_462_1536,
      I1 => res_56_461_1535,
      S => res_cmp_eq0004,
      O => res_56_46
    );
  res_59_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(59),
      I1 => op2(59),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_59_461_1549
    );
  res_59_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(59),
      I1 => N144,
      I2 => op2(59),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_59_462_1550
    );
  res_59_46_f7 : MUXF7
    port map (
      I0 => res_59_462_1550,
      I1 => res_59_461_1549,
      S => res_cmp_eq0004,
      O => res_59_46
    );
  res_61_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(61),
      I1 => op2(61),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_61_461_1562
    );
  res_61_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(61),
      I1 => N144,
      I2 => op2(61),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_61_462_1563
    );
  res_61_46_f7 : MUXF7
    port map (
      I0 => res_61_462_1563,
      I1 => res_61_461_1562,
      S => res_cmp_eq0004,
      O => res_61_46
    );
  res_62_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(62),
      I1 => op2(62),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_62_461_1567
    );
  res_62_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(62),
      I1 => N144,
      I2 => op2(62),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_62_462_1568
    );
  res_62_46_f7 : MUXF7
    port map (
      I0 => res_62_462_1568,
      I1 => res_62_461_1567,
      S => res_cmp_eq0004,
      O => res_62_46
    );
  res_52_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(52),
      I1 => op2(52),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_52_461_1515
    );
  res_52_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(52),
      I1 => N144,
      I2 => op2(52),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_52_462_1516
    );
  res_52_46_f7 : MUXF7
    port map (
      I0 => res_52_462_1516,
      I1 => res_52_461_1515,
      S => res_cmp_eq0004,
      O => res_52_46
    );
  res_63_461 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op1(63),
      I1 => op2(63),
      I2 => N278,
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_63_461_1572
    );
  res_63_462 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op1(63),
      I1 => N144,
      I2 => op2(63),
      I3 => res_cmp_eq0001,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_63_462_1573
    );
  res_63_46_f7 : MUXF7
    port map (
      I0 => res_63_462_1573,
      I1 => res_63_461_1572,
      S => res_cmp_eq0004,
      O => res_63_46
    );
  res_60_451 : LUT6
    generic map(
      INIT => X"FFFFFFF7EEEEEEE6"
    )
    port map (
      I0 => op2(60),
      I1 => op1(60),
      I2 => res_cmp_eq0001,
      I3 => N144,
      I4 => N278,
      I5 => res_cmp_eq0003,
      O => res_60_451_1557
    );
  res_60_452 : LUT6
    generic map(
      INIT => X"FDFDAD8DF8F8A888"
    )
    port map (
      I0 => op2(60),
      I1 => N278,
      I2 => op1(60),
      I3 => res_cmp_eq0001,
      I4 => N144,
      I5 => res_cmp_eq0003,
      O => res_60_452_1558
    );
  res_60_45_f7 : MUXF7
    port map (
      I0 => res_60_452_1558,
      I1 => res_60_451_1557,
      S => res_cmp_eq0004,
      O => res_60_45
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
      O => inst_shifter_buf_5_mux0000_3_11_970
    );
  inst_shifter_buf_5_mux0000_3_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_3_11_970,
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
      O => inst_shifter_buf_5_mux0000_2_11_968
    );
  inst_shifter_buf_5_mux0000_2_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_2_11_968,
      I1 => inst_shifter_buf_5_mux0000_2_1,
      S => op1(4),
      O => inst_shifter_buf_5_2_Q
    );
  inst_shifter_buf_6_mux0000_0_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_32_Q,
      I3 => inst_shifter_buf_4_48_Q,
      O => inst_shifter_buf_6_mux0000_0_1
    );
  inst_shifter_buf_6_mux0000_0_12 : LUT6
    generic map(
      INIT => X"DD5DD55588088000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => inst_shifter_buf_3_24_Q,
      I4 => inst_shifter_buf_3_16_Q,
      I5 => inst_shifter_buf_4_0_Q,
      O => inst_shifter_buf_6_mux0000_0_11_972
    );
  inst_shifter_buf_6_mux0000_0_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_6_mux0000_0_11_972,
      I1 => inst_shifter_buf_6_mux0000_0_1,
      S => op1(5),
      O => shifter_out(0)
    );

end Structure;

