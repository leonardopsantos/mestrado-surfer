--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: comb_benches_blif_C499_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 18:11:32 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm comb_benches_blif_C499 -w -dir netgen/synthesis -ofmt vhdl -sim comb_benches_blif_C499.ngc comb_benches_blif_C499_synthesis.vhd 
-- Device	: xc5vlx110t-1-ff1136
-- Input file	: comb_benches_blif_C499.ngc
-- Output file	: D:\ISE Projects\experiences\netgen\synthesis\comb_benches_blif_C499_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: comb_benches_blif_C499
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

entity comb_benches_blif_C499 is
  port (
    outputVector : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    inputVector : in STD_LOGIC_VECTOR ( 40 downto 0 ) 
  );
end comb_benches_blif_C499;

architecture Structure of comb_benches_blif_C499 is
  signal F0_96xx : STD_LOGIC; 
  signal F1_95xx : STD_LOGIC; 
  signal F2_92xx : STD_LOGIC; 
  signal F3_89xx : STD_LOGIC; 
  signal F4_88xx : STD_LOGIC; 
  signal F5_87xx : STD_LOGIC; 
  signal F6_84xx : STD_LOGIC; 
  signal F7_81xx : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal S0_120xx : STD_LOGIC; 
  signal S1_119xx : STD_LOGIC; 
  signal S2_118xx : STD_LOGIC; 
  signal S3_117xx : STD_LOGIC; 
  signal S4_116xx : STD_LOGIC; 
  signal S5_115xx : STD_LOGIC; 
  signal S6_114xx : STD_LOGIC; 
  signal S7_113xx : STD_LOGIC; 
  signal WA_173xx : STD_LOGIC; 
  signal WB_171xx : STD_LOGIC; 
  signal WC_174xx : STD_LOGIC; 
  signal WD_172xx : STD_LOGIC; 
  signal XD0_112xx : STD_LOGIC; 
  signal XD1_111xx : STD_LOGIC; 
  signal XD2_110xx : STD_LOGIC; 
  signal XD3_109xx : STD_LOGIC; 
  signal XD4_108xx : STD_LOGIC; 
  signal XD5_107xx : STD_LOGIC; 
  signal XD6_106xx : STD_LOGIC; 
  signal XD7_105xx : STD_LOGIC; 
begin
  XD7_105xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(39),
      I1 => inputVector(40),
      I2 => F1_95xx,
      I3 => F3_89xx,
      O => XD7_105xx
    );
  XD6_106xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(38),
      I1 => inputVector(40),
      I2 => F0_96xx,
      I3 => F2_92xx,
      O => XD6_106xx
    );
  XD5_107xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(37),
      I1 => inputVector(40),
      I2 => F2_92xx,
      I3 => F3_89xx,
      O => XD5_107xx
    );
  XD4_108xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(36),
      I1 => inputVector(40),
      I2 => F0_96xx,
      I3 => F1_95xx,
      O => XD4_108xx
    );
  F3_89xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(13),
      I2 => inputVector(14),
      I3 => inputVector(15),
      O => F3_89xx
    );
  F2_92xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(11),
      I2 => inputVector(8),
      I3 => inputVector(9),
      O => F2_92xx
    );
  F1_95xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(5),
      I2 => inputVector(6),
      I3 => inputVector(7),
      O => F1_95xx
    );
  F0_96xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(1),
      I2 => inputVector(2),
      I3 => inputVector(3),
      O => F0_96xx
    );
  OD31_211xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(31),
      I1 => S2_118xx,
      I2 => S7_113xx,
      I3 => S3_117xx,
      I4 => N96,
      O => outputVector(31)
    );
  OD30_212xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(30),
      I1 => S2_118xx,
      I2 => S6_114xx,
      I3 => S3_117xx,
      I4 => N96,
      O => outputVector(30)
    );
  OD29_213xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(29),
      I1 => S2_118xx,
      I2 => S5_115xx,
      I3 => S3_117xx,
      I4 => N96,
      O => outputVector(29)
    );
  OD28_214xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(28),
      I1 => S2_118xx,
      I2 => S4_116xx,
      I3 => S3_117xx,
      I4 => N96,
      O => outputVector(28)
    );
  OD27_215xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(27),
      I1 => S3_117xx,
      I2 => S7_113xx,
      I3 => S2_118xx,
      I4 => N96,
      O => outputVector(27)
    );
  OD26_216xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(26),
      I1 => S3_117xx,
      I2 => S6_114xx,
      I3 => S2_118xx,
      I4 => N96,
      O => outputVector(26)
    );
  OD25_217xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(25),
      I1 => S3_117xx,
      I2 => S5_115xx,
      I3 => S2_118xx,
      I4 => N96,
      O => outputVector(25)
    );
  OD24_218xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(24),
      I1 => S3_117xx,
      I2 => S4_116xx,
      I3 => S2_118xx,
      I4 => N96,
      O => outputVector(24)
    );
  OD23_219xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(23),
      I1 => S2_118xx,
      I2 => S7_113xx,
      I3 => S3_117xx,
      I4 => N97,
      O => outputVector(23)
    );
  OD22_220xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(22),
      I1 => S2_118xx,
      I2 => S6_114xx,
      I3 => S3_117xx,
      I4 => N97,
      O => outputVector(22)
    );
  OD21_221xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(21),
      I1 => S2_118xx,
      I2 => S5_115xx,
      I3 => S3_117xx,
      I4 => N97,
      O => outputVector(21)
    );
  OD20_222xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(20),
      I1 => S2_118xx,
      I2 => S4_116xx,
      I3 => S3_117xx,
      I4 => N97,
      O => outputVector(20)
    );
  OD19_223xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(19),
      I1 => S3_117xx,
      I2 => S7_113xx,
      I3 => S2_118xx,
      I4 => N97,
      O => outputVector(19)
    );
  OD18_224xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(18),
      I1 => S3_117xx,
      I2 => S6_114xx,
      I3 => S2_118xx,
      I4 => N97,
      O => outputVector(18)
    );
  OD17_225xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(17),
      I1 => S3_117xx,
      I2 => S5_115xx,
      I3 => S2_118xx,
      I4 => N97,
      O => outputVector(17)
    );
  OD16_226xx1 : LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
    port map (
      I0 => inputVector(16),
      I1 => S3_117xx,
      I2 => S4_116xx,
      I3 => S2_118xx,
      I4 => N97,
      O => outputVector(16)
    );
  S7_113xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(19),
      I1 => inputVector(23),
      I2 => inputVector(27),
      I3 => inputVector(31),
      I4 => XD7_105xx,
      O => S7_113xx
    );
  S6_114xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(18),
      I1 => inputVector(22),
      I2 => inputVector(26),
      I3 => inputVector(30),
      I4 => XD6_106xx,
      O => S6_114xx
    );
  S5_115xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(21),
      I2 => inputVector(25),
      I3 => inputVector(29),
      I4 => XD5_107xx,
      O => S5_115xx
    );
  S4_116xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(16),
      I1 => inputVector(20),
      I2 => inputVector(24),
      I3 => inputVector(28),
      I4 => XD4_108xx,
      O => S4_116xx
    );
  WG_178xx11 : LUT6
    generic map(
      INIT => X"0000000400040440"
    )
    port map (
      I0 => S0_120xx,
      I1 => S1_119xx,
      I2 => S5_115xx,
      I3 => S6_114xx,
      I4 => S7_113xx,
      I5 => S4_116xx,
      O => N96
    );
  WE_177xx21 : LUT6
    generic map(
      INIT => X"0000000400040440"
    )
    port map (
      I0 => S1_119xx,
      I1 => S0_120xx,
      I2 => S5_115xx,
      I3 => S6_114xx,
      I4 => S7_113xx,
      I5 => S4_116xx,
      O => N97
    );
  XD3_109xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(35),
      I1 => inputVector(40),
      I2 => F5_87xx,
      I3 => F7_81xx,
      O => XD3_109xx
    );
  XD2_110xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(34),
      I1 => inputVector(40),
      I2 => F4_88xx,
      I3 => F6_84xx,
      O => XD2_110xx
    );
  XD1_111xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(33),
      I1 => inputVector(40),
      I2 => F6_84xx,
      I3 => F7_81xx,
      O => XD1_111xx
    );
  XD0_112xx1 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(32),
      I1 => inputVector(40),
      I2 => F4_88xx,
      I3 => F5_87xx,
      O => XD0_112xx
    );
  WA_173xx11 : LUT4
    generic map(
      INIT => X"0116"
    )
    port map (
      I0 => S2_118xx,
      I1 => S3_117xx,
      I2 => S0_120xx,
      I3 => S1_119xx,
      O => N11
    );
  F7_81xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(28),
      I1 => inputVector(29),
      I2 => inputVector(30),
      I3 => inputVector(31),
      O => F7_81xx
    );
  F6_84xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(24),
      I1 => inputVector(25),
      I2 => inputVector(26),
      I3 => inputVector(27),
      O => F6_84xx
    );
  F5_87xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(20),
      I1 => inputVector(21),
      I2 => inputVector(22),
      I3 => inputVector(23),
      O => F5_87xx
    );
  F4_88xx1 : LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => inputVector(16),
      I1 => inputVector(17),
      I2 => inputVector(18),
      I3 => inputVector(19),
      O => F4_88xx
    );
  WD_172xx1 : LUT5
    generic map(
      INIT => X"00400000"
    )
    port map (
      I0 => S4_116xx,
      I1 => S5_115xx,
      I2 => N11,
      I3 => S6_114xx,
      I4 => S7_113xx,
      O => WD_172xx
    );
  WC_174xx1 : LUT5
    generic map(
      INIT => X"00400000"
    )
    port map (
      I0 => S4_116xx,
      I1 => S6_114xx,
      I2 => N11,
      I3 => S7_113xx,
      I4 => S5_115xx,
      O => WC_174xx
    );
  WB_171xx1 : LUT5
    generic map(
      INIT => X"00400000"
    )
    port map (
      I0 => S5_115xx,
      I1 => S4_116xx,
      I2 => N11,
      I3 => S6_114xx,
      I4 => S7_113xx,
      O => WB_171xx
    );
  WA_173xx1 : LUT5
    generic map(
      INIT => X"00400000"
    )
    port map (
      I0 => S5_115xx,
      I1 => S6_114xx,
      I2 => N11,
      I3 => S7_113xx,
      I4 => S4_116xx,
      O => WA_173xx
    );
  S3_117xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(11),
      I1 => inputVector(15),
      I2 => inputVector(3),
      I3 => inputVector(7),
      I4 => XD3_109xx,
      O => S3_117xx
    );
  S2_118xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(14),
      I2 => inputVector(2),
      I3 => inputVector(6),
      I4 => XD2_110xx,
      O => S2_118xx
    );
  S1_119xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(13),
      I1 => inputVector(1),
      I2 => inputVector(5),
      I3 => inputVector(9),
      I4 => XD1_111xx,
      O => S1_119xx
    );
  S0_120xx1 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(12),
      I2 => inputVector(4),
      I3 => inputVector(8),
      I4 => XD0_112xx,
      O => S0_120xx
    );
  OD9_233xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(13),
      I1 => inputVector(1),
      I2 => inputVector(5),
      I3 => XD1_111xx,
      I4 => WC_174xx,
      I5 => inputVector(9),
      O => outputVector(9)
    );
  OD8_234xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(12),
      I2 => inputVector(4),
      I3 => XD0_112xx,
      I4 => WC_174xx,
      I5 => inputVector(8),
      O => outputVector(8)
    );
  OD7_235xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(11),
      I1 => inputVector(15),
      I2 => inputVector(3),
      I3 => XD3_109xx,
      I4 => WB_171xx,
      I5 => inputVector(7),
      O => outputVector(7)
    );
  OD6_236xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(14),
      I2 => inputVector(2),
      I3 => XD2_110xx,
      I4 => WB_171xx,
      I5 => inputVector(6),
      O => outputVector(6)
    );
  OD5_237xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(13),
      I1 => inputVector(1),
      I2 => inputVector(9),
      I3 => XD1_111xx,
      I4 => WB_171xx,
      I5 => inputVector(5),
      O => outputVector(5)
    );
  OD4_238xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(12),
      I2 => inputVector(8),
      I3 => XD0_112xx,
      I4 => WB_171xx,
      I5 => inputVector(4),
      O => outputVector(4)
    );
  OD3_239xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(11),
      I1 => inputVector(15),
      I2 => inputVector(7),
      I3 => XD3_109xx,
      I4 => WA_173xx,
      I5 => inputVector(3),
      O => outputVector(3)
    );
  OD2_240xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(14),
      I2 => inputVector(6),
      I3 => XD2_110xx,
      I4 => WA_173xx,
      I5 => inputVector(2),
      O => outputVector(2)
    );
  OD1_241xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(13),
      I1 => inputVector(5),
      I2 => inputVector(9),
      I3 => XD1_111xx,
      I4 => WA_173xx,
      I5 => inputVector(1),
      O => outputVector(1)
    );
  OD15_227xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(11),
      I1 => inputVector(3),
      I2 => inputVector(7),
      I3 => XD3_109xx,
      I4 => WD_172xx,
      I5 => inputVector(15),
      O => outputVector(15)
    );
  OD14_228xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(2),
      I2 => inputVector(6),
      I3 => XD2_110xx,
      I4 => WD_172xx,
      I5 => inputVector(14),
      O => outputVector(14)
    );
  OD13_229xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(1),
      I1 => inputVector(5),
      I2 => inputVector(9),
      I3 => XD1_111xx,
      I4 => WD_172xx,
      I5 => inputVector(13),
      O => outputVector(13)
    );
  OD12_230xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(4),
      I2 => inputVector(8),
      I3 => XD0_112xx,
      I4 => WD_172xx,
      I5 => inputVector(12),
      O => outputVector(12)
    );
  OD11_231xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(15),
      I1 => inputVector(3),
      I2 => inputVector(7),
      I3 => XD3_109xx,
      I4 => WC_174xx,
      I5 => inputVector(11),
      O => outputVector(11)
    );
  OD10_232xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(14),
      I1 => inputVector(2),
      I2 => inputVector(6),
      I3 => XD2_110xx,
      I4 => WC_174xx,
      I5 => inputVector(10),
      O => outputVector(10)
    );
  OD0_242xx1 : LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(4),
      I2 => inputVector(8),
      I3 => XD0_112xx,
      I4 => WA_173xx,
      I5 => inputVector(0),
      O => outputVector(0)
    );

end Structure;

