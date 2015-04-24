--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: comb_benches_blif_C1908_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 18:14:35 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm comb_benches_blif_C1908 -w -dir netgen/synthesis -ofmt vhdl -sim comb_benches_blif_C1908.ngc comb_benches_blif_C1908_synthesis.vhd 
-- Device	: xc5vlx110t-1-ff1136
-- Input file	: comb_benches_blif_C1908.ngc
-- Output file	: D:\ISE Projects\experiences\netgen\synthesis\comb_benches_blif_C1908_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: comb_benches_blif_C1908
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

entity comb_benches_blif_C1908 is
  port (
    outputVector : out STD_LOGIC_VECTOR ( 24 downto 0 ); 
    inputVector : in STD_LOGIC_VECTOR ( 32 downto 0 ) 
  );
end comb_benches_blif_C1908;

architecture Structure of comb_benches_blif_C1908 is
  signal N20 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal yx1184_370xx : STD_LOGIC; 
  signal yx1193_566xx : STD_LOGIC; 
  signal yx1365_603xx : STD_LOGIC; 
  signal yx1368_648xx : STD_LOGIC; 
  signal yx1409_622xx : STD_LOGIC; 
  signal yx1557_764xx : STD_LOGIC; 
  signal yx1565_765xx_76 : STD_LOGIC; 
  signal yx1573_774xx_77 : STD_LOGIC; 
  signal yx1621_780xx : STD_LOGIC; 
  signal yx1733_488xx : STD_LOGIC; 
  signal yx1765_500xx : STD_LOGIC; 
  signal yx1777_461xx : STD_LOGIC; 
  signal yx1804_466xx : STD_LOGIC; 
  signal yx1825_445xx_and0000 : STD_LOGIC; 
  signal yx369_117xx : STD_LOGIC; 
  signal yx379_575xx_and0000 : STD_LOGIC; 
  signal yx393_548xx_and0000 : STD_LOGIC; 
  signal yx422_680xx_and0000 : STD_LOGIC; 
  signal yx482_202xx_and0000 : STD_LOGIC; 
  signal yx487_197xx_and0000 : STD_LOGIC; 
  signal yx503_731xx : STD_LOGIC; 
  signal yx510_673xx_and0000 : STD_LOGIC; 
  signal yx522_719xx_and0000 : STD_LOGIC; 
  signal yx540_717xx : STD_LOGIC; 
  signal yx564_654xx : STD_LOGIC; 
  signal yx573_738xx : STD_LOGIC; 
  signal yx57_912xx1 : STD_LOGIC; 
  signal yx57_912xx11_97 : STD_LOGIC; 
  signal yx639_724xx : STD_LOGIC; 
  signal yx696_726xx : STD_LOGIC; 
  signal yx710_728xx : STD_LOGIC; 
  signal yx725_665xx : STD_LOGIC; 
  signal yx746_678xx : STD_LOGIC; 
  signal yx756_677xx : STD_LOGIC; 
  signal yx75_866xx0_104 : STD_LOGIC; 
  signal yx75_866xx158_105 : STD_LOGIC; 
  signal yx75_866xx161_106 : STD_LOGIC; 
  signal yx75_866xx193_107 : STD_LOGIC; 
  signal yx75_866xx38_108 : STD_LOGIC; 
  signal yx75_866xx5_109 : STD_LOGIC; 
  signal yx75_866xx81_110 : STD_LOGIC; 
  signal yx863_783xx : STD_LOGIC; 
  signal yx863_783xx12 : STD_LOGIC; 
  signal yx863_783xx121_113 : STD_LOGIC; 
  signal yx863_783xx31_114 : STD_LOGIC; 
  signal yx865_793xx : STD_LOGIC; 
  signal yx865_793xx111_116 : STD_LOGIC; 
  signal yx865_793xx32_117 : STD_LOGIC; 
  signal yx865_793xx67_118 : STD_LOGIC; 
  signal yx865_793xx84_119 : STD_LOGIC; 
  signal yx969_266xx_and0000 : STD_LOGIC; 
begin
  yx45_851xx1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => yx1621_780xx,
      I1 => inputVector(14),
      O => outputVector(5)
    );
  yx969_266xx_and00001 : LUT6
    generic map(
      INIT => X"FFFFD1DDD1DDD1DD"
    )
    port map (
      I0 => inputVector(31),
      I1 => inputVector(32),
      I2 => inputVector(29),
      I3 => inputVector(30),
      I4 => inputVector(22),
      I5 => inputVector(23),
      O => yx969_266xx_and0000
    );
  yx9_863xx1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(2),
      I1 => N38,
      I2 => yx510_673xx_and0000,
      I3 => yx540_717xx,
      I4 => yx639_724xx,
      I5 => yx746_678xx,
      O => outputVector(2)
    );
  yx6_864xx1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(1),
      I1 => N38,
      I2 => yx510_673xx_and0000,
      I3 => yx540_717xx,
      I4 => yx639_724xx,
      I5 => yx756_677xx,
      O => outputVector(1)
    );
  yx48_850xx1 : LUT6
    generic map(
      INIT => X"AAA9AAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(15),
      I1 => N39,
      I2 => yx482_202xx_and0000,
      I3 => yx503_731xx,
      I4 => yx710_728xx,
      I5 => yx756_677xx,
      O => outputVector(6)
    );
  yx42_852xx1 : LUT6
    generic map(
      INIT => X"A9AAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(13),
      I1 => N39,
      I2 => yx510_673xx_and0000,
      I3 => yx540_717xx,
      I4 => yx573_738xx,
      I5 => yx756_677xx,
      O => outputVector(15)
    );
  yx30_856xx1 : LUT6
    generic map(
      INIT => X"AAA9AAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(9),
      I1 => N39,
      I2 => yx482_202xx_and0000,
      I3 => yx503_731xx,
      I4 => yx710_728xx,
      I5 => yx746_678xx,
      O => outputVector(4)
    );
  yx18_860xx1 : LUT6
    generic map(
      INIT => X"A9AAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(5),
      I1 => N38,
      I2 => yx487_197xx_and0000,
      I3 => yx522_719xx_and0000,
      I4 => yx696_726xx,
      I5 => yx746_678xx,
      O => outputVector(8)
    );
  yx15_861xx1 : LUT6
    generic map(
      INIT => X"A9AAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(4),
      I1 => N38,
      I2 => yx487_197xx_and0000,
      I3 => yx522_719xx_and0000,
      I4 => yx696_726xx,
      I5 => yx756_677xx,
      O => outputVector(7)
    );
  yx12_862xx1 : LUT6
    generic map(
      INIT => X"AAA9AAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(3),
      I1 => N20,
      I2 => N38,
      I3 => yx510_673xx_and0000,
      I4 => yx540_717xx,
      I5 => yx639_724xx,
      O => outputVector(3)
    );
  yx27_857xx1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => yx1573_774xx_77,
      I1 => inputVector(8),
      O => outputVector(11)
    );
  yx24_858xx1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => yx1565_765xx_76,
      I1 => inputVector(7),
      O => outputVector(10)
    );
  yx487_197xx_and00001 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => inputVector(19),
      I1 => inputVector(22),
      I2 => inputVector(30),
      O => yx487_197xx_and0000
    );
  yx482_202xx_and00001 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(23),
      I2 => inputVector(30),
      O => yx482_202xx_and0000
    );
  yx369_117xx1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => inputVector(16),
      I1 => inputVector(23),
      I2 => inputVector(32),
      O => yx369_117xx
    );
  yx1621_780xx1 : LUT6
    generic map(
      INIT => X"0000000000000002"
    )
    port map (
      I0 => yx696_726xx,
      I1 => N39,
      I2 => yx564_654xx,
      I3 => yx725_665xx,
      I4 => yx482_202xx_and0000,
      I5 => yx503_731xx,
      O => yx1621_780xx
    );
  yx564_654xx1 : LUT3
    generic map(
      INIT => X"56"
    )
    port map (
      I0 => inputVector(27),
      I1 => inputVector(30),
      I2 => yx393_548xx_and0000,
      O => yx564_654xx
    );
  yx262_458xx_and00001 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(1),
      I2 => inputVector(2),
      O => yx1765_500xx
    );
  yx401_583xx_and000011 : LUT4
    generic map(
      INIT => X"9AAA"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(32),
      I2 => inputVector(22),
      I3 => inputVector(19),
      O => N7
    );
  yx1777_461xx1 : LUT4
    generic map(
      INIT => X"D22D"
    )
    port map (
      I0 => inputVector(21),
      I1 => inputVector(32),
      I2 => inputVector(13),
      I3 => inputVector(3),
      O => yx1777_461xx
    );
  yx503_731xx1 : LUT5
    generic map(
      INIT => X"556955C3"
    )
    port map (
      I0 => inputVector(16),
      I1 => yx1365_603xx,
      I2 => yx1368_648xx,
      I3 => inputVector(30),
      I4 => inputVector(23),
      O => yx503_731xx
    );
  yx393_548xx_and00001 : LUT5
    generic map(
      INIT => X"F70808F7"
    )
    port map (
      I0 => inputVector(18),
      I1 => inputVector(22),
      I2 => inputVector(32),
      I3 => inputVector(2),
      I4 => N37,
      O => yx393_548xx_and0000
    );
  yx1295_483xx_and000031 : LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => inputVector(11),
      I1 => inputVector(14),
      I2 => inputVector(5),
      I3 => inputVector(7),
      I4 => inputVector(9),
      O => N37
    );
  yx1565_765xx : LUT6
    generic map(
      INIT => X"0000000000000040"
    )
    port map (
      I0 => yx725_665xx,
      I1 => yx540_717xx,
      I2 => yx510_673xx_and0000,
      I3 => N38,
      I4 => yx564_654xx,
      I5 => N64,
      O => yx1565_765xx_76
    );
  yx1573_774xx : LUT6
    generic map(
      INIT => X"0000000000000800"
    )
    port map (
      I0 => yx756_677xx,
      I1 => yx540_717xx,
      I2 => yx510_673xx_and0000,
      I3 => yx522_719xx_and0000,
      I4 => yx969_266xx_and0000,
      I5 => N66,
      O => yx1573_774xx_77
    );
  yx69_908xx1 : LUT5
    generic map(
      INIT => X"D287FAAF"
    )
    port map (
      I0 => inputVector(32),
      I1 => inputVector(20),
      I2 => yx1368_648xx,
      I3 => yx863_783xx,
      I4 => inputVector(28),
      O => outputVector(22)
    );
  yx72_909xx1 : LUT6
    generic map(
      INIT => X"3C9669C3BEBEEBEB"
    )
    port map (
      I0 => inputVector(32),
      I1 => yx1193_566xx,
      I2 => yx1184_370xx,
      I3 => inputVector(21),
      I4 => yx865_793xx,
      I5 => inputVector(29),
      O => outputVector(23)
    );
  yx1804_466xx1 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(11),
      I2 => inputVector(12),
      O => yx1804_466xx
    );
  yx1733_488xx1 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => inputVector(14),
      I1 => inputVector(15),
      I2 => inputVector(9),
      O => yx1733_488xx
    );
  yx510_673xx_and00001 : LUT4
    generic map(
      INIT => X"5C56"
    )
    port map (
      I0 => inputVector(18),
      I1 => yx1409_622xx,
      I2 => inputVector(30),
      I3 => inputVector(22),
      O => yx510_673xx_and0000
    );
  yx540_717xx1 : LUT5
    generic map(
      INIT => X"56656556"
    )
    port map (
      I0 => inputVector(25),
      I1 => inputVector(30),
      I2 => inputVector(0),
      I3 => N21,
      I4 => yx369_117xx,
      O => yx540_717xx
    );
  yx1020_844xx11 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => inputVector(30),
      I1 => yx863_783xx,
      I2 => yx865_793xx,
      O => N59
    );
  yx865_793xx149 : LUT6
    generic map(
      INIT => X"0303030303020202"
    )
    port map (
      I0 => yx865_793xx32_117,
      I1 => yx1621_780xx,
      I2 => yx1573_774xx_77,
      I3 => yx865_793xx84_119,
      I4 => yx865_793xx111_116,
      I5 => yx865_793xx67_118,
      O => yx865_793xx
    );
  yx1184_370xx1 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => inputVector(8),
      I1 => inputVector(13),
      O => yx1184_370xx
    );
  yx379_575xx_and00002 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(1),
      I1 => inputVector(4),
      I2 => inputVector(7),
      I3 => N41,
      O => yx379_575xx_and0000
    );
  yx379_575xx_and000011 : LUT6
    generic map(
      INIT => X"9966966999669966"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(14),
      I2 => inputVector(23),
      I3 => yx1825_445xx_and0000,
      I4 => inputVector(32),
      I5 => inputVector(17),
      O => N41
    );
  yx75_866xx38 : LUT6
    generic map(
      INIT => X"FFFFFFFF80000000"
    )
    port map (
      I0 => yx725_665xx,
      I1 => yx540_717xx,
      I2 => yx510_673xx_and0000,
      I3 => yx75_866xx0_104,
      I4 => yx75_866xx5_109,
      I5 => inputVector(32),
      O => yx75_866xx38_108
    );
  yx75_866xx251 : LUT5
    generic map(
      INIT => X"FFFF8CCC"
    )
    port map (
      I0 => yx75_866xx193_107,
      I1 => inputVector(31),
      I2 => yx865_793xx,
      I3 => yx863_783xx,
      I4 => yx75_866xx38_108,
      O => outputVector(16)
    );
  yx75_866xx193_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => yx510_673xx_and0000,
      I1 => yx522_719xx_and0000,
      I2 => yx540_717xx,
      I3 => yx75_866xx81_110,
      O => N68
    );
  yx75_866xx193 : LUT6
    generic map(
      INIT => X"40C055FF40C040C0"
    )
    port map (
      I0 => inputVector(22),
      I1 => yx75_866xx158_105,
      I2 => yx75_866xx161_106,
      I3 => inputVector(23),
      I4 => yx487_197xx_and0000,
      I5 => N68,
      O => yx75_866xx193_107
    );
  yx865_793xx32 : LUT5
    generic map(
      INIT => X"FFFF1999"
    )
    port map (
      I0 => yx564_654xx,
      I1 => yx725_665xx,
      I2 => yx710_728xx,
      I3 => yx573_738xx,
      I4 => N39,
      O => yx865_793xx32_117
    );
  yx865_793xx67 : LUT5
    generic map(
      INIT => X"22133333"
    )
    port map (
      I0 => yx540_717xx,
      I1 => yx710_728xx,
      I2 => yx756_677xx,
      I3 => yx510_673xx_and0000,
      I4 => yx573_738xx,
      O => yx865_793xx67_118
    );
  yx863_783xx31 : LUT6
    generic map(
      INIT => X"FFFFFFFF545554F5"
    )
    port map (
      I0 => yx510_673xx_and0000,
      I1 => yx487_197xx_and0000,
      I2 => yx522_719xx_and0000,
      I3 => yx540_717xx,
      I4 => N20,
      I5 => N38,
      O => yx863_783xx31_114
    );
  yx3_865xx1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(0),
      I1 => N38,
      I2 => yx696_726xx,
      I3 => yx639_724xx,
      I4 => yx725_665xx,
      I5 => yx564_654xx,
      O => outputVector(0)
    );
  yx39_853xx1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(12),
      I1 => N39,
      I2 => yx710_728xx,
      I3 => yx573_738xx,
      I4 => yx725_665xx,
      I5 => yx564_654xx,
      O => outputVector(14)
    );
  yx36_854xx1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(11),
      I1 => yx969_266xx_and0000,
      I2 => yx746_678xx,
      I3 => yx696_726xx,
      I4 => yx573_738xx,
      I5 => yx639_724xx,
      O => outputVector(13)
    );
  yx33_855xx1 : LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(10),
      I1 => yx969_266xx_and0000,
      I2 => yx756_677xx,
      I3 => yx696_726xx,
      I4 => yx573_738xx,
      I5 => yx639_724xx,
      O => outputVector(12)
    );
  yx21_859xx1 : LUT6
    generic map(
      INIT => X"AAA9AAAAAAAAAAAA"
    )
    port map (
      I0 => inputVector(6),
      I1 => yx487_197xx_and0000,
      I2 => N38,
      I3 => N20,
      I4 => yx522_719xx_and0000,
      I5 => yx710_728xx,
      O => outputVector(9)
    );
  yx522_719xx_and00001 : LUT6
    generic map(
      INIT => X"5555555596696996"
    )
    port map (
      I0 => inputVector(24),
      I1 => yx1765_500xx,
      I2 => yx1733_488xx,
      I3 => yx1804_466xx,
      I4 => yx1777_461xx,
      I5 => inputVector(30),
      O => yx522_719xx_and0000
    );
  yx326_582xx_and00001 : LUT6
    generic map(
      INIT => X"D22D2DD22DD2D22D"
    )
    port map (
      I0 => inputVector(20),
      I1 => inputVector(32),
      I2 => inputVector(8),
      I3 => inputVector(14),
      I4 => inputVector(15),
      I5 => inputVector(9),
      O => yx1365_603xx
    );
  yx1368_648xx1 : LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => inputVector(3),
      I1 => inputVector(7),
      I2 => inputVector(4),
      I3 => inputVector(5),
      I4 => inputVector(6),
      I5 => yx1765_500xx,
      O => yx1368_648xx
    );
  yx1565_765xx_SW0 : LUT4
    generic map(
      INIT => X"CF4F"
    )
    port map (
      I0 => inputVector(22),
      I1 => inputVector(19),
      I2 => yx522_719xx_and0000,
      I3 => inputVector(30),
      O => N64
    );
  yx710_728xx1 : LUT5
    generic map(
      INIT => X"00AA0039"
    )
    port map (
      I0 => inputVector(18),
      I1 => yx1409_622xx,
      I2 => inputVector(22),
      I3 => yx540_717xx,
      I4 => inputVector(30),
      O => yx710_728xx
    );
  yx441_675xx_and000011 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(5),
      I2 => inputVector(6),
      I3 => yx1193_566xx,
      O => N21
    );
  yx401_583xx_and00001 : LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => inputVector(3),
      I1 => inputVector(6),
      I2 => inputVector(9),
      I3 => N7,
      I4 => yx1184_370xx,
      I5 => inputVector(15),
      O => yx1409_622xx
    );
  yx66_903xx1 : LUT5
    generic map(
      INIT => X"C3413311"
    )
    port map (
      I0 => inputVector(32),
      I1 => yx1409_622xx,
      I2 => inputVector(18),
      I3 => inputVector(31),
      I4 => N59,
      O => outputVector(21)
    );
  yx63_902xx1 : LUT5
    generic map(
      INIT => X"C3413311"
    )
    port map (
      I0 => inputVector(32),
      I1 => yx393_548xx_and0000,
      I2 => inputVector(27),
      I3 => inputVector(31),
      I4 => N59,
      O => outputVector(20)
    );
  yx60_901xx1 : LUT5
    generic map(
      INIT => X"C3413311"
    )
    port map (
      I0 => inputVector(32),
      I1 => yx379_575xx_and0000,
      I2 => inputVector(26),
      I3 => inputVector(31),
      I4 => N59,
      O => outputVector(19)
    );
  yx54_900xx1 : LUT5
    generic map(
      INIT => X"C3413311"
    )
    port map (
      I0 => inputVector(32),
      I1 => yx422_680xx_and0000,
      I2 => inputVector(24),
      I3 => inputVector(31),
      I4 => N59,
      O => outputVector(18)
    );
  yx51_899xx1 : LUT6
    generic map(
      INIT => X"C33C41140FF00550"
    )
    port map (
      I0 => inputVector(32),
      I1 => N59,
      I2 => yx1368_648xx,
      I3 => yx1365_603xx,
      I4 => inputVector(31),
      I5 => inputVector(16),
      O => outputVector(17)
    );
  yx75_866xx0 : LUT6
    generic map(
      INIT => X"550069005500C300"
    )
    port map (
      I0 => inputVector(16),
      I1 => yx1365_603xx,
      I2 => yx1368_648xx,
      I3 => yx564_654xx,
      I4 => inputVector(30),
      I5 => inputVector(23),
      O => yx75_866xx0_104
    );
  yx75_866xx158 : LUT6
    generic map(
      INIT => X"D22020000FF0F000"
    )
    port map (
      I0 => inputVector(22),
      I1 => inputVector(30),
      I2 => yx522_719xx_and0000,
      I3 => yx510_673xx_and0000,
      I4 => yx540_717xx,
      I5 => inputVector(19),
      O => yx75_866xx158_105
    );
  yx863_783xx117 : LUT6
    generic map(
      INIT => X"0303030303020100"
    )
    port map (
      I0 => yx510_673xx_and0000,
      I1 => yx1557_764xx,
      I2 => yx1565_765xx_76,
      I3 => N20,
      I4 => N70,
      I5 => yx863_783xx31_114,
      O => yx863_783xx
    );
  yx865_793xx84 : LUT6
    generic map(
      INIT => X"AFBEBEAFBF8C8CBF"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(30),
      I2 => inputVector(16),
      I3 => yx1365_603xx,
      I4 => yx1368_648xx,
      I5 => inputVector(23),
      O => yx865_793xx84_119
    );
  yx746_678xx1 : LUT5
    generic map(
      INIT => X"0A0A0990"
    )
    port map (
      I0 => inputVector(27),
      I1 => yx393_548xx_and0000,
      I2 => inputVector(26),
      I3 => yx379_575xx_and0000,
      I4 => inputVector(30),
      O => yx746_678xx
    );
  yx1573_774xx_SW0 : LUT6
    generic map(
      INIT => X"FFFFF8C8FFFFFAEA"
    )
    port map (
      I0 => inputVector(19),
      I1 => inputVector(30),
      I2 => inputVector(17),
      I3 => inputVector(23),
      I4 => yx503_731xx,
      I5 => inputVector(22),
      O => N66
    );
  yx756_677xx1 : LUT5
    generic map(
      INIT => X"0A0A0990"
    )
    port map (
      I0 => inputVector(26),
      I1 => yx379_575xx_and0000,
      I2 => inputVector(27),
      I3 => yx393_548xx_and0000,
      I4 => inputVector(30),
      O => yx756_677xx
    );
  yx75_866xx161 : LUT6
    generic map(
      INIT => X"0050005000606000"
    )
    port map (
      I0 => inputVector(27),
      I1 => yx393_548xx_and0000,
      I2 => yx573_738xx,
      I3 => inputVector(26),
      I4 => yx379_575xx_and0000,
      I5 => inputVector(30),
      O => yx75_866xx161_106
    );
  yx422_680xx_and00001 : LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => yx1777_461xx,
      I1 => inputVector(10),
      I2 => inputVector(11),
      I3 => inputVector(12),
      I4 => yx1733_488xx,
      I5 => yx1765_500xx,
      O => yx422_680xx_and0000
    );
  yx1557_764xx1 : LUT6
    generic map(
      INIT => X"0000000000008000"
    )
    port map (
      I0 => yx564_654xx,
      I1 => yx522_719xx_and0000,
      I2 => yx725_665xx,
      I3 => yx710_728xx,
      I4 => N38,
      I5 => yx487_197xx_and0000,
      O => yx1557_764xx
    );
  yx1825_445xx_and00001 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => inputVector(8),
      I1 => inputVector(13),
      I2 => inputVector(15),
      O => yx1825_445xx_and0000
    );
  yx75_866xx81 : LUT6
    generic map(
      INIT => X"50F560F600500060"
    )
    port map (
      I0 => inputVector(26),
      I1 => yx379_575xx_and0000,
      I2 => yx564_654xx,
      I3 => yx482_202xx_and0000,
      I4 => inputVector(30),
      I5 => yx503_731xx,
      O => yx75_866xx81_110
    );
  yx1193_566xx1 : LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => inputVector(14),
      I1 => inputVector(15),
      I2 => inputVector(9),
      I3 => inputVector(10),
      I4 => inputVector(11),
      I5 => inputVector(12),
      O => yx1193_566xx
    );
  yx863_783xx117_SW0 : LUT5
    generic map(
      INIT => X"FFABEBBF"
    )
    port map (
      I0 => yx487_197xx_and0000,
      I1 => yx564_654xx,
      I2 => yx725_665xx,
      I3 => yx540_717xx,
      I4 => yx522_719xx_and0000,
      O => N70
    );
  yx573_738xx1 : LUT6
    generic map(
      INIT => X"100110011441FAAF"
    )
    port map (
      I0 => inputVector(30),
      I1 => inputVector(23),
      I2 => yx1368_648xx,
      I3 => yx1365_603xx,
      I4 => inputVector(16),
      I5 => inputVector(17),
      O => yx573_738xx
    );
  yx75_866xx5 : LUT6
    generic map(
      INIT => X"02000A0022222A2A"
    )
    port map (
      I0 => yx522_719xx_and0000,
      I1 => inputVector(17),
      I2 => inputVector(30),
      I3 => inputVector(22),
      I4 => inputVector(23),
      I5 => inputVector(19),
      O => yx75_866xx5_109
    );
  yx639_724xx1 : LUT4
    generic map(
      INIT => X"1131"
    )
    port map (
      I0 => inputVector(19),
      I1 => yx522_719xx_and0000,
      I2 => inputVector(22),
      I3 => inputVector(30),
      O => yx639_724xx
    );
  yx696_726xx1 : LUT6
    generic map(
      INIT => X"A09090A090A0A090"
    )
    port map (
      I0 => inputVector(25),
      I1 => inputVector(30),
      I2 => yx510_673xx_and0000,
      I3 => inputVector(0),
      I4 => N21,
      I5 => yx369_117xx,
      O => yx696_726xx
    );
  yx725_665xx1 : LUT6
    generic map(
      INIT => X"5665655665565665"
    )
    port map (
      I0 => inputVector(26),
      I1 => inputVector(30),
      I2 => inputVector(1),
      I3 => inputVector(4),
      I4 => inputVector(7),
      I5 => N41,
      O => yx725_665xx
    );
  yx865_793xx111 : LUT6
    generic map(
      INIT => X"21A523AFFFFFFFFF"
    )
    port map (
      I0 => yx540_717xx,
      I1 => yx564_654xx,
      I2 => yx510_673xx_and0000,
      I3 => yx725_665xx,
      I4 => yx756_677xx,
      I5 => yx573_738xx,
      O => yx865_793xx111_116
    );
  yx865_793xx131 : LUT5
    generic map(
      INIT => X"FFF8FFFA"
    )
    port map (
      I0 => inputVector(19),
      I1 => inputVector(30),
      I2 => yx969_266xx_and0000,
      I3 => yx522_719xx_and0000,
      I4 => inputVector(22),
      O => N39
    );
  yx863_783xx111 : LUT4
    generic map(
      INIT => X"A9FF"
    )
    port map (
      I0 => inputVector(27),
      I1 => inputVector(30),
      I2 => yx393_548xx_and0000,
      I3 => yx725_665xx,
      O => N20
    );
  yx863_783xx121 : LUT6
    generic map(
      INIT => X"FFFFFFEAFFFFFFFF"
    )
    port map (
      I0 => yx503_731xx,
      I1 => inputVector(22),
      I2 => inputVector(23),
      I3 => inputVector(28),
      I4 => inputVector(17),
      I5 => inputVector(30),
      O => yx863_783xx12
    );
  yx863_783xx122 : LUT6
    generic map(
      INIT => X"FFFFF8FFFFFFA8FF"
    )
    port map (
      I0 => inputVector(23),
      I1 => inputVector(22),
      I2 => inputVector(17),
      I3 => inputVector(31),
      I4 => yx503_731xx,
      I5 => inputVector(30),
      O => yx863_783xx121_113
    );
  yx863_783xx12_f7 : MUXF7
    port map (
      I0 => yx863_783xx121_113,
      I1 => yx863_783xx12,
      S => inputVector(32),
      O => N38
    );
  yx57_912xx11 : LUT6
    generic map(
      INIT => X"C33C41140FF00550"
    )
    port map (
      I0 => inputVector(32),
      I1 => N59,
      I2 => inputVector(0),
      I3 => N21,
      I4 => inputVector(31),
      I5 => inputVector(25),
      O => yx57_912xx1
    );
  yx57_912xx12 : LUT6
    generic map(
      INIT => X"3CC31441CC334411"
    )
    port map (
      I0 => inputVector(32),
      I1 => inputVector(0),
      I2 => inputVector(25),
      I3 => N21,
      I4 => inputVector(31),
      I5 => N59,
      O => yx57_912xx11_97
    );
  yx57_912xx1_f7 : MUXF7
    port map (
      I0 => yx57_912xx11_97,
      I1 => yx57_912xx1,
      S => yx369_117xx,
      O => outputVector(24)
    );

end Structure;

