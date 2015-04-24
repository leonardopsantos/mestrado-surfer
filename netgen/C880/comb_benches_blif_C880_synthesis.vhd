--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: comb_benches_blif_C880_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 18:12:31 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm comb_benches_blif_C880 -w -dir netgen/synthesis -ofmt vhdl -sim comb_benches_blif_C880.ngc comb_benches_blif_C880_synthesis.vhd 
-- Device	: xc5vlx110t-1-ff1136
-- Input file	: comb_benches_blif_C880.ngc
-- Output file	: D:\ISE Projects\experiences\netgen\synthesis\comb_benches_blif_C880_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: comb_benches_blif_C880
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

entity comb_benches_blif_C880 is
  port (
    outputVector : out STD_LOGIC_VECTOR ( 25 downto 0 ); 
    inputVector : in STD_LOGIC_VECTOR ( 59 downto 0 ) 
  );
end comb_benches_blif_C880;

architecture Structure of comb_benches_blif_C880 is
  signal N01 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N49 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal NlwRenamedSig_OI_outputVector_11_Q : STD_LOGIC; 
  signal NlwRenamedSig_OI_outputVector_2_Q : STD_LOGIC; 
  signal yx400GAT_157xx : STD_LOGIC; 
  signal yx466GAT_201xx_and0000_98 : STD_LOGIC; 
  signal yx476GAT_188xx : STD_LOGIC; 
  signal yx483GAT_202xx_and0000 : STD_LOGIC; 
  signal yx491GAT_187xx_and0000 : STD_LOGIC; 
  signal yx553GAT_251xx_and0000_102 : STD_LOGIC; 
  signal yx557GAT_252xx_and0000_103 : STD_LOGIC; 
  signal yx561GAT_253xx_and0000_104 : STD_LOGIC; 
  signal yx565GAT_254xx_and0000_105 : STD_LOGIC; 
  signal yx569GAT_247xx_and0000 : STD_LOGIC; 
  signal yx573GAT_248xx_and0000 : STD_LOGIC; 
  signal yx577GAT_249xx_and0000 : STD_LOGIC; 
  signal yx581GAT_250xx_and0000 : STD_LOGIC; 
  signal yx778GAT_352xx_and0000 : STD_LOGIC; 
  signal yx796GAT_373xx_and0000 : STD_LOGIC; 
  signal yx819GAT_387xx_and0000 : STD_LOGIC; 
  signal yx840GAT_393xx111_113 : STD_LOGIC; 
  signal yx840GAT_393xx121_114 : STD_LOGIC; 
  signal yx855GAT_418xx150_115 : STD_LOGIC; 
  signal yx855GAT_418xx32_116 : STD_LOGIC; 
  signal yx855GAT_418xx43_117 : STD_LOGIC; 
  signal yx856GAT_417xx47_118 : STD_LOGIC; 
  signal yx857GAT_416xx183_119 : STD_LOGIC; 
  signal yx857GAT_416xx4_120 : STD_LOGIC; 
  signal yx857GAT_416xx49_121 : STD_LOGIC; 
  signal yx870GAT_429xx30_122 : STD_LOGIC; 
  signal yx870GAT_429xx41_123 : STD_LOGIC; 
  signal yx875GAT_439xx0_124 : STD_LOGIC; 
  signal yx875GAT_439xx164_125 : STD_LOGIC; 
  signal yx875GAT_439xx43_126 : STD_LOGIC; 
  signal yx875GAT_439xx54_127 : STD_LOGIC; 
  signal yx876GAT_438xx30_128 : STD_LOGIC; 
  signal yx876GAT_438xx41_129 : STD_LOGIC; 
  signal yx877GAT_437xx0_130 : STD_LOGIC; 
  signal yx877GAT_437xx150_131 : STD_LOGIC; 
  signal yx877GAT_437xx43_132 : STD_LOGIC; 
  signal yx877GAT_437xx54_133 : STD_LOGIC; 
begin
  outputVector(11) <= NlwRenamedSig_OI_outputVector_11_Q;
  outputVector(2) <= NlwRenamedSig_OI_outputVector_2_Q;
  yx297GAT_89xx1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(18),
      O => outputVector(3)
    );
  yx356GAT_122xx1 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => inputVector(22),
      I1 => inputVector(19),
      I2 => inputVector(20),
      O => outputVector(9)
    );
  yx355GAT_123xx_and00001 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => inputVector(21),
      I1 => inputVector(19),
      I2 => inputVector(20),
      O => outputVector(14)
    );
  yx354GAT_129xx1 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => inputVector(6),
      I1 => inputVector(7),
      I2 => inputVector(10),
      O => outputVector(8)
    );
  yx353GAT_130xx1 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => inputVector(6),
      I1 => inputVector(16),
      I2 => inputVector(10),
      O => outputVector(7)
    );
  yx351GAT_125xx1 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => inputVector(15),
      I1 => inputVector(16),
      I2 => inputVector(10),
      O => outputVector(6)
    );
  yx291GAT_99xx1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(6),
      I2 => inputVector(16),
      O => outputVector(1)
    );
  yx290GAT_100xx1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(15),
      I2 => inputVector(7),
      O => outputVector(0)
    );
  yx269GAT_112xx_and00001 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => inputVector(1),
      I1 => inputVector(3),
      I2 => inputVector(0),
      I3 => inputVector(2),
      O => outputVector(4)
    );
  yx349GAT_134xx_and00001 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(11),
      I2 => inputVector(0),
      I3 => inputVector(1),
      I4 => inputVector(2),
      I5 => inputVector(9),
      O => outputVector(12)
    );
  yx350GAT_126xx_and00001 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => inputVector(14),
      I1 => N49,
      O => outputVector(13)
    );
  outputVector_2_1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(6),
      I2 => inputVector(7),
      O => NlwRenamedSig_OI_outputVector_2_Q
    );
  yx392GAT_167xx1 : LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(3),
      I2 => inputVector(0),
      I3 => inputVector(2),
      I4 => NlwRenamedSig_OI_outputVector_2_Q,
      O => outputVector(10)
    );
  yx344GAT_136xx1 : LUT5
    generic map(
      INIT => X"FF7FFFFF"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(3),
      I2 => inputVector(0),
      I3 => NlwRenamedSig_OI_outputVector_2_Q,
      I4 => inputVector(2),
      O => outputVector(5)
    );
  outputVector_16_SW0 : LUT5
    generic map(
      INIT => X"69969669"
    )
    port map (
      I0 => inputVector(43),
      I1 => inputVector(42),
      I2 => inputVector(41),
      I3 => inputVector(40),
      I4 => inputVector(31),
      O => N01
    );
  outputVector_16_Q : LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => inputVector(48),
      I1 => inputVector(47),
      I2 => inputVector(46),
      I3 => inputVector(45),
      I4 => inputVector(44),
      I5 => N01,
      O => outputVector(16)
    );
  outputVector_15_SW0 : LUT5
    generic map(
      INIT => X"69969669"
    )
    port map (
      I0 => inputVector(27),
      I1 => inputVector(26),
      I2 => inputVector(25),
      I3 => inputVector(24),
      I4 => inputVector(23),
      O => N2
    );
  outputVector_15_Q : LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => inputVector(32),
      I1 => inputVector(31),
      I2 => inputVector(30),
      I3 => inputVector(29),
      I4 => inputVector(28),
      I5 => N2,
      O => outputVector(15)
    );
  yx400GAT_157xx2 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(13),
      I2 => inputVector(7),
      I3 => N49,
      O => yx400GAT_157xx
    );
  yx400GAT_157xx11 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(11),
      I2 => inputVector(0),
      I3 => inputVector(1),
      I4 => inputVector(2),
      I5 => inputVector(9),
      O => N49
    );
  yx840GAT_393xx111 : LUT4
    generic map(
      INIT => X"D590"
    )
    port map (
      I0 => yx581GAT_250xx_and0000,
      I1 => inputVector(47),
      I2 => inputVector(51),
      I3 => inputVector(53),
      O => yx840GAT_393xx111_113
    );
  yx840GAT_393xx121 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => inputVector(47),
      I1 => inputVector(52),
      I2 => yx581GAT_250xx_and0000,
      I3 => yx400GAT_157xx,
      O => yx840GAT_393xx121_114
    );
  yx856GAT_417xx47 : LUT5
    generic map(
      INIT => X"AFAAAD08"
    )
    port map (
      I0 => inputVector(45),
      I1 => inputVector(52),
      I2 => yx573GAT_248xx_and0000,
      I3 => inputVector(51),
      I4 => yx400GAT_157xx,
      O => yx856GAT_417xx47_118
    );
  yx857GAT_416xx4 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => inputVector(28),
      I1 => inputVector(49),
      I2 => inputVector(54),
      I3 => inputVector(56),
      O => yx857GAT_416xx4_120
    );
  yx857GAT_416xx49 : LUT5
    generic map(
      INIT => X"AFAAAD08"
    )
    port map (
      I0 => inputVector(46),
      I1 => inputVector(52),
      I2 => yx577GAT_249xx_and0000,
      I3 => inputVector(51),
      I4 => yx400GAT_157xx,
      O => yx857GAT_416xx49_121
    );
  yx857GAT_416xx183 : LUT6
    generic map(
      INIT => X"2882828228282882"
    )
    port map (
      I0 => inputVector(50),
      I1 => yx577GAT_249xx_and0000,
      I2 => inputVector(46),
      I3 => inputVector(57),
      I4 => inputVector(47),
      I5 => yx581GAT_250xx_and0000,
      O => yx857GAT_416xx183_119
    );
  yx855GAT_418xx43 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => inputVector(44),
      I1 => inputVector(52),
      I2 => yx569GAT_247xx_and0000,
      I3 => yx400GAT_157xx,
      O => yx855GAT_418xx43_117
    );
  yx855GAT_418xx150 : LUT5
    generic map(
      INIT => X"96996696"
    )
    port map (
      I0 => yx569GAT_247xx_and0000,
      I1 => inputVector(44),
      I2 => yx573GAT_248xx_and0000,
      I3 => inputVector(45),
      I4 => yx778GAT_352xx_and0000,
      O => yx855GAT_418xx150_115
    );
  yx855GAT_418xx167 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => yx855GAT_418xx32_116,
      I1 => yx855GAT_418xx43_117,
      I2 => inputVector(50),
      I3 => yx855GAT_418xx150_115,
      O => outputVector(18)
    );
  yx870GAT_429xx41 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => inputVector(43),
      I1 => inputVector(52),
      I2 => yx565GAT_254xx_and0000_105,
      I3 => yx400GAT_157xx,
      O => yx870GAT_429xx41_123
    );
  yx858GAT_420xx1 : LUT5
    generic map(
      INIT => X"088AAEEF"
    )
    port map (
      I0 => inputVector(40),
      I1 => inputVector(41),
      I2 => yx819GAT_387xx_and0000,
      I3 => yx557GAT_252xx_and0000_103,
      I4 => yx553GAT_251xx_and0000_102,
      O => outputVector(21)
    );
  yx476GAT_188xx1 : LUT6
    generic map(
      INIT => X"0800000000000000"
    )
    port map (
      I0 => inputVector(3),
      I1 => NlwRenamedSig_OI_outputVector_11_Q,
      I2 => inputVector(59),
      I3 => inputVector(5),
      I4 => inputVector(15),
      I5 => inputVector(16),
      O => yx476GAT_188xx
    );
  yx557GAT_252xx_and0000_SW0 : LUT5
    generic map(
      INIT => X"00808080"
    )
    port map (
      I0 => inputVector(35),
      I1 => inputVector(9),
      I2 => NlwRenamedSig_OI_outputVector_11_Q,
      I3 => inputVector(39),
      I4 => inputVector(10),
      O => N4
    );
  yx557GAT_252xx_and0000 : LUT6
    generic map(
      INIT => X"0101000105050005"
    )
    port map (
      I0 => yx476GAT_188xx,
      I1 => inputVector(8),
      I2 => N4,
      I3 => inputVector(24),
      I4 => yx466GAT_201xx_and0000_98,
      I5 => inputVector(33),
      O => yx557GAT_252xx_and0000_103
    );
  yx553GAT_251xx_and0000_SW0 : LUT5
    generic map(
      INIT => X"00808080"
    )
    port map (
      I0 => inputVector(34),
      I1 => inputVector(9),
      I2 => NlwRenamedSig_OI_outputVector_11_Q,
      I3 => inputVector(39),
      I4 => inputVector(10),
      O => N6
    );
  yx553GAT_251xx_and0000 : LUT6
    generic map(
      INIT => X"0101000105050005"
    )
    port map (
      I0 => yx476GAT_188xx,
      I1 => inputVector(33),
      I2 => N6,
      I3 => inputVector(23),
      I4 => yx466GAT_201xx_and0000_98,
      I5 => inputVector(1),
      O => yx553GAT_251xx_and0000_102
    );
  yx877GAT_437xx0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => inputVector(24),
      I1 => inputVector(49),
      O => yx877GAT_437xx0_130
    );
  yx877GAT_437xx43 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => inputVector(42),
      I1 => inputVector(52),
      I2 => yx561GAT_253xx_and0000_104,
      I3 => yx400GAT_157xx,
      O => yx877GAT_437xx43_132
    );
  yx877GAT_437xx54 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF8F82"
    )
    port map (
      I0 => inputVector(51),
      I1 => inputVector(42),
      I2 => yx561GAT_253xx_and0000_104,
      I3 => inputVector(53),
      I4 => yx877GAT_437xx0_130,
      I5 => yx877GAT_437xx43_132,
      O => yx877GAT_437xx54_133
    );
  yx877GAT_437xx150 : LUT5
    generic map(
      INIT => X"96996696"
    )
    port map (
      I0 => yx561GAT_253xx_and0000_104,
      I1 => inputVector(42),
      I2 => yx565GAT_254xx_and0000_105,
      I3 => inputVector(43),
      I4 => yx796GAT_373xx_and0000,
      O => yx877GAT_437xx150_131
    );
  yx877GAT_437xx166 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => inputVector(50),
      I1 => yx877GAT_437xx150_131,
      I2 => yx877GAT_437xx54_133,
      O => outputVector(25)
    );
  yx876GAT_438xx41 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => inputVector(41),
      I1 => inputVector(52),
      I2 => yx557GAT_252xx_and0000_103,
      I3 => yx400GAT_157xx,
      O => yx876GAT_438xx41_129
    );
  yx565GAT_254xx_and0000_SW0 : LUT5
    generic map(
      INIT => X"00808080"
    )
    port map (
      I0 => inputVector(38),
      I1 => inputVector(9),
      I2 => NlwRenamedSig_OI_outputVector_11_Q,
      I3 => inputVector(39),
      I4 => inputVector(10),
      O => N8
    );
  yx565GAT_254xx_and0000 : LUT6
    generic map(
      INIT => X"0101000105050005"
    )
    port map (
      I0 => yx476GAT_188xx,
      I1 => inputVector(37),
      I2 => N8,
      I3 => inputVector(26),
      I4 => yx466GAT_201xx_and0000_98,
      I5 => inputVector(33),
      O => yx565GAT_254xx_and0000_105
    );
  yx561GAT_253xx_and0000_SW0 : LUT5
    generic map(
      INIT => X"00808080"
    )
    port map (
      I0 => inputVector(36),
      I1 => inputVector(9),
      I2 => NlwRenamedSig_OI_outputVector_11_Q,
      I3 => inputVector(39),
      I4 => inputVector(10),
      O => N10
    );
  yx561GAT_253xx_and0000 : LUT6
    generic map(
      INIT => X"0101000105050005"
    )
    port map (
      I0 => yx476GAT_188xx,
      I1 => inputVector(3),
      I2 => N10,
      I3 => inputVector(25),
      I4 => yx466GAT_201xx_and0000_98,
      I5 => inputVector(33),
      O => yx561GAT_253xx_and0000_104
    );
  yx875GAT_439xx0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => inputVector(49),
      I1 => inputVector(59),
      O => yx875GAT_439xx0_124
    );
  yx875GAT_439xx43 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => inputVector(40),
      I1 => inputVector(52),
      I2 => yx553GAT_251xx_and0000_102,
      I3 => yx400GAT_157xx,
      O => yx875GAT_439xx43_126
    );
  yx875GAT_439xx54 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF8F82"
    )
    port map (
      I0 => inputVector(51),
      I1 => inputVector(40),
      I2 => yx553GAT_251xx_and0000_102,
      I3 => inputVector(53),
      I4 => yx875GAT_439xx0_124,
      I5 => yx875GAT_439xx43_126,
      O => yx875GAT_439xx54_127
    );
  yx875GAT_439xx164 : LUT6
    generic map(
      INIT => X"8228282882828228"
    )
    port map (
      I0 => inputVector(50),
      I1 => yx553GAT_251xx_and0000_102,
      I2 => inputVector(40),
      I3 => yx557GAT_252xx_and0000_103,
      I4 => yx819GAT_387xx_and0000,
      I5 => inputVector(41),
      O => yx875GAT_439xx164_125
    );
  yx875GAT_439xx165 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => yx875GAT_439xx54_127,
      I1 => yx875GAT_439xx164_125,
      O => outputVector(23)
    );
  yx573GAT_248xx_and00001 : LUT5
    generic map(
      INIT => X"22330203"
    )
    port map (
      I0 => yx466GAT_201xx_and0000_98,
      I1 => yx491GAT_187xx_and0000,
      I2 => inputVector(35),
      I3 => inputVector(28),
      I4 => yx483GAT_202xx_and0000,
      O => yx573GAT_248xx_and0000
    );
  yx569GAT_247xx_and00001 : LUT5
    generic map(
      INIT => X"22330203"
    )
    port map (
      I0 => yx466GAT_201xx_and0000_98,
      I1 => yx491GAT_187xx_and0000,
      I2 => inputVector(34),
      I3 => inputVector(27),
      I4 => yx483GAT_202xx_and0000,
      O => yx569GAT_247xx_and0000
    );
  yx276GAT_110xx1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(4),
      I2 => inputVector(8),
      O => NlwRenamedSig_OI_outputVector_11_Q
    );
  yx491GAT_187xx_and00001 : LUT6
    generic map(
      INIT => X"0800000000000000"
    )
    port map (
      I0 => inputVector(9),
      I1 => NlwRenamedSig_OI_outputVector_11_Q,
      I2 => inputVector(59),
      I3 => inputVector(5),
      I4 => inputVector(15),
      I5 => inputVector(16),
      O => yx491GAT_187xx_and0000
    );
  yx581GAT_250xx_and00001 : LUT5
    generic map(
      INIT => X"22330203"
    )
    port map (
      I0 => yx466GAT_201xx_and0000_98,
      I1 => yx491GAT_187xx_and0000,
      I2 => inputVector(38),
      I3 => inputVector(30),
      I4 => yx483GAT_202xx_and0000,
      O => yx581GAT_250xx_and0000
    );
  yx577GAT_249xx_and00001 : LUT5
    generic map(
      INIT => X"22330203"
    )
    port map (
      I0 => yx466GAT_201xx_and0000_98,
      I1 => yx491GAT_187xx_and0000,
      I2 => inputVector(36),
      I3 => inputVector(29),
      I4 => yx483GAT_202xx_and0000,
      O => yx577GAT_249xx_and0000
    );
  yx819GAT_387xx_and00001 : LUT5
    generic map(
      INIT => X"A220FBBA"
    )
    port map (
      I0 => yx561GAT_253xx_and0000_104,
      I1 => inputVector(43),
      I2 => yx796GAT_373xx_and0000,
      I3 => yx565GAT_254xx_and0000_105,
      I4 => inputVector(42),
      O => yx819GAT_387xx_and0000
    );
  yx796GAT_373xx_and00001 : LUT5
    generic map(
      INIT => X"A220FBBA"
    )
    port map (
      I0 => yx569GAT_247xx_and0000,
      I1 => inputVector(45),
      I2 => yx778GAT_352xx_and0000,
      I3 => yx573GAT_248xx_and0000,
      I4 => inputVector(44),
      O => yx796GAT_373xx_and0000
    );
  yx778GAT_352xx_and00001 : LUT5
    generic map(
      INIT => X"088AAEEF"
    )
    port map (
      I0 => yx577GAT_249xx_and0000,
      I1 => yx581GAT_250xx_and0000,
      I2 => inputVector(57),
      I3 => inputVector(47),
      I4 => inputVector(46),
      O => yx778GAT_352xx_and0000
    );
  yx466GAT_201xx_and0000_SW1 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(39),
      I2 => inputVector(10),
      I3 => inputVector(0),
      O => N13
    );
  yx856GAT_417xx123_SW0 : LUT5
    generic map(
      INIT => X"FFF8F8F8"
    )
    port map (
      I0 => inputVector(27),
      I1 => inputVector(49),
      I2 => yx856GAT_417xx47_118,
      I3 => inputVector(54),
      I4 => inputVector(55),
      O => N16
    );
  yx856GAT_417xx123 : LUT6
    generic map(
      INIT => X"FBBBBFBBEBAABEAA"
    )
    port map (
      I0 => N16,
      I1 => yx573GAT_248xx_and0000,
      I2 => inputVector(45),
      I3 => inputVector(50),
      I4 => yx778GAT_352xx_and0000,
      I5 => inputVector(53),
      O => outputVector(19)
    );
  yx870GAT_429xx117 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF9060"
    )
    port map (
      I0 => inputVector(43),
      I1 => yx565GAT_254xx_and0000_105,
      I2 => inputVector(50),
      I3 => yx796GAT_373xx_and0000,
      I4 => yx870GAT_429xx30_122,
      I5 => yx870GAT_429xx41_123,
      O => outputVector(22)
    );
  yx876GAT_438xx117 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF9060"
    )
    port map (
      I0 => inputVector(41),
      I1 => yx557GAT_252xx_and0000_103,
      I2 => inputVector(50),
      I3 => yx819GAT_387xx_and0000,
      I4 => yx876GAT_438xx30_128,
      I5 => yx876GAT_438xx41_129,
      O => outputVector(24)
    );
  yx857GAT_416xx186 : LUT5
    generic map(
      INIT => X"FFFFFFF2"
    )
    port map (
      I0 => inputVector(53),
      I1 => yx577GAT_249xx_and0000,
      I2 => yx857GAT_416xx4_120,
      I3 => yx857GAT_416xx49_121,
      I4 => yx857GAT_416xx183_119,
      O => outputVector(20)
    );
  yx855GAT_418xx32 : LUT6
    generic map(
      INIT => X"FFFF8F828F828F82"
    )
    port map (
      I0 => inputVector(51),
      I1 => inputVector(44),
      I2 => yx569GAT_247xx_and0000,
      I3 => inputVector(53),
      I4 => inputVector(26),
      I5 => inputVector(49),
      O => yx855GAT_418xx32_116
    );
  yx870GAT_429xx30 : LUT6
    generic map(
      INIT => X"FFFF8F828F828F82"
    )
    port map (
      I0 => inputVector(51),
      I1 => inputVector(43),
      I2 => yx565GAT_254xx_and0000_105,
      I3 => inputVector(53),
      I4 => inputVector(25),
      I5 => inputVector(49),
      O => yx870GAT_429xx30_122
    );
  yx876GAT_438xx30 : LUT6
    generic map(
      INIT => X"FFFF8F828F828F82"
    )
    port map (
      I0 => inputVector(51),
      I1 => inputVector(41),
      I2 => yx557GAT_252xx_and0000_103,
      I3 => inputVector(53),
      I4 => inputVector(23),
      I5 => inputVector(49),
      O => yx876GAT_438xx30_128
    );
  yx466GAT_201xx_and0000_SW3 : LUT6
    generic map(
      INIT => X"80BB80FF80FF80FF"
    )
    port map (
      I0 => inputVector(7),
      I1 => inputVector(10),
      I2 => inputVector(15),
      I3 => inputVector(1),
      I4 => inputVector(39),
      I5 => inputVector(4),
      O => N18
    );
  yx466GAT_201xx_and0000 : LUT6
    generic map(
      INIT => X"D8DDFAFFFFFFFFFF"
    )
    port map (
      I0 => inputVector(3),
      I1 => N18,
      I2 => N13,
      I3 => inputVector(7),
      I4 => inputVector(0),
      I5 => inputVector(8),
      O => yx466GAT_201xx_and0000_98
    );
  yx840GAT_393xx138_SW0 : LUT5
    generic map(
      INIT => X"FFF8F8F8"
    )
    port map (
      I0 => inputVector(29),
      I1 => inputVector(49),
      I2 => yx840GAT_393xx121_114,
      I3 => inputVector(54),
      I4 => inputVector(58),
      O => N20
    );
  yx840GAT_393xx138 : LUT6
    generic map(
      INIT => X"EFEEFEEEFEEEEFEE"
    )
    port map (
      I0 => yx840GAT_393xx111_113,
      I1 => N20,
      I2 => inputVector(47),
      I3 => inputVector(50),
      I4 => inputVector(57),
      I5 => yx581GAT_250xx_and0000,
      O => outputVector(17)
    );
  yx483GAT_202xx_and00001 : LUT6
    generic map(
      INIT => X"80AAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(10),
      I2 => inputVector(39),
      I3 => inputVector(3),
      I4 => inputVector(4),
      I5 => inputVector(8),
      O => yx483GAT_202xx_and0000
    );

end Structure;

