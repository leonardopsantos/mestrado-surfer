--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.61xd
--  \   \         Application: netgen
--  /   /         Filename: comb_benches_blif_C1355_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 18:13:35 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm comb_benches_blif_C1355 -w -dir netgen/synthesis -ofmt vhdl -sim comb_benches_blif_C1355.ngc comb_benches_blif_C1355_synthesis.vhd 
-- Device	: xc5vlx110t-1-ff1136
-- Input file	: comb_benches_blif_C1355.ngc
-- Output file	: D:\ISE Projects\experiences\netgen\synthesis\comb_benches_blif_C1355_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: comb_benches_blif_C1355
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

entity comb_benches_blif_C1355 is
  port (
    outputVector : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    inputVector : in STD_LOGIC_VECTOR ( 40 downto 0 ) 
  );
end comb_benches_blif_C1355;

architecture Structure of comb_benches_blif_C1355 is
  signal N01 : STD_LOGIC; 
  signal N02 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal yx1001GAT_387xx : STD_LOGIC; 
  signal yx1006GAT_390xx : STD_LOGIC; 
  signal yx1011GAT_388xx : STD_LOGIC; 
  signal yx1016GAT_393xx : STD_LOGIC; 
  signal yx1021GAT_391xx : STD_LOGIC; 
  signal yx1026GAT_394xx : STD_LOGIC; 
  signal yx1031GAT_392xx : STD_LOGIC; 
  signal yx602GAT_240xx_and0000 : STD_LOGIC; 
  signal yx612GAT_238xx_and0000 : STD_LOGIC; 
  signal yx617GAT_234xx_and0000 : STD_LOGIC; 
  signal yx622GAT_232xx_and0000 : STD_LOGIC; 
  signal yx627GAT_231xx_and0000 : STD_LOGIC; 
  signal yx632GAT_230xx_and0000 : STD_LOGIC; 
  signal yx637GAT_226xx_and0000 : STD_LOGIC; 
  signal yx648GAT_235xx_and0000 : STD_LOGIC; 
  signal yx651GAT_233xx_and0000 : STD_LOGIC; 
  signal yx660GAT_227xx_and0000 : STD_LOGIC; 
  signal yx899GAT_329xx_and0000 : STD_LOGIC; 
  signal yx938GAT_372xx : STD_LOGIC; 
  signal yx940GAT_362xx : STD_LOGIC; 
  signal yx942GAT_368xx : STD_LOGIC; 
  signal yx946GAT_358xx : STD_LOGIC; 
  signal yx950GAT_347xx : STD_LOGIC; 
  signal yx956GAT_353xx : STD_LOGIC; 
  signal yx960GAT_344xx : STD_LOGIC; 
  signal yx986GAT_386xx_and0000 : STD_LOGIC; 
  signal yx991GAT_385xx_and0000 : STD_LOGIC; 
  signal yx996GAT_389xx : STD_LOGIC; 
begin
  yx660GAT_227xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(18),
      I1 => inputVector(22),
      I2 => inputVector(26),
      I3 => inputVector(30),
      O => yx660GAT_227xx_and0000
    );
  yx651GAT_233xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(11),
      I1 => inputVector(15),
      I2 => inputVector(3),
      I3 => inputVector(7),
      O => yx651GAT_233xx_and0000
    );
  yx648GAT_235xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(14),
      I2 => inputVector(2),
      I3 => inputVector(6),
      O => yx648GAT_235xx_and0000
    );
  yx632GAT_230xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(24),
      I1 => inputVector(25),
      I2 => inputVector(26),
      I3 => inputVector(27),
      O => yx632GAT_230xx_and0000
    );
  yx912GAT_330xx_and00001 : LUT5
    generic map(
      INIT => X"78878778"
    )
    port map (
      I0 => inputVector(38),
      I1 => inputVector(40),
      I2 => yx660GAT_227xx_and0000,
      I3 => yx602GAT_240xx_and0000,
      I4 => yx612GAT_238xx_and0000,
      O => yx960GAT_344xx
    );
  yx873GAT_333xx_and00001 : LUT5
    generic map(
      INIT => X"78878778"
    )
    port map (
      I0 => inputVector(35),
      I1 => inputVector(40),
      I2 => yx651GAT_233xx_and0000,
      I3 => yx627GAT_231xx_and0000,
      I4 => yx637GAT_226xx_and0000,
      O => yx946GAT_358xx
    );
  yx860GAT_334xx_and00001 : LUT5
    generic map(
      INIT => X"78878778"
    )
    port map (
      I0 => inputVector(34),
      I1 => inputVector(40),
      I2 => yx648GAT_235xx_and0000,
      I3 => yx622GAT_232xx_and0000,
      I4 => yx632GAT_230xx_and0000,
      O => yx940GAT_362xx
    );
  yx1323GAT_526xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(31),
      I1 => yx1031GAT_392xx,
      I2 => yx899GAT_329xx_and0000,
      O => outputVector(31)
    );
  yx1322GAT_530xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(30),
      I1 => yx1031GAT_392xx,
      I2 => yx960GAT_344xx,
      O => outputVector(30)
    );
  yx1320GAT_538xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(28),
      I1 => yx1031GAT_392xx,
      I2 => yx956GAT_353xx,
      O => outputVector(28)
    );
  yx1319GAT_525xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(27),
      I1 => yx1026GAT_394xx,
      I2 => yx899GAT_329xx_and0000,
      O => outputVector(27)
    );
  yx1318GAT_529xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(26),
      I1 => yx1026GAT_394xx,
      I2 => yx960GAT_344xx,
      O => outputVector(26)
    );
  yx1316GAT_537xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(24),
      I1 => yx1026GAT_394xx,
      I2 => yx956GAT_353xx,
      O => outputVector(24)
    );
  yx1315GAT_524xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(23),
      I1 => yx1021GAT_391xx,
      I2 => yx899GAT_329xx_and0000,
      O => outputVector(23)
    );
  yx1314GAT_528xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(22),
      I1 => yx1021GAT_391xx,
      I2 => yx960GAT_344xx,
      O => outputVector(22)
    );
  yx1312GAT_536xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(20),
      I1 => yx1021GAT_391xx,
      I2 => yx956GAT_353xx,
      O => outputVector(20)
    );
  yx1311GAT_523xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(19),
      I1 => yx1016GAT_393xx,
      I2 => yx899GAT_329xx_and0000,
      O => outputVector(19)
    );
  yx1310GAT_527xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(18),
      I1 => yx1016GAT_393xx,
      I2 => yx960GAT_344xx,
      O => outputVector(18)
    );
  yx1308GAT_535xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(16),
      I1 => yx1016GAT_393xx,
      I2 => yx956GAT_353xx,
      O => outputVector(16)
    );
  yx1307GAT_542xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(15),
      I1 => yx1011GAT_388xx,
      I2 => yx946GAT_358xx,
      O => outputVector(15)
    );
  yx1306GAT_546xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(14),
      I1 => yx1011GAT_388xx,
      I2 => yx940GAT_362xx,
      O => outputVector(14)
    );
  yx1303GAT_541xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(11),
      I1 => yx1006GAT_390xx,
      I2 => yx946GAT_358xx,
      O => outputVector(11)
    );
  yx1302GAT_545xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(10),
      I1 => yx1006GAT_390xx,
      I2 => yx940GAT_362xx,
      O => outputVector(10)
    );
  yx886GAT_331xx_and00002 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(21),
      I2 => N02,
      O => yx950GAT_347xx
    );
  yx617GAT_234xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(13),
      I2 => inputVector(14),
      I3 => inputVector(15),
      O => yx617GAT_234xx_and0000
    );
  yx612GAT_238xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(10),
      I1 => inputVector(11),
      I2 => inputVector(8),
      I3 => inputVector(9),
      O => yx612GAT_238xx_and0000
    );
  yx602GAT_240xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(0),
      I1 => inputVector(1),
      I2 => inputVector(2),
      I3 => inputVector(3),
      O => yx602GAT_240xx_and0000
    );
  yx1031GAT_392xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx940GAT_362xx,
      I1 => yx946GAT_358xx,
      I2 => yx942GAT_368xx,
      I3 => yx938GAT_372xx,
      I4 => yx991GAT_385xx_and0000,
      O => yx1031GAT_392xx
    );
  yx1026GAT_394xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx946GAT_358xx,
      I1 => yx940GAT_362xx,
      I2 => yx942GAT_368xx,
      I3 => yx938GAT_372xx,
      I4 => yx991GAT_385xx_and0000,
      O => yx1026GAT_394xx
    );
  yx1021GAT_391xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx942GAT_368xx,
      I1 => yx946GAT_358xx,
      I2 => yx938GAT_372xx,
      I3 => yx940GAT_362xx,
      I4 => yx991GAT_385xx_and0000,
      O => yx1021GAT_391xx
    );
  yx1016GAT_393xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx942GAT_368xx,
      I1 => yx940GAT_362xx,
      I2 => yx938GAT_372xx,
      I3 => yx946GAT_358xx,
      I4 => yx991GAT_385xx_and0000,
      O => yx1016GAT_393xx
    );
  yx1011GAT_388xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx956GAT_353xx,
      I1 => yx899GAT_329xx_and0000,
      I2 => yx950GAT_347xx,
      I3 => yx960GAT_344xx,
      I4 => yx986GAT_386xx_and0000,
      O => yx1011GAT_388xx
    );
  yx1299GAT_540xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(7),
      I1 => yx1001GAT_387xx,
      I2 => yx946GAT_358xx,
      O => outputVector(7)
    );
  yx1298GAT_544xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(6),
      I1 => yx1001GAT_387xx,
      I2 => yx940GAT_362xx,
      O => outputVector(6)
    );
  yx1295GAT_539xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(3),
      I1 => yx996GAT_389xx,
      I2 => yx946GAT_358xx,
      O => outputVector(3)
    );
  yx1294GAT_543xx1 : LUT3
    generic map(
      INIT => X"A6"
    )
    port map (
      I0 => inputVector(2),
      I1 => yx996GAT_389xx,
      I2 => yx940GAT_362xx,
      O => outputVector(2)
    );
  yx834GAT_336xx_and00002 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(8),
      I2 => N01,
      O => yx938GAT_372xx
    );
  yx847GAT_335xx_and00002 : LUT4
    generic map(
      INIT => X"8778"
    )
    port map (
      I0 => inputVector(33),
      I1 => inputVector(40),
      I2 => N12,
      I3 => yx632GAT_230xx_and0000,
      O => yx942GAT_368xx
    );
  yx637GAT_226xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(28),
      I1 => inputVector(29),
      I2 => inputVector(30),
      I3 => inputVector(31),
      O => yx637GAT_226xx_and0000
    );
  yx627GAT_231xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(20),
      I1 => inputVector(21),
      I2 => inputVector(22),
      I3 => inputVector(23),
      O => yx627GAT_231xx_and0000
    );
  yx622GAT_232xx_and00001 : LUT4
    generic map(
      INIT => X"9669"
    )
    port map (
      I0 => inputVector(16),
      I1 => inputVector(17),
      I2 => inputVector(18),
      I3 => inputVector(19),
      O => yx622GAT_232xx_and0000
    );
  yx996GAT_389xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx899GAT_329xx_and0000,
      I1 => yx960GAT_344xx,
      I2 => yx956GAT_353xx,
      I3 => yx950GAT_347xx,
      I4 => yx986GAT_386xx_and0000,
      O => yx996GAT_389xx
    );
  yx1006GAT_390xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx956GAT_353xx,
      I1 => yx960GAT_344xx,
      I2 => yx950GAT_347xx,
      I3 => yx899GAT_329xx_and0000,
      I4 => yx986GAT_386xx_and0000,
      O => yx1006GAT_390xx
    );
  yx1001GAT_387xx1 : LUT5
    generic map(
      INIT => X"00000200"
    )
    port map (
      I0 => yx960GAT_344xx,
      I1 => yx899GAT_329xx_and0000,
      I2 => yx956GAT_353xx,
      I3 => yx950GAT_347xx,
      I4 => yx986GAT_386xx_and0000,
      O => yx1001GAT_387xx
    );
  yx847GAT_335xx_and000011 : LUT5
    generic map(
      INIT => X"69969669"
    )
    port map (
      I0 => inputVector(13),
      I1 => inputVector(1),
      I2 => inputVector(5),
      I3 => inputVector(9),
      I4 => yx637GAT_226xx_and0000,
      O => N12
    );
  yx925GAT_332xx_and00001_SW0 : LUT6
    generic map(
      INIT => X"7887877887787887"
    )
    port map (
      I0 => inputVector(40),
      I1 => inputVector(36),
      I2 => inputVector(28),
      I3 => inputVector(24),
      I4 => inputVector(20),
      I5 => inputVector(16),
      O => N59
    );
  yx925GAT_332xx_and00001 : LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(5),
      I2 => inputVector(6),
      I3 => inputVector(7),
      I4 => yx602GAT_240xx_and0000,
      I5 => N59,
      O => yx956GAT_353xx
    );
  yx899GAT_329xx_and00001_SW0 : LUT6
    generic map(
      INIT => X"7887877887787887"
    )
    port map (
      I0 => inputVector(40),
      I1 => inputVector(39),
      I2 => inputVector(31),
      I3 => inputVector(27),
      I4 => inputVector(23),
      I5 => inputVector(19),
      O => N61
    );
  yx899GAT_329xx_and00001 : LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => inputVector(4),
      I1 => inputVector(5),
      I2 => inputVector(6),
      I3 => inputVector(7),
      I4 => yx617GAT_234xx_and0000,
      I5 => N61,
      O => yx899GAT_329xx_and0000
    );
  yx886GAT_331xx_and000011 : LUT6
    generic map(
      INIT => X"7887877887787887"
    )
    port map (
      I0 => inputVector(37),
      I1 => inputVector(40),
      I2 => yx617GAT_234xx_and0000,
      I3 => inputVector(25),
      I4 => inputVector(29),
      I5 => yx612GAT_238xx_and0000,
      O => N02
    );
  yx834GAT_336xx_and000011 : LUT6
    generic map(
      INIT => X"7887877887787887"
    )
    port map (
      I0 => inputVector(32),
      I1 => inputVector(40),
      I2 => yx627GAT_231xx_and0000,
      I3 => inputVector(0),
      I4 => inputVector(4),
      I5 => yx622GAT_232xx_and0000,
      O => N01
    );
  yx1313GAT_532xx1 : LUT4
    generic map(
      INIT => X"D782"
    )
    port map (
      I0 => yx1021GAT_391xx,
      I1 => inputVector(17),
      I2 => N02,
      I3 => inputVector(21),
      O => outputVector(21)
    );
  yx1309GAT_531xx1 : LUT4
    generic map(
      INIT => X"D782"
    )
    port map (
      I0 => yx1016GAT_393xx,
      I1 => inputVector(21),
      I2 => N02,
      I3 => inputVector(17),
      O => outputVector(17)
    );
  yx1304GAT_554xx1 : LUT4
    generic map(
      INIT => X"D782"
    )
    port map (
      I0 => yx1011GAT_388xx,
      I1 => inputVector(8),
      I2 => N01,
      I3 => inputVector(12),
      O => outputVector(12)
    );
  yx1300GAT_553xx1 : LUT4
    generic map(
      INIT => X"D782"
    )
    port map (
      I0 => yx1006GAT_390xx,
      I1 => inputVector(12),
      I2 => N01,
      I3 => inputVector(8),
      O => outputVector(8)
    );
  yx1321GAT_534xx1 : LUT5
    generic map(
      INIT => X"A66A6AA6"
    )
    port map (
      I0 => inputVector(29),
      I1 => yx1031GAT_392xx,
      I2 => inputVector(17),
      I3 => inputVector(21),
      I4 => N02,
      O => outputVector(29)
    );
  yx1317GAT_533xx1 : LUT5
    generic map(
      INIT => X"A66A6AA6"
    )
    port map (
      I0 => inputVector(25),
      I1 => yx1026GAT_394xx,
      I2 => inputVector(17),
      I3 => inputVector(21),
      I4 => N02,
      O => outputVector(25)
    );
  yx1305GAT_550xx1 : LUT6
    generic map(
      INIT => X"A66A6AA666AAAA66"
    )
    port map (
      I0 => inputVector(13),
      I1 => yx1011GAT_388xx,
      I2 => inputVector(33),
      I3 => N12,
      I4 => yx632GAT_230xx_and0000,
      I5 => inputVector(40),
      O => outputVector(13)
    );
  yx991GAT_385xx_and00001 : LUT6
    generic map(
      INIT => X"966969FF69FFFFFF"
    )
    port map (
      I0 => inputVector(17),
      I1 => inputVector(21),
      I2 => N02,
      I3 => yx956GAT_353xx,
      I4 => yx960GAT_344xx,
      I5 => yx899GAT_329xx_and0000,
      O => yx991GAT_385xx_and0000
    );
  yx1301GAT_549xx1 : LUT6
    generic map(
      INIT => X"A66A6AA666AAAA66"
    )
    port map (
      I0 => inputVector(9),
      I1 => yx1006GAT_390xx,
      I2 => inputVector(33),
      I3 => N12,
      I4 => yx632GAT_230xx_and0000,
      I5 => inputVector(40),
      O => outputVector(9)
    );
  yx1297GAT_548xx1 : LUT6
    generic map(
      INIT => X"A66A6AA666AAAA66"
    )
    port map (
      I0 => inputVector(5),
      I1 => yx1001GAT_387xx,
      I2 => inputVector(33),
      I3 => N12,
      I4 => yx632GAT_230xx_and0000,
      I5 => inputVector(40),
      O => outputVector(5)
    );
  yx1296GAT_552xx1 : LUT5
    generic map(
      INIT => X"A66A6AA6"
    )
    port map (
      I0 => inputVector(4),
      I1 => yx1001GAT_387xx,
      I2 => inputVector(12),
      I3 => inputVector(8),
      I4 => N01,
      O => outputVector(4)
    );
  yx1293GAT_547xx1 : LUT6
    generic map(
      INIT => X"A66A6AA666AAAA66"
    )
    port map (
      I0 => inputVector(1),
      I1 => yx996GAT_389xx,
      I2 => inputVector(33),
      I3 => N12,
      I4 => yx632GAT_230xx_and0000,
      I5 => inputVector(40),
      O => outputVector(1)
    );
  yx1292GAT_551xx1 : LUT5
    generic map(
      INIT => X"A66A6AA6"
    )
    port map (
      I0 => inputVector(0),
      I1 => yx996GAT_389xx,
      I2 => inputVector(12),
      I3 => inputVector(8),
      I4 => N01,
      O => outputVector(0)
    );
  yx986GAT_386xx_and00001 : LUT6
    generic map(
      INIT => X"966969FF69FFFFFF"
    )
    port map (
      I0 => inputVector(12),
      I1 => inputVector(8),
      I2 => N01,
      I3 => yx940GAT_362xx,
      I4 => yx942GAT_368xx,
      I5 => yx946GAT_358xx,
      O => yx986GAT_386xx_and0000
    );

end Structure;

