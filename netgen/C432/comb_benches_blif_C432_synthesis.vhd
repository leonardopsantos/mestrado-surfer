--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: comb_benches_blif_C432_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 18:10:55 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm comb_benches_blif_C432 -w -dir netgen/synthesis -ofmt vhdl -sim comb_benches_blif_C432.ngc comb_benches_blif_C432_synthesis.vhd 
-- Device	: xc5vlx110t-1-ff1136
-- Input file	: comb_benches_blif_C432.ngc
-- Output file	: D:\ISE Projects\experiences\netgen\synthesis\comb_benches_blif_C432_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: comb_benches_blif_C432
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

entity comb_benches_blif_C432 is
  port (
    outputVector : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
    inputVector : in STD_LOGIC_VECTOR ( 35 downto 0 ) 
  );
end comb_benches_blif_C432;

architecture Structure of comb_benches_blif_C432 is
  signal N11 : STD_LOGIC; 
  signal N131 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N151 : STD_LOGIC; 
  signal N161 : STD_LOGIC; 
  signal N17 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal N311 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal yx174GAT_62xx_and0000 : STD_LOGIC; 
  signal yx177GAT_59xx_and0000 : STD_LOGIC; 
  signal yx199GAT_81xx : STD_LOGIC; 
  signal yx199GAT_81xx44_64 : STD_LOGIC; 
  signal yx230GAT_97xx : STD_LOGIC; 
  signal yx296GAT_122xx : STD_LOGIC; 
  signal yx296GAT_122xx134_67 : STD_LOGIC; 
  signal yx296GAT_122xx134_SW0 : STD_LOGIC; 
  signal yx296GAT_122xx134_SW01_69 : STD_LOGIC; 
  signal yx296GAT_122xx24_70 : STD_LOGIC; 
  signal yx296GAT_122xx45 : STD_LOGIC; 
  signal yx296GAT_122xx451_72 : STD_LOGIC; 
  signal yx296GAT_122xx452_73 : STD_LOGIC; 
  signal yx296GAT_122xx93_74 : STD_LOGIC; 
  signal yx357GAT_161xx : STD_LOGIC; 
  signal yx357GAT_161xx109_76 : STD_LOGIC; 
  signal yx357GAT_161xx117_77 : STD_LOGIC; 
  signal yx357GAT_161xx211_78 : STD_LOGIC; 
  signal yx357GAT_161xx322_79 : STD_LOGIC; 
  signal yx357GAT_161xx361_80 : STD_LOGIC; 
  signal yx357GAT_161xx411_81 : STD_LOGIC; 
  signal yx357GAT_161xx439_82 : STD_LOGIC; 
  signal yx357GAT_161xx86_83 : STD_LOGIC; 
  signal yx381GAT_180xx_and0000 : STD_LOGIC; 
  signal yx381GAT_180xx_and00001_85 : STD_LOGIC; 
  signal yx381GAT_180xx_and00002_86 : STD_LOGIC; 
  signal yx386GAT_179xx_and0000 : STD_LOGIC; 
  signal yx386GAT_179xx_and00001_88 : STD_LOGIC; 
  signal yx386GAT_179xx_and00002_89 : STD_LOGIC; 
  signal yx393GAT_178xx_and0000 : STD_LOGIC; 
  signal yx399GAT_177xx_and0000 : STD_LOGIC; 
  signal yx399GAT_177xx_and00001_92 : STD_LOGIC; 
  signal yx399GAT_177xx_and00002_93 : STD_LOGIC; 
  signal yx407GAT_175xx_and0000 : STD_LOGIC; 
  signal yx407GAT_175xx_and00001_95 : STD_LOGIC; 
  signal yx411GAT_174xx_and0000 : STD_LOGIC; 
  signal yx418GAT_185xx : STD_LOGIC; 
  signal yx419GAT_184xx : STD_LOGIC; 
  signal yx421GAT_188xx126_99 : STD_LOGIC; 
  signal yx421GAT_188xx61_100 : STD_LOGIC; 
  signal yx421GAT_188xx8_101 : STD_LOGIC; 
  signal yx432GAT_195xx : STD_LOGIC; 
  signal yx432GAT_195xx1_103 : STD_LOGIC; 
begin
  yx421GAT_188xx31 : LUT4
    generic map(
      INIT => X"8CAE"
    )
    port map (
      I0 => yx199GAT_81xx,
      I1 => yx296GAT_122xx,
      I2 => inputVector(31),
      I3 => inputVector(34),
      O => N17
    );
  yx430GAT_193xx1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => yx381GAT_180xx_and0000,
      I1 => yx386GAT_179xx_and0000,
      I2 => yx393GAT_178xx_and0000,
      I3 => yx399GAT_177xx_and0000,
      O => outputVector(4)
    );
  yx431GAT_194xx1 : LUT6
    generic map(
      INIT => X"FFFFFFFFABABABAA"
    )
    port map (
      I0 => yx381GAT_180xx_and0000,
      I1 => yx393GAT_178xx_and0000,
      I2 => yx399GAT_177xx_and0000,
      I3 => yx418GAT_185xx,
      I4 => yx419GAT_184xx,
      I5 => yx386GAT_179xx_and0000,
      O => outputVector(5)
    );
  yx230GAT_97xx1 : LUT3
    generic map(
      INIT => X"9C"
    )
    port map (
      I0 => inputVector(7),
      I1 => yx199GAT_81xx,
      I2 => inputVector(9),
      O => yx230GAT_97xx
    );
  yx177GAT_59xx_and00001 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => inputVector(27),
      I1 => inputVector(29),
      O => yx177GAT_59xx_and0000
    );
  yx174GAT_62xx_and00001 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => inputVector(23),
      I1 => inputVector(25),
      O => yx174GAT_62xx_and0000
    );
  yx393GAT_178xx_and00001 : LUT6
    generic map(
      INIT => X"8080A0A0008000A0"
    )
    port map (
      I0 => N22,
      I1 => yx357GAT_161xx,
      I2 => inputVector(13),
      I3 => inputVector(11),
      I4 => inputVector(16),
      I5 => yx199GAT_81xx,
      O => yx393GAT_178xx_and0000
    );
  yx421GAT_188xx11 : LUT3
    generic map(
      INIT => X"F2"
    )
    port map (
      I0 => inputVector(4),
      I1 => yx357GAT_161xx,
      I2 => N131,
      O => N11
    );
  yx411GAT_174xx_and00001 : LUT6
    generic map(
      INIT => X"8080A0A0008000A0"
    )
    port map (
      I0 => N23,
      I1 => yx357GAT_161xx,
      I2 => inputVector(29),
      I3 => inputVector(27),
      I4 => inputVector(32),
      I5 => yx199GAT_81xx,
      O => yx411GAT_174xx_and0000
    );
  yx404GAT_176xx_and00001 : LUT6
    generic map(
      INIT => X"8080A0A0008000A0"
    )
    port map (
      I0 => N21,
      I1 => yx357GAT_161xx,
      I2 => inputVector(21),
      I3 => inputVector(19),
      I4 => inputVector(24),
      I5 => yx199GAT_81xx,
      O => yx418GAT_185xx
    );
  yx421GAT_188xx8 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => yx419GAT_184xx,
      I1 => yx381GAT_180xx_and0000,
      I2 => yx386GAT_179xx_and0000,
      I3 => yx411GAT_174xx_and0000,
      I4 => yx418GAT_185xx,
      O => yx421GAT_188xx8_101
    );
  yx296GAT_122xx161 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => yx296GAT_122xx24_70,
      I1 => yx296GAT_122xx45,
      I2 => yx296GAT_122xx93_74,
      I3 => yx296GAT_122xx134_67,
      O => yx296GAT_122xx
    );
  yx199GAT_81xx67_SW0 : LUT6
    generic map(
      INIT => X"F2FFF2FFFFFFF2FF"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(3),
      I2 => yx177GAT_59xx_and0000,
      I3 => yx199GAT_81xx44_64,
      I4 => inputVector(9),
      I5 => inputVector(7),
      O => N46
    );
  yx199GAT_81xx67 : LUT6
    generic map(
      INIT => X"0202000203030003"
    )
    port map (
      I0 => inputVector(11),
      I1 => yx174GAT_62xx_and0000,
      I2 => N46,
      I3 => inputVector(1),
      I4 => inputVector(0),
      I5 => inputVector(13),
      O => yx199GAT_81xx
    );
  yx357GAT_161xx488 : LUT6
    generic map(
      INIT => X"C000000080000000"
    )
    port map (
      I0 => yx357GAT_161xx411_81,
      I1 => yx357GAT_161xx211_78,
      I2 => yx357GAT_161xx322_79,
      I3 => yx357GAT_161xx86_83,
      I4 => yx357GAT_161xx361_80,
      I5 => yx357GAT_161xx439_82,
      O => yx357GAT_161xx
    );
  yx357GAT_161xx439 : LUT6
    generic map(
      INIT => X"AAFFFFAA2A3F3F2A"
    )
    port map (
      I0 => N151,
      I1 => inputVector(9),
      I2 => yx230GAT_97xx,
      I3 => inputVector(14),
      I4 => yx296GAT_122xx,
      I5 => inputVector(12),
      O => yx357GAT_161xx439_82
    );
  yx421GAT_188xx61 : LUT6
    generic map(
      INIT => X"2222F2222F2FFF2F"
    )
    port map (
      I0 => N17,
      I1 => inputVector(1),
      I2 => yx199GAT_81xx,
      I3 => N311,
      I4 => inputVector(34),
      I5 => N50,
      O => yx421GAT_188xx61_100
    );
  yx421GAT_188xx161 : LUT6
    generic map(
      INIT => X"FFFFAAA8AAA8AAA8"
    )
    port map (
      I0 => N11,
      I1 => yx393GAT_178xx_and0000,
      I2 => yx399GAT_177xx_and0000,
      I3 => yx421GAT_188xx8_101,
      I4 => inputVector(33),
      I5 => N52,
      O => outputVector(3)
    );
  yx357GAT_161xx411 : LUT4
    generic map(
      INIT => X"6624"
    )
    port map (
      I0 => inputVector(10),
      I1 => yx296GAT_122xx,
      I2 => inputVector(14),
      I3 => N151,
      O => yx357GAT_161xx411_81
    );
  SF041 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(13),
      I1 => inputVector(11),
      I2 => yx199GAT_81xx,
      I3 => inputVector(16),
      O => N151
    );
  yx357GAT_161xx109 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(1),
      I1 => inputVector(0),
      I2 => yx199GAT_81xx,
      I3 => inputVector(4),
      O => yx357GAT_161xx109_76
    );
  yx357GAT_161xx117 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(3),
      I2 => yx199GAT_81xx,
      I3 => inputVector(8),
      O => yx357GAT_161xx117_77
    );
  yx329GAT_133xx1 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => yx296GAT_122xx24_70,
      I1 => yx296GAT_122xx45,
      I2 => yx296GAT_122xx93_74,
      I3 => yx296GAT_122xx134_67,
      O => outputVector(1)
    );
  yx421GAT_188xx411 : LUT5
    generic map(
      INIT => X"4F4FFF4F"
    )
    port map (
      I0 => yx199GAT_81xx,
      I1 => inputVector(0),
      I2 => inputVector(1),
      I3 => inputVector(2),
      I4 => yx296GAT_122xx,
      O => N131
    );
  yx357GAT_161xx211 : LUT6
    generic map(
      INIT => X"FFFFAAFAECFC2838"
    )
    port map (
      I0 => yx357GAT_161xx109_76,
      I1 => inputVector(6),
      I2 => yx296GAT_122xx,
      I3 => inputVector(2),
      I4 => N311,
      I5 => yx357GAT_161xx117_77,
      O => yx357GAT_161xx211_78
    );
  yx357GAT_161xx86 : LUT5
    generic map(
      INIT => X"F5FA6462"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(22),
      I2 => N42,
      I3 => inputVector(18),
      I4 => N141,
      O => yx357GAT_161xx86_83
    );
  yx357GAT_161xx322 : LUT5
    generic map(
      INIT => X"F5FA6462"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(30),
      I2 => N44,
      I3 => inputVector(26),
      I4 => N161,
      O => yx357GAT_161xx322_79
    );
  yx421GAT_188xx161_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFA3A2A2A2"
    )
    port map (
      I0 => yx421GAT_188xx61_100,
      I1 => inputVector(35),
      I2 => yx357GAT_161xx,
      I3 => inputVector(4),
      I4 => N17,
      I5 => yx421GAT_188xx126_99,
      O => N52
    );
  yx421GAT_188xx126 : LUT6
    generic map(
      INIT => X"000A0003000A0002"
    )
    port map (
      I0 => N131,
      I1 => inputVector(35),
      I2 => inputVector(31),
      I3 => inputVector(34),
      I4 => yx357GAT_161xx,
      I5 => inputVector(4),
      O => yx421GAT_188xx126_99
    );
  yx357GAT_161xx361 : LUT6
    generic map(
      INIT => X"FFFF6FF6FFFFFFFF"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(34),
      I2 => yx199GAT_81xx,
      I3 => inputVector(31),
      I4 => inputVector(35),
      I5 => inputVector(33),
      O => yx357GAT_161xx361_80
    );
  yx357GAT_161xx86_SW0 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(15),
      I2 => yx199GAT_81xx,
      I3 => inputVector(20),
      O => N42
    );
  yx357GAT_161xx322_SW0 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(25),
      I1 => inputVector(23),
      I2 => yx199GAT_81xx,
      I3 => inputVector(28),
      O => N44
    );
  yx296GAT_122xx134 : LUT5
    generic map(
      INIT => X"AAAA2AA2"
    )
    port map (
      I0 => N48,
      I1 => inputVector(21),
      I2 => yx199GAT_81xx,
      I3 => inputVector(19),
      I4 => inputVector(22),
      O => yx296GAT_122xx134_67
    );
  SF241 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(29),
      I1 => inputVector(27),
      I2 => yx199GAT_81xx,
      I3 => inputVector(32),
      O => N161
    );
  SF141 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(21),
      I1 => inputVector(19),
      I2 => yx199GAT_81xx,
      I3 => inputVector(24),
      O => N141
    );
  yx223GAT_84xx1 : LUT6
    generic map(
      INIT => X"FFFFFFFFAEFFAEAE"
    )
    port map (
      I0 => N46,
      I1 => inputVector(1),
      I2 => inputVector(0),
      I3 => inputVector(11),
      I4 => inputVector(13),
      I5 => yx174GAT_62xx_and0000,
      O => outputVector(0)
    );
  yx370GAT_163xx1 : LUT6
    generic map(
      INIT => X"7F7F7FFFFFFFFFFF"
    )
    port map (
      I0 => yx357GAT_161xx211_78,
      I1 => yx357GAT_161xx322_79,
      I2 => yx357GAT_161xx86_83,
      I3 => yx357GAT_161xx439_82,
      I4 => yx357GAT_161xx411_81,
      I5 => yx357GAT_161xx361_80,
      O => outputVector(2)
    );
  yx357GAT_161xx161 : LUT5
    generic map(
      INIT => X"4CCCCCCC"
    )
    port map (
      I0 => yx296GAT_122xx24_70,
      I1 => inputVector(2),
      I2 => yx296GAT_122xx45,
      I3 => yx296GAT_122xx93_74,
      I4 => yx296GAT_122xx134_67,
      O => N311
    );
  SF031 : LUT5
    generic map(
      INIT => X"8000FFFF"
    )
    port map (
      I0 => yx296GAT_122xx134_67,
      I1 => yx296GAT_122xx24_70,
      I2 => yx296GAT_122xx45,
      I3 => yx296GAT_122xx93_74,
      I4 => inputVector(14),
      O => N22
    );
  SF231 : LUT5
    generic map(
      INIT => X"8000FFFF"
    )
    port map (
      I0 => yx296GAT_122xx134_67,
      I1 => yx296GAT_122xx24_70,
      I2 => yx296GAT_122xx45,
      I3 => yx296GAT_122xx93_74,
      I4 => inputVector(30),
      O => N23
    );
  yx421GAT_188xx61_SW0 : LUT6
    generic map(
      INIT => X"FFFF7FFFFFFFFFFF"
    )
    port map (
      I0 => inputVector(0),
      I1 => yx296GAT_122xx24_70,
      I2 => yx296GAT_122xx45,
      I3 => yx296GAT_122xx93_74,
      I4 => inputVector(31),
      I5 => yx296GAT_122xx134_67,
      O => N50
    );
  yx199GAT_81xx44 : LUT6
    generic map(
      INIT => X"88AA080ACCFF0C0F"
    )
    port map (
      I0 => inputVector(15),
      I1 => inputVector(19),
      I2 => inputVector(33),
      I3 => inputVector(21),
      I4 => inputVector(31),
      I5 => inputVector(17),
      O => yx199GAT_81xx44_64
    );
  yx296GAT_122xx24_SW0 : LUT6
    generic map(
      INIT => X"EEEEEEEEEAEEEAEA"
    )
    port map (
      I0 => inputVector(14),
      I1 => inputVector(11),
      I2 => N46,
      I3 => inputVector(0),
      I4 => inputVector(1),
      I5 => yx174GAT_62xx_and0000,
      O => N54
    );
  yx296GAT_122xx24 : LUT6
    generic map(
      INIT => X"AAAAFFFF2AA23FF3"
    )
    port map (
      I0 => N54,
      I1 => inputVector(25),
      I2 => inputVector(23),
      I3 => yx199GAT_81xx,
      I4 => inputVector(13),
      I5 => inputVector(26),
      O => yx296GAT_122xx24_70
    );
  yx296GAT_122xx93_SW0 : LUT6
    generic map(
      INIT => X"EEEEEEEEEAEEEAEA"
    )
    port map (
      I0 => inputVector(2),
      I1 => inputVector(0),
      I2 => N46,
      I3 => inputVector(11),
      I4 => inputVector(13),
      I5 => yx174GAT_62xx_and0000,
      O => N56
    );
  yx296GAT_122xx93 : LUT6
    generic map(
      INIT => X"AAAAFFFF2AA23FF3"
    )
    port map (
      I0 => N56,
      I1 => inputVector(17),
      I2 => yx199GAT_81xx,
      I3 => inputVector(15),
      I4 => inputVector(1),
      I5 => inputVector(18),
      O => yx296GAT_122xx93_74
    );
  SF131 : LUT5
    generic map(
      INIT => X"8000FFFF"
    )
    port map (
      I0 => yx296GAT_122xx93_74,
      I1 => N48,
      I2 => yx296GAT_122xx24_70,
      I3 => yx296GAT_122xx45,
      I4 => inputVector(22),
      O => N21
    );
  yx432GAT_195xx1 : LUT5
    generic map(
      INIT => X"F4F5F4F4"
    )
    port map (
      I0 => yx386GAT_179xx_and0000,
      I1 => yx393GAT_178xx_and0000,
      I2 => yx381GAT_180xx_and0000,
      I3 => yx399GAT_177xx_and0000,
      I4 => yx418GAT_185xx,
      O => yx432GAT_195xx
    );
  yx432GAT_195xx2 : LUT6
    generic map(
      INIT => X"FFFFFFFF54555454"
    )
    port map (
      I0 => yx386GAT_179xx_and0000,
      I1 => yx393GAT_178xx_and0000,
      I2 => yx411GAT_174xx_and0000,
      I3 => yx399GAT_177xx_and0000,
      I4 => yx418GAT_185xx,
      I5 => yx381GAT_180xx_and0000,
      O => yx432GAT_195xx1_103
    );
  yx432GAT_195xx_f7 : MUXF7
    port map (
      I0 => yx432GAT_195xx1_103,
      I1 => yx432GAT_195xx,
      S => yx419GAT_184xx,
      O => outputVector(6)
    );
  yx407GAT_175xx_and00001 : LUT5
    generic map(
      INIT => X"A0F02030"
    )
    port map (
      I0 => yx199GAT_81xx,
      I1 => inputVector(26),
      I2 => inputVector(25),
      I3 => inputVector(23),
      I4 => yx296GAT_122xx,
      O => yx407GAT_175xx_and0000
    );
  yx407GAT_175xx_and00002 : LUT6
    generic map(
      INIT => X"08080C0C0008000C"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(25),
      I2 => inputVector(28),
      I3 => inputVector(23),
      I4 => inputVector(26),
      I5 => yx199GAT_81xx,
      O => yx407GAT_175xx_and00001_95
    );
  yx407GAT_175xx_and0000_f7 : MUXF7
    port map (
      I0 => yx407GAT_175xx_and00001_95,
      I1 => yx407GAT_175xx_and0000,
      S => yx357GAT_161xx,
      O => yx419GAT_184xx
    );
  yx399GAT_177xx_and00001 : LUT5
    generic map(
      INIT => X"A0F02030"
    )
    port map (
      I0 => yx199GAT_81xx,
      I1 => inputVector(18),
      I2 => inputVector(17),
      I3 => inputVector(15),
      I4 => yx296GAT_122xx,
      O => yx399GAT_177xx_and00001_92
    );
  yx399GAT_177xx_and00002 : LUT6
    generic map(
      INIT => X"08080C0C0008000C"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(17),
      I2 => inputVector(20),
      I3 => inputVector(15),
      I4 => inputVector(18),
      I5 => yx199GAT_81xx,
      O => yx399GAT_177xx_and00002_93
    );
  yx399GAT_177xx_and0000_f7 : MUXF7
    port map (
      I0 => yx399GAT_177xx_and00002_93,
      I1 => yx399GAT_177xx_and00001_92,
      S => yx357GAT_161xx,
      O => yx399GAT_177xx_and0000
    );
  yx386GAT_179xx_and00001 : LUT5
    generic map(
      INIT => X"A0F02030"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(7),
      I2 => inputVector(9),
      I3 => inputVector(10),
      I4 => yx199GAT_81xx,
      O => yx386GAT_179xx_and00001_88
    );
  yx386GAT_179xx_and00002 : LUT6
    generic map(
      INIT => X"08080C0C0008000C"
    )
    port map (
      I0 => yx199GAT_81xx,
      I1 => inputVector(9),
      I2 => inputVector(12),
      I3 => inputVector(10),
      I4 => inputVector(7),
      I5 => yx296GAT_122xx,
      O => yx386GAT_179xx_and00002_89
    );
  yx386GAT_179xx_and0000_f7 : MUXF7
    port map (
      I0 => yx386GAT_179xx_and00002_89,
      I1 => yx386GAT_179xx_and00001_88,
      S => yx357GAT_161xx,
      O => yx386GAT_179xx_and0000
    );
  yx381GAT_180xx_and00001 : LUT5
    generic map(
      INIT => X"A0F02030"
    )
    port map (
      I0 => yx199GAT_81xx,
      I1 => inputVector(6),
      I2 => inputVector(5),
      I3 => inputVector(3),
      I4 => yx296GAT_122xx,
      O => yx381GAT_180xx_and00001_85
    );
  yx381GAT_180xx_and00002 : LUT6
    generic map(
      INIT => X"08080C0C0008000C"
    )
    port map (
      I0 => yx296GAT_122xx,
      I1 => inputVector(5),
      I2 => inputVector(8),
      I3 => inputVector(3),
      I4 => inputVector(6),
      I5 => yx199GAT_81xx,
      O => yx381GAT_180xx_and00002_86
    );
  yx381GAT_180xx_and0000_f7 : MUXF7
    port map (
      I0 => yx381GAT_180xx_and00002_86,
      I1 => yx381GAT_180xx_and00001_85,
      S => yx357GAT_161xx,
      O => yx381GAT_180xx_and0000
    );
  yx296GAT_122xx134_SW01 : LUT6
    generic map(
      INIT => X"AAAAFFFF2AA23FF3"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(5),
      I2 => inputVector(3),
      I3 => yx199GAT_81xx,
      I4 => inputVector(9),
      I5 => inputVector(6),
      O => yx296GAT_122xx134_SW0
    );
  yx296GAT_122xx134_SW02 : LUT4
    generic map(
      INIT => X"FF7D"
    )
    port map (
      I0 => inputVector(5),
      I1 => inputVector(3),
      I2 => yx199GAT_81xx,
      I3 => inputVector(6),
      O => yx296GAT_122xx134_SW01_69
    );
  yx296GAT_122xx134_SW0_f7 : MUXF7
    port map (
      I0 => yx296GAT_122xx134_SW01_69,
      I1 => yx296GAT_122xx134_SW0,
      S => yx230GAT_97xx,
      O => N48
    );
  yx296GAT_122xx451 : LUT6
    generic map(
      INIT => X"AAFF8ACFFFFFCFCF"
    )
    port map (
      I0 => inputVector(34),
      I1 => yx177GAT_59xx_and0000,
      I2 => inputVector(29),
      I3 => inputVector(33),
      I4 => inputVector(30),
      I5 => inputVector(31),
      O => yx296GAT_122xx451_72
    );
  yx296GAT_122xx452 : LUT6
    generic map(
      INIT => X"AAFF8ACFFFFFCFCF"
    )
    port map (
      I0 => inputVector(30),
      I1 => inputVector(34),
      I2 => inputVector(33),
      I3 => yx177GAT_59xx_and0000,
      I4 => inputVector(31),
      I5 => inputVector(29),
      O => yx296GAT_122xx452_73
    );
  yx296GAT_122xx45_f7 : MUXF7
    port map (
      I0 => yx296GAT_122xx452_73,
      I1 => yx296GAT_122xx451_72,
      S => yx199GAT_81xx,
      O => yx296GAT_122xx45
    );

end Structure;

