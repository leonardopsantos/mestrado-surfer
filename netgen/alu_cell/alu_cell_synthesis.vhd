--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: L.33
--  \   \         Application: netgen
--  /   /         Filename: alu_cell_synthesis.vhd
-- /___/   /\     Timestamp: Wed Jun 01 18:18:52 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm alu_cell -w -dir netgen/synthesis -ofmt vhdl -sim alu_cell.ngc alu_cell_synthesis.vhd 
-- Device	: xc5vlx30-3-ff324
-- Input file	: alu_cell.ngc
-- Output file	: D:\ISE Projects\ALUArray\netgen\synthesis\alu_cell_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: alu_cell
-- Xilinx	: C:\Xilinx\11.1\ISE
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
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
    res : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    op_ctrl : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    op1 : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    op2 : in STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end alu_cell;

architecture Structure of alu_cell is
  signal N124 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N140 : STD_LOGIC; 
  signal N143 : STD_LOGIC; 
  signal N151 : STD_LOGIC; 
  signal N153 : STD_LOGIC; 
  signal N155 : STD_LOGIC; 
  signal N157 : STD_LOGIC; 
  signal N159 : STD_LOGIC; 
  signal N161 : STD_LOGIC; 
  signal N163 : STD_LOGIC; 
  signal N177 : STD_LOGIC; 
  signal N179 : STD_LOGIC; 
  signal N181 : STD_LOGIC; 
  signal N185 : STD_LOGIC; 
  signal N186 : STD_LOGIC; 
  signal N187 : STD_LOGIC; 
  signal N188 : STD_LOGIC; 
  signal N189 : STD_LOGIC; 
  signal N190 : STD_LOGIC; 
  signal N191 : STD_LOGIC; 
  signal N192 : STD_LOGIC; 
  signal N194 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N51 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal comp_op2 : STD_LOGIC; 
  signal inst_shifter_N01 : STD_LOGIC; 
  signal inst_shifter_N11 : STD_LOGIC; 
  signal inst_shifter_N8 : STD_LOGIC; 
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
  signal inst_shifter_buf_1_2_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_1_5_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_2_1_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_2_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_5_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_3_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_3_5_Q : STD_LOGIC; 
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
  signal inst_shifter_buf_4_17_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_18_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_19_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_1_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_20_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_21_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_22_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_23_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_25_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_26_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_27_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_28_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_29_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_2_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_30_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_31_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_3_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_4_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_5_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_6_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_7_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_8_Q : STD_LOGIC; 
  signal inst_shifter_buf_4_9_Q : STD_LOGIC; 
  signal inst_shifter_buf_2_mux0000_27_1_218 : STD_LOGIC; 
  signal inst_shifter_buf_3_mux0000_12_1_220 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_1_1 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_1_11_222 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_2_1 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_2_11_224 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_3_1 : STD_LOGIC; 
  signal inst_shifter_buf_4_mux0000_3_11_226 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_0_1 : STD_LOGIC; 
  signal inst_shifter_buf_5_mux0000_0_11_228 : STD_LOGIC; 
  signal nul : STD_LOGIC; 
  signal nul_cmp_eq0000122_230 : STD_LOGIC; 
  signal nul_cmp_eq0000197 : STD_LOGIC; 
  signal nul_cmp_eq00001971_232 : STD_LOGIC; 
  signal nul_cmp_eq0000237_233 : STD_LOGIC; 
  signal nul_cmp_eq000035_234 : STD_LOGIC; 
  signal nul_cmp_eq000052_235 : STD_LOGIC; 
  signal nul_cmp_eq000077_236 : STD_LOGIC; 
  signal res_0_1_308 : STD_LOGIC; 
  signal res_0_130_309 : STD_LOGIC; 
  signal res_0_184 : STD_LOGIC; 
  signal res_0_1841_311 : STD_LOGIC; 
  signal res_0_1842_312 : STD_LOGIC; 
  signal res_0_313_313 : STD_LOGIC; 
  signal res_0_43_314 : STD_LOGIC; 
  signal res_10_74 : STD_LOGIC; 
  signal res_10_741_317 : STD_LOGIC; 
  signal res_10_742_318 : STD_LOGIC; 
  signal res_10_96_319 : STD_LOGIC; 
  signal res_11_49_321 : STD_LOGIC; 
  signal res_11_76 : STD_LOGIC; 
  signal res_11_761_323 : STD_LOGIC; 
  signal res_11_762_324 : STD_LOGIC; 
  signal res_12_57_326 : STD_LOGIC; 
  signal res_12_86 : STD_LOGIC; 
  signal res_12_861_328 : STD_LOGIC; 
  signal res_12_862_329 : STD_LOGIC; 
  signal res_13_57_331 : STD_LOGIC; 
  signal res_13_72_332 : STD_LOGIC; 
  signal res_14_74 : STD_LOGIC; 
  signal res_14_741_335 : STD_LOGIC; 
  signal res_14_742_336 : STD_LOGIC; 
  signal res_14_96_337 : STD_LOGIC; 
  signal res_15_49_339 : STD_LOGIC; 
  signal res_15_76 : STD_LOGIC; 
  signal res_15_761_341 : STD_LOGIC; 
  signal res_15_762_342 : STD_LOGIC; 
  signal res_16_111 : STD_LOGIC; 
  signal res_16_1111 : STD_LOGIC; 
  signal res_16_11111_346 : STD_LOGIC; 
  signal res_16_50 : STD_LOGIC; 
  signal res_16_501_348 : STD_LOGIC; 
  signal res_16_502_349 : STD_LOGIC; 
  signal res_16_84_350 : STD_LOGIC; 
  signal res_17_33_352 : STD_LOGIC; 
  signal res_17_71_353 : STD_LOGIC; 
  signal res_17_73_354 : STD_LOGIC; 
  signal res_17_83_355 : STD_LOGIC; 
  signal res_17_97_356 : STD_LOGIC; 
  signal res_18_106_358 : STD_LOGIC; 
  signal res_18_50 : STD_LOGIC; 
  signal res_18_501_360 : STD_LOGIC; 
  signal res_18_502_361 : STD_LOGIC; 
  signal res_18_84_362 : STD_LOGIC; 
  signal res_19_33_364 : STD_LOGIC; 
  signal res_19_71_365 : STD_LOGIC; 
  signal res_19_73_366 : STD_LOGIC; 
  signal res_1_57_368 : STD_LOGIC; 
  signal res_1_72_369 : STD_LOGIC; 
  signal res_20_100_371 : STD_LOGIC; 
  signal res_20_33_372 : STD_LOGIC; 
  signal res_20_71_373 : STD_LOGIC; 
  signal res_20_73_374 : STD_LOGIC; 
  signal res_20_83_375 : STD_LOGIC; 
  signal res_21_100_377 : STD_LOGIC; 
  signal res_21_33_378 : STD_LOGIC; 
  signal res_21_71_379 : STD_LOGIC; 
  signal res_21_73_380 : STD_LOGIC; 
  signal res_21_97_381 : STD_LOGIC; 
  signal res_22_106_383 : STD_LOGIC; 
  signal res_22_50 : STD_LOGIC; 
  signal res_22_501_385 : STD_LOGIC; 
  signal res_22_502_386 : STD_LOGIC; 
  signal res_22_84_387 : STD_LOGIC; 
  signal res_23_33_389 : STD_LOGIC; 
  signal res_23_71_390 : STD_LOGIC; 
  signal res_23_73_391 : STD_LOGIC; 
  signal res_24_112 : STD_LOGIC; 
  signal res_24_1121_394 : STD_LOGIC; 
  signal res_24_1122_395 : STD_LOGIC; 
  signal res_24_50 : STD_LOGIC; 
  signal res_24_501_397 : STD_LOGIC; 
  signal res_24_502_398 : STD_LOGIC; 
  signal res_24_84_399 : STD_LOGIC; 
  signal res_25_100_401 : STD_LOGIC; 
  signal res_25_33_402 : STD_LOGIC; 
  signal res_25_71_403 : STD_LOGIC; 
  signal res_25_73_404 : STD_LOGIC; 
  signal res_25_97_405 : STD_LOGIC; 
  signal res_26_106_407 : STD_LOGIC; 
  signal res_26_50 : STD_LOGIC; 
  signal res_26_501_409 : STD_LOGIC; 
  signal res_26_502_410 : STD_LOGIC; 
  signal res_26_84_411 : STD_LOGIC; 
  signal res_27_0_413 : STD_LOGIC; 
  signal res_27_33_414 : STD_LOGIC; 
  signal res_27_71_415 : STD_LOGIC; 
  signal res_28_33_417 : STD_LOGIC; 
  signal res_28_71_418 : STD_LOGIC; 
  signal res_28_73_419 : STD_LOGIC; 
  signal res_28_99_420 : STD_LOGIC; 
  signal res_29_100_422 : STD_LOGIC; 
  signal res_29_33_423 : STD_LOGIC; 
  signal res_29_71_424 : STD_LOGIC; 
  signal res_29_73_425 : STD_LOGIC; 
  signal res_2_57_427 : STD_LOGIC; 
  signal res_2_72_428 : STD_LOGIC; 
  signal res_30_106_430 : STD_LOGIC; 
  signal res_30_50 : STD_LOGIC; 
  signal res_30_501_432 : STD_LOGIC; 
  signal res_30_502_433 : STD_LOGIC; 
  signal res_30_84_434 : STD_LOGIC; 
  signal res_31_33_436 : STD_LOGIC; 
  signal res_31_71_437 : STD_LOGIC; 
  signal res_31_73_438 : STD_LOGIC; 
  signal res_3_49_440 : STD_LOGIC; 
  signal res_3_76 : STD_LOGIC; 
  signal res_3_761_442 : STD_LOGIC; 
  signal res_3_762_443 : STD_LOGIC; 
  signal res_4_57_445 : STD_LOGIC; 
  signal res_4_72_446 : STD_LOGIC; 
  signal res_4_89_447 : STD_LOGIC; 
  signal res_5_57_449 : STD_LOGIC; 
  signal res_5_72_450 : STD_LOGIC; 
  signal res_6_74 : STD_LOGIC; 
  signal res_6_741_453 : STD_LOGIC; 
  signal res_6_742_454 : STD_LOGIC; 
  signal res_6_96_455 : STD_LOGIC; 
  signal res_7_49_457 : STD_LOGIC; 
  signal res_7_76 : STD_LOGIC; 
  signal res_7_761_459 : STD_LOGIC; 
  signal res_7_762_460 : STD_LOGIC; 
  signal res_8_74 : STD_LOGIC; 
  signal res_8_741_463 : STD_LOGIC; 
  signal res_8_742_464 : STD_LOGIC; 
  signal res_8_84_465 : STD_LOGIC; 
  signal res_8_96_466 : STD_LOGIC; 
  signal res_9_57_468 : STD_LOGIC; 
  signal res_9_72_469 : STD_LOGIC; 
  signal shift_dir : STD_LOGIC; 
  signal signe : STD_LOGIC; 
  signal Madd_res_add_Madd_cy : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Madd_res_add_Madd_lut : STD_LOGIC_VECTOR ( 32 downto 0 ); 
  signal efct_op2 : STD_LOGIC_VECTOR ( 31 downto 31 ); 
  signal inst_shifter_buf_2_mux0000 : STD_LOGIC_VECTOR ( 27 downto 27 ); 
  signal inst_shifter_buf_3_mux0000 : STD_LOGIC_VECTOR ( 12 downto 12 ); 
  signal res_add : STD_LOGIC_VECTOR ( 32 downto 0 ); 
  signal shifter_out : STD_LOGIC_VECTOR ( 0 downto 0 ); 
begin
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
  Madd_res_add_Madd_xor_32_Q : XORCY
    port map (
      CI => Madd_res_add_Madd_cy(31),
      LI => Madd_res_add_Madd_lut(32),
      O => res_add(32)
    );
  res_16_101 : LUT5
    generic map(
      INIT => X"04400400"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => N50
    );
  res_16_121 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      O => N52
    );
  res_16_51 : LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(1),
      O => N40
    );
  res_16_71 : LUT5
    generic map(
      INIT => X"00110110"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(1),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => N46
    );
  inst_shifter_buf_5_mux0000_16_11 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => inst_shifter_N01,
      I1 => op1(4),
      O => inst_shifter_N11
    );
  res_16_61 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(3),
      I2 => op_ctrl(2),
      O => N44
    );
  res_6_112 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_6_74,
      I1 => N46,
      I2 => res_add(6),
      I3 => res_6_96_455,
      O => res(6)
    );
  res_14_112 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_14_74,
      I1 => N46,
      I2 => res_add(14),
      I3 => res_14_96_337,
      O => res(14)
    );
  res_10_112 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_10_74,
      I1 => N46,
      I2 => res_add(10),
      I3 => res_10_96_319,
      O => res(10)
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
  inst_shifter_buf_4_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_22_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_30_Q,
      O => inst_shifter_buf_4_30_Q
    );
  inst_shifter_buf_4_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_20_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_28_Q,
      O => inst_shifter_buf_4_28_Q
    );
  inst_shifter_buf_4_mux0000_26_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_18_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_26_Q,
      O => inst_shifter_buf_4_26_Q
    );
  inst_shifter_buf_3_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_2_26_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_30_Q,
      O => inst_shifter_buf_3_30_Q
    );
  inst_shifter_buf_3_mux0000_28_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_2_24_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_28_Q,
      O => inst_shifter_buf_3_28_Q
    );
  inst_shifter_buf_2_mux0000_30_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(1),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_1_28_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_1_30_Q,
      O => inst_shifter_buf_2_30_Q
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
  res_4_89 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_4_57_445,
      I1 => N39,
      I2 => op2(4),
      I3 => N46,
      I4 => res_add(4),
      I5 => res_4_72_446,
      O => res_4_89_447
    );
  res_26_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(26),
      I1 => N38,
      I2 => N51,
      I3 => op2(26),
      I4 => N39,
      I5 => res_26_50,
      O => res_26_84_411
    );
  res_26_122 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_26_84_411,
      I1 => N46,
      I2 => res_add(26),
      I3 => res_26_106_407,
      O => res(26)
    );
  res_22_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(22),
      I1 => N38,
      I2 => N51,
      I3 => op2(22),
      I4 => N39,
      I5 => res_22_50,
      O => res_22_84_387
    );
  res_22_122 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_22_84_387,
      I1 => N46,
      I2 => res_add(22),
      I3 => res_22_106_383,
      O => res(22)
    );
  res_18_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(18),
      I1 => N38,
      I2 => N51,
      I3 => op2(18),
      I4 => N39,
      I5 => res_18_50,
      O => res_18_84_362
    );
  res_18_122 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_18_84_362,
      I1 => N46,
      I2 => res_add(18),
      I3 => res_18_106_358,
      O => res(18)
    );
  res_16_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(16),
      I1 => N38,
      I2 => N51,
      I3 => op2(16),
      I4 => N39,
      I5 => res_16_50,
      O => res_16_84_350
    );
  res_16_122 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_16_84_350,
      I1 => N46,
      I2 => res_add(16),
      I3 => N50,
      I4 => res_16_111,
      O => res(16)
    );
  res_30_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(30),
      I1 => N38,
      I2 => N51,
      I3 => op2(30),
      I4 => N39,
      I5 => res_30_50,
      O => res_30_84_434
    );
  res_30_122 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_30_84_434,
      I1 => N46,
      I2 => res_add(30),
      I3 => res_30_106_430,
      O => res(30)
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
      O => N124
    );
  overflow_or0000 : LUT6
    generic map(
      INIT => X"000004A200005402"
    )
    port map (
      I0 => res_add(31),
      I1 => efct_op2(31),
      I2 => op_ctrl(1),
      I3 => op1(31),
      I4 => N124,
      I5 => op2(31),
      O => overflow
    );
  res_24_84 : LUT6
    generic map(
      INIT => X"FFFFFFFFFF88A888"
    )
    port map (
      I0 => op1(24),
      I1 => N38,
      I2 => N51,
      I3 => op2(24),
      I4 => N39,
      I5 => res_24_50,
      O => res_24_84_399
    );
  res_24_123 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_24_84_399,
      I1 => N46,
      I2 => res_add(24),
      I3 => N50,
      I4 => res_24_112,
      O => res(24)
    );
  inst_shifter_buf_4_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_21_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_29_Q,
      O => inst_shifter_buf_4_29_Q
    );
  inst_shifter_buf_4_mux0000_25_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_17_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_25_Q,
      O => inst_shifter_buf_4_25_Q
    );
  inst_shifter_buf_3_mux0000_29_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(2),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_2_25_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_29_Q,
      O => inst_shifter_buf_3_29_Q
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
  res_29_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(29),
      I1 => N51,
      I2 => op2(29),
      I3 => N40,
      I4 => N38,
      O => res_29_71_424
    );
  res_29_116 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_29_73_425,
      I1 => N46,
      I2 => res_add(29),
      I3 => res_29_100_422,
      O => res(29)
    );
  res_21_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(21),
      I1 => N51,
      I2 => op2(21),
      I3 => N40,
      I4 => N38,
      O => res_21_71_379
    );
  res_21_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N50,
      I1 => res_21_97_381,
      I2 => res_21_73_380,
      I3 => res_add(21),
      I4 => N46,
      I5 => res_21_100_377,
      O => res(21)
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
  res_25_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(25),
      I1 => N51,
      I2 => op2(25),
      I3 => N40,
      I4 => N38,
      O => res_25_71_403
    );
  res_25_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N50,
      I1 => res_25_97_405,
      I2 => res_25_73_404,
      I3 => res_add(25),
      I4 => N46,
      I5 => res_25_100_401,
      O => res(25)
    );
  res_28_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(28),
      I1 => N51,
      I2 => op2(28),
      I3 => N40,
      I4 => N38,
      O => res_28_71_418
    );
  res_28_116 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_28_73_419,
      I1 => N46,
      I2 => res_add(28),
      I3 => res_28_99_420,
      O => res(28)
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
  res_20_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(20),
      I1 => N51,
      I2 => op2(20),
      I3 => N40,
      I4 => N38,
      O => res_20_71_373
    );
  res_20_117 : LUT6
    generic map(
      INIT => X"FFFFFFFFEEEEEAAA"
    )
    port map (
      I0 => res_20_73_374,
      I1 => N50,
      I2 => inst_shifter_buf_4_4_Q,
      I3 => inst_shifter_N8,
      I4 => res_20_100_371,
      I5 => res_20_83_375,
      O => res(20)
    );
  res_17_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(17),
      I1 => N51,
      I2 => op2(17),
      I3 => N40,
      I4 => N38,
      O => res_17_71_353
    );
  res_17_117 : LUT6
    generic map(
      INIT => X"FFFFFFFFEAEAEEEA"
    )
    port map (
      I0 => res_17_73_354,
      I1 => N50,
      I2 => res_17_97_356,
      I3 => inst_shifter_buf_4_17_Q,
      I4 => op1(4),
      I5 => res_17_83_355,
      O => res(17)
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
  inst_shifter_buf_4_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_19_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_27_Q,
      O => inst_shifter_buf_4_27_Q
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
  inst_shifter_buf_3_mux0000_27_SW0 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => op1(1),
      I1 => op1(0),
      I2 => op2(31),
      O => N136
    );
  inst_shifter_buf_3_mux0000_27_Q : LUT6
    generic map(
      INIT => X"FFF7DDD5AAA28880"
    )
    port map (
      I0 => op1(2),
      I1 => shift_dir,
      I2 => inst_shifter_N01,
      I3 => N136,
      I4 => inst_shifter_buf_2_23_Q,
      I5 => inst_shifter_buf_2_27_Q,
      O => inst_shifter_buf_3_27_Q
    );
  res_27_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(27),
      I1 => N51,
      I2 => op2(27),
      I3 => N40,
      I4 => N38,
      O => res_27_71_415
    );
  res_19_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(19),
      I1 => N51,
      I2 => op2(19),
      I3 => N40,
      I4 => N38,
      O => res_19_71_365
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
  efct_op2_31_1 : LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => N41,
      I1 => op2(31),
      I2 => comp_op2,
      O => efct_op2(31)
    );
  inst_shifter_buf_4_mux0000_31_1 : LUT5
    generic map(
      INIT => X"DDFD88A8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => inst_shifter_buf_3_23_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_31_Q,
      O => inst_shifter_buf_4_31_Q
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
  inst_shifter_buf_3_mux0000_31_SW0 : LUT6
    generic map(
      INIT => X"FDB9ECA875316420"
    )
    port map (
      I0 => op1(1),
      I1 => op1(0),
      I2 => op2(29),
      I3 => op2(30),
      I4 => op2(31),
      I5 => op2(28),
      O => N140
    );
  inst_shifter_buf_3_mux0000_31_Q : LUT6
    generic map(
      INIT => X"FFFFFFFF75316420"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(2),
      I2 => N136,
      I3 => inst_shifter_buf_2_27_Q,
      I4 => N140,
      I5 => inst_shifter_N01,
      O => inst_shifter_buf_3_31_Q
    );
  res_31_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(31),
      I1 => N51,
      I2 => op2(31),
      I3 => N40,
      I4 => N38,
      O => res_31_71_437
    );
  res_23_71 : LUT5
    generic map(
      INIT => X"AFAA8580"
    )
    port map (
      I0 => op1(23),
      I1 => N51,
      I2 => op2(23),
      I3 => N40,
      I4 => N38,
      O => res_23_71_390
    );
  inst_shifter_buf_3_mux0000_0_SW0 : LUT6
    generic map(
      INIT => X"32377277BABFFAFF"
    )
    port map (
      I0 => op1(1),
      I1 => shift_dir,
      I2 => op1(0),
      I3 => op2(0),
      I4 => op2(1),
      I5 => inst_shifter_buf_1_2_Q,
      O => N143
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
  res_0_130 : LUT6
    generic map(
      INIT => X"E6E08680E6E08781"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(4),
      I3 => res_add(32),
      I4 => op1(0),
      I5 => op2(0),
      O => res_0_130_309
    );
  nul_cmp_eq000035 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(1),
      I1 => res_add(0),
      I2 => res_add(2),
      I3 => res_add(3),
      I4 => res_add(4),
      I5 => res_add(5),
      O => nul_cmp_eq000035_234
    );
  nul_cmp_eq000077 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => res_add(24),
      I1 => res_add(23),
      I2 => res_add(25),
      O => nul_cmp_eq000077_236
    );
  nul_cmp_eq0000122 : LUT5
    generic map(
      INIT => X"00000001"
    )
    port map (
      I0 => res_add(27),
      I1 => res_add(26),
      I2 => res_add(28),
      I3 => res_add(29),
      I4 => res_add(30),
      O => nul_cmp_eq0000122_230
    );
  nul_cmp_eq0000237 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(17),
      I1 => res_add(16),
      I2 => res_add(18),
      I3 => res_add(19),
      I4 => res_add(20),
      I5 => res_add(21),
      O => nul_cmp_eq0000237_233
    );
  nul_cmp_eq0000264 : LUT6
    generic map(
      INIT => X"0000000080000000"
    )
    port map (
      I0 => nul_cmp_eq0000237_233,
      I1 => nul_cmp_eq000077_236,
      I2 => nul_cmp_eq0000122_230,
      I3 => nul_cmp_eq000052_235,
      I4 => nul_cmp_eq0000197,
      I5 => res_add(31),
      O => nul
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
  inst_shifter_buf_3_mux0000_0_Q : LUT6
    generic map(
      INIT => X"88800080DDD555D5"
    )
    port map (
      I0 => op1(2),
      I1 => shift_dir,
      I2 => inst_shifter_buf_1_4_Q,
      I3 => op1(1),
      I4 => inst_shifter_buf_1_6_Q,
      I5 => N143,
      O => inst_shifter_buf_3_0_Q
    );
  res_2_113 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_2_Q,
      I3 => N151,
      I4 => inst_shifter_buf_4_18_Q,
      I5 => shift_dir,
      O => res(2)
    );
  res_9_113 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_9_Q,
      I3 => N153,
      I4 => inst_shifter_buf_4_25_Q,
      I5 => shift_dir,
      O => res(9)
    );
  res_5_113 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_5_Q,
      I3 => N155,
      I4 => inst_shifter_buf_4_21_Q,
      I5 => shift_dir,
      O => res(5)
    );
  res_1_113 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_1_Q,
      I3 => N157,
      I4 => inst_shifter_buf_4_17_Q,
      I5 => shift_dir,
      O => res(1)
    );
  res_13_113 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_13_Q,
      I3 => N159,
      I4 => inst_shifter_buf_4_29_Q,
      I5 => shift_dir,
      O => res(13)
    );
  res_0_43_SW0 : LUT5
    generic map(
      INIT => X"AB000100"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op1(31),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      I4 => shifter_out(0),
      O => N161
    );
  res_0_43 : LUT6
    generic map(
      INIT => X"FFFFFFFF888F8888"
    )
    port map (
      I0 => res_add(0),
      I1 => N46,
      I2 => op_ctrl(1),
      I3 => op_ctrl(3),
      I4 => N161,
      I5 => res_0_1_308,
      O => res_0_43_314
    );
  res_27_114 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFEFE"
    )
    port map (
      I0 => res_27_71_415,
      I1 => res_27_0_413,
      I2 => res_27_33_414,
      I3 => N46,
      I4 => res_add(27),
      I5 => N163,
      O => res(27)
    );
  Madd_res_add_Madd_lut_32_Q : LUT5
    generic map(
      INIT => X"5DF72A80"
    )
    port map (
      I0 => signe,
      I1 => op2(31),
      I2 => N41,
      I3 => op1(31),
      I4 => comp_op2,
      O => Madd_res_add_Madd_lut(32)
    );
  Madd_res_add_Madd_lut_0_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(0),
      I1 => op2(0),
      I2 => comp_op2,
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
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
      I3 => N41,
      O => Madd_res_add_Madd_lut(30)
    );
  res_29_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_29_33_423,
      I1 => N39,
      I2 => op2(29),
      I3 => res_29_71_424,
      O => res_29_73_425
    );
  res_21_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_21_33_378,
      I1 => N39,
      I2 => op2(21),
      I3 => res_21_71_379,
      O => res_21_73_380
    );
  res_25_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_25_33_402,
      I1 => N39,
      I2 => op2(25),
      I3 => res_25_71_403,
      O => res_25_73_404
    );
  res_28_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_28_33_417,
      I1 => N39,
      I2 => op2(28),
      I3 => res_28_71_418,
      O => res_28_73_419
    );
  res_20_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_20_33_372,
      I1 => N39,
      I2 => op2(20),
      I3 => res_20_71_373,
      O => res_20_73_374
    );
  res_17_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_17_33_352,
      I1 => N39,
      I2 => op2(17),
      I3 => res_17_71_353,
      O => res_17_73_354
    );
  res_19_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_19_33_364,
      I1 => N39,
      I2 => op2(19),
      I3 => res_19_71_365,
      O => res_19_73_366
    );
  res_31_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_31_33_436,
      I1 => N39,
      I2 => op2(31),
      I3 => res_31_71_437,
      O => res_31_73_438
    );
  res_23_73 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => res_23_33_389,
      I1 => N39,
      I2 => op2(23),
      I3 => res_23_71_390,
      O => res_23_73_391
    );
  nul_cmp_eq000052 : LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => res_add(13),
      I1 => res_add(12),
      I2 => nul_cmp_eq000035_234,
      I3 => res_add(14),
      I4 => res_add(15),
      O => nul_cmp_eq000052_235
    );
  res_19_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N50,
      I1 => inst_shifter_N11,
      I2 => res_19_73_366,
      I3 => N46,
      I4 => res_add(19),
      I5 => N177,
      O => res(19)
    );
  res_31_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N50,
      I1 => inst_shifter_N11,
      I2 => res_31_73_438,
      I3 => N46,
      I4 => res_add(31),
      I5 => N179,
      O => res(31)
    );
  res_23_116 : LUT6
    generic map(
      INIT => X"FFFAFAFAFFF8F8F8"
    )
    port map (
      I0 => N50,
      I1 => inst_shifter_N11,
      I2 => res_23_73_391,
      I3 => N46,
      I4 => res_add(23),
      I5 => N181,
      O => res(23)
    );
  efct_op2_32_11 : LUT5
    generic map(
      INIT => X"FFFF4D1B"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op_ctrl(2),
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(4),
      O => N41
    );
  N381 : LUT5
    generic map(
      INIT => X"06000040"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      O => N38
    );
  inst_shifter_buf_4_mux0000_7_1 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(3),
      I1 => op1(2),
      I2 => inst_shifter_buf_2_19_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_15_Q,
      I5 => inst_shifter_buf_3_7_Q,
      O => inst_shifter_buf_4_7_Q
    );
  inst_shifter_buf_4_mux0000_5_1 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(3),
      I1 => op1(2),
      I2 => inst_shifter_buf_2_17_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_13_Q,
      I5 => inst_shifter_buf_3_5_Q,
      O => inst_shifter_buf_4_5_Q
    );
  inst_shifter_buf_2_mux0000_1_1 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(1),
      I1 => op1(0),
      I2 => op2(4),
      I3 => shift_dir,
      I4 => op2(3),
      I5 => inst_shifter_buf_1_1_Q,
      O => inst_shifter_buf_2_1_Q
    );
  inst_shifter_buf_4_mux0000_6_1 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(3),
      I1 => op1(2),
      I2 => inst_shifter_buf_2_18_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_14_Q,
      I5 => inst_shifter_buf_3_6_Q,
      O => inst_shifter_buf_4_6_Q
    );
  inst_shifter_buf_4_mux0000_4_1 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(3),
      I1 => op1(2),
      I2 => inst_shifter_buf_2_16_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_2_12_Q,
      I5 => inst_shifter_buf_3_4_Q,
      O => inst_shifter_buf_4_4_Q
    );
  res_2_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(2),
      I2 => op2(2),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_2_57_427
    );
  res_6_96 : LUT5
    generic map(
      INIT => X"A2228000"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_22_Q,
      I4 => inst_shifter_buf_4_6_Q,
      O => res_6_96_455
    );
  res_14_96 : LUT5
    generic map(
      INIT => X"A2228000"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_30_Q,
      I4 => inst_shifter_buf_4_14_Q,
      O => res_14_96_337
    );
  res_10_96 : LUT5
    generic map(
      INIT => X"A2228000"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => shift_dir,
      I3 => inst_shifter_buf_4_26_Q,
      I4 => inst_shifter_buf_4_10_Q,
      O => res_10_96_319
    );
  res_4_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(4),
      I2 => op2(4),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_4_57_445
    );
  res_4_114 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_4_Q,
      I3 => res_4_89_447,
      I4 => shift_dir,
      I5 => inst_shifter_buf_4_20_Q,
      O => res(4)
    );
  res_9_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(9),
      I2 => op2(9),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_9_57_468
    );
  res_5_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(5),
      I2 => op2(5),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_5_57_449
    );
  res_1_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(1),
      I2 => op2(1),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_1_57_368
    );
  res_13_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(13),
      I2 => op2(13),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_13_57_331
    );
  res_12_57 : LUT6
    generic map(
      INIT => X"2B8328802B032800"
    )
    port map (
      I0 => N44,
      I1 => op1(12),
      I2 => op2(12),
      I3 => op_ctrl(1),
      I4 => N40,
      I5 => op_ctrl(0),
      O => res_12_57_326
    );
  res_3_49 : LUT6
    generic map(
      INIT => X"EAAA4880EAAA4800"
    )
    port map (
      I0 => op2(3),
      I1 => N44,
      I2 => op1(3),
      I3 => op_ctrl(1),
      I4 => N39,
      I5 => op_ctrl(0),
      O => res_3_49_440
    );
  res_11_49 : LUT6
    generic map(
      INIT => X"EAAA4880EAAA4800"
    )
    port map (
      I0 => op2(11),
      I1 => N44,
      I2 => op1(11),
      I3 => op_ctrl(1),
      I4 => N39,
      I5 => op_ctrl(0),
      O => res_11_49_321
    );
  res_20_100 : LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => inst_shifter_N01,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_20_Q,
      O => res_20_100_371
    );
  res_7_49 : LUT6
    generic map(
      INIT => X"EAAA4880EAAA4800"
    )
    port map (
      I0 => op2(7),
      I1 => N44,
      I2 => op1(7),
      I3 => op_ctrl(1),
      I4 => N39,
      I5 => op_ctrl(0),
      O => res_7_49_457
    );
  res_15_49 : LUT6
    generic map(
      INIT => X"EAAA4880EAAA4800"
    )
    port map (
      I0 => op2(15),
      I1 => N44,
      I2 => op1(15),
      I3 => op_ctrl(1),
      I4 => N39,
      I5 => op_ctrl(0),
      O => res_15_49_339
    );
  Madd_res_add_Madd_lut_31_Q : LUT4
    generic map(
      INIT => X"569A"
    )
    port map (
      I0 => op1(31),
      I1 => op2(31),
      I2 => comp_op2,
      I3 => N41,
      O => Madd_res_add_Madd_lut(31)
    );
  res_16_41 : LUT5
    generic map(
      INIT => X"00002000"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op_ctrl(1),
      I2 => op_ctrl(3),
      I3 => op_ctrl(2),
      I4 => op_ctrl(0),
      O => N39
    );
  res_8_84 : LUT6
    generic map(
      INIT => X"0101000001100000"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(2),
      I3 => op_ctrl(1),
      I4 => res_add(8),
      I5 => op_ctrl(0),
      O => res_8_84_465
    );
  res_8_113 : LUT6
    generic map(
      INIT => X"FFFFFFFFEAEAEEEA"
    )
    port map (
      I0 => res_8_74,
      I1 => N50,
      I2 => res_8_96_466,
      I3 => inst_shifter_buf_4_8_Q,
      I4 => op1(4),
      I5 => res_8_84_465,
      O => res(8)
    );
  res_21_100 : LUT6
    generic map(
      INIT => X"5551444015110400"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => shift_dir,
      I3 => inst_shifter_buf_3_13_Q,
      I4 => inst_shifter_buf_3_21_Q,
      I5 => inst_shifter_buf_3_29_Q,
      O => res_21_100_377
    );
  res_25_100 : LUT6
    generic map(
      INIT => X"5555444411510040"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => inst_shifter_buf_3_17_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_25_Q,
      I5 => inst_shifter_N01,
      O => res_25_100_401
    );
  res_20_83 : LUT6
    generic map(
      INIT => X"0101000001100000"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(2),
      I3 => op_ctrl(1),
      I4 => res_add(20),
      I5 => op_ctrl(0),
      O => res_20_83_375
    );
  res_17_83 : LUT6
    generic map(
      INIT => X"0101000001100000"
    )
    port map (
      I0 => op_ctrl(3),
      I1 => op_ctrl(4),
      I2 => op_ctrl(2),
      I3 => op_ctrl(1),
      I4 => res_add(17),
      I5 => op_ctrl(0),
      O => res_17_83_355
    );
  res_0_324 : LUT6
    generic map(
      INIT => X"FEFEFFFEFEFEFEFE"
    )
    port map (
      I0 => res_0_43_314,
      I1 => res_0_184,
      I2 => res_0_313_313,
      I3 => res_0_130_309,
      I4 => op_ctrl(2),
      I5 => op_ctrl(3),
      O => res(0)
    );
  res_2_113_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_2_72_428,
      I1 => N39,
      I2 => op2(2),
      I3 => N46,
      I4 => res_add(2),
      I5 => res_2_57_427,
      O => N151
    );
  res_9_113_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_9_72_469,
      I1 => N39,
      I2 => op2(9),
      I3 => N46,
      I4 => res_add(9),
      I5 => res_9_57_468,
      O => N153
    );
  res_5_113_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_5_72_450,
      I1 => N39,
      I2 => op2(5),
      I3 => N46,
      I4 => res_add(5),
      I5 => res_5_57_449,
      O => N155
    );
  res_1_113_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_1_72_369,
      I1 => N39,
      I2 => op2(1),
      I3 => N46,
      I4 => res_add(1),
      I5 => res_1_57_368,
      O => N157
    );
  res_13_113_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_13_72_332,
      I1 => N39,
      I2 => op2(13),
      I3 => N46,
      I4 => res_add(13),
      I5 => res_13_57_331,
      O => N159
    );
  inst_shifter_buf_4_mux0000_9_1 : LUT6
    generic map(
      INIT => X"D5D5DFD580808A80"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_buf_3_17_Q,
      I2 => shift_dir,
      I3 => inst_shifter_buf_2_1_Q,
      I4 => op1(2),
      I5 => inst_shifter_buf_3_9_Q,
      O => inst_shifter_buf_4_9_Q
    );
  inst_shifter_buf_4_mux0000_8_1 : LUT6
    generic map(
      INIT => X"DDDF888A55570002"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(2),
      I3 => N143,
      I4 => inst_shifter_buf_3_8_Q,
      I5 => inst_shifter_buf_3_16_Q,
      O => inst_shifter_buf_4_8_Q
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
  res_8_96 : LUT5
    generic map(
      INIT => X"C0408000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => op1(4),
      I3 => inst_shifter_N01,
      I4 => inst_shifter_buf_3_24_Q,
      O => res_8_96_466
    );
  res_12_113 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_12_Q,
      I3 => res_12_86,
      I4 => shift_dir,
      I5 => inst_shifter_buf_4_28_Q,
      O => res(12)
    );
  res_3_102 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_3_Q,
      I3 => res_3_76,
      I4 => shift_dir,
      I5 => inst_shifter_buf_4_19_Q,
      O => res(3)
    );
  res_11_102 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_11_Q,
      I3 => res_11_76,
      I4 => shift_dir,
      I5 => inst_shifter_buf_4_27_Q,
      O => res(11)
    );
  res_7_102 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_7_Q,
      I3 => res_7_76,
      I4 => shift_dir,
      I5 => inst_shifter_buf_4_23_Q,
      O => res(7)
    );
  res_15_102 : LUT6
    generic map(
      INIT => X"FFA8FF20FF20FF20"
    )
    port map (
      I0 => N50,
      I1 => op1(4),
      I2 => inst_shifter_buf_4_15_Q,
      I3 => res_15_76,
      I4 => shift_dir,
      I5 => inst_shifter_buf_4_31_Q,
      O => res(15)
    );
  res_26_106 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_10_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_26_Q,
      I5 => inst_shifter_N01,
      O => res_26_106_407
    );
  res_22_106 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_6_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_22_Q,
      I5 => inst_shifter_N01,
      O => res_22_106_383
    );
  res_18_106 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_2_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_18_Q,
      I5 => inst_shifter_N01,
      O => res_18_106_358
    );
  res_30_106 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_14_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_30_Q,
      I5 => inst_shifter_N01,
      O => res_30_106_430
    );
  res_29_100 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_13_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_29_Q,
      I5 => inst_shifter_N01,
      O => res_29_100_422
    );
  res_25_97 : LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_9_Q,
      I2 => shift_dir,
      I3 => inst_shifter_N01,
      O => res_25_97_405
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
      O => res_2_72_428
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
      O => res_4_72_446
    );
  res_9_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(9),
      O => res_9_72_469
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
      O => res_5_72_450
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
      O => res_1_72_369
    );
  res_13_72 : LUT6
    generic map(
      INIT => X"0600004000000000"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(1),
      I2 => op_ctrl(2),
      I3 => op_ctrl(3),
      I4 => op_ctrl(4),
      I5 => op1(13),
      O => res_13_72_332
    );
  res_27_0 : LUT6
    generic map(
      INIT => X"0000000000008000"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op2(27),
      I2 => op_ctrl(3),
      I3 => op_ctrl(2),
      I4 => op_ctrl(1),
      I5 => op_ctrl(0),
      O => res_27_0_413
    );
  res_0_1 : LUT6
    generic map(
      INIT => X"0000000000008000"
    )
    port map (
      I0 => op_ctrl(4),
      I1 => op2(0),
      I2 => op_ctrl(3),
      I3 => op_ctrl(2),
      I4 => op_ctrl(1),
      I5 => op_ctrl(0),
      O => res_0_1_308
    );
  inst_shifter_buf_2_mux0000_29_11 : LUT6
    generic map(
      INIT => X"0000000000008000"
    )
    port map (
      I0 => op2(31),
      I1 => op_ctrl(0),
      I2 => op_ctrl(4),
      I3 => op_ctrl(2),
      I4 => op_ctrl(1),
      I5 => op_ctrl(3),
      O => inst_shifter_N01
    );
  res_16_112 : LUT5
    generic map(
      INIT => X"00000008"
    )
    port map (
      I0 => op_ctrl(0),
      I1 => op_ctrl(2),
      I2 => op_ctrl(1),
      I3 => op_ctrl(4),
      I4 => op_ctrl(3),
      O => N51
    );
  res_23_116_SW0 : LUT5
    generic map(
      INIT => X"444E4444"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_23_Q,
      I2 => shift_dir,
      I3 => op1(3),
      I4 => inst_shifter_buf_3_7_Q,
      O => N181
    );
  res_21_97 : LUT5
    generic map(
      INIT => X"888A8888"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_N01,
      I2 => op1(3),
      I3 => shift_dir,
      I4 => inst_shifter_buf_3_5_Q,
      O => res_21_97_381
    );
  res_31_116_SW0 : LUT6
    generic map(
      INIT => X"32FF320010FF1000"
    )
    port map (
      I0 => op1(3),
      I1 => shift_dir,
      I2 => inst_shifter_buf_3_15_Q,
      I3 => op1(4),
      I4 => inst_shifter_buf_4_31_Q,
      I5 => inst_shifter_buf_3_7_Q,
      O => N179
    );
  res_27_114_SW0 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_11_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_27_Q,
      I5 => inst_shifter_N01,
      O => N163
    );
  res_28_99 : LUT6
    generic map(
      INIT => X"FF00AA005D000800"
    )
    port map (
      I0 => op1(4),
      I1 => inst_shifter_buf_4_12_Q,
      I2 => shift_dir,
      I3 => N50,
      I4 => inst_shifter_buf_4_28_Q,
      I5 => inst_shifter_N01,
      O => res_28_99_420
    );
  res_29_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(29),
      I2 => op2(29),
      I3 => op_ctrl(4),
      I4 => op2(13),
      I5 => op_ctrl(0),
      O => res_29_33_423
    );
  res_21_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(21),
      I2 => op2(21),
      I3 => op_ctrl(4),
      I4 => op2(5),
      I5 => op_ctrl(0),
      O => res_21_33_378
    );
  res_25_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(25),
      I2 => op2(25),
      I3 => op_ctrl(4),
      I4 => op2(9),
      I5 => op_ctrl(0),
      O => res_25_33_402
    );
  res_28_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(28),
      I2 => op2(28),
      I3 => op_ctrl(4),
      I4 => op2(12),
      I5 => op_ctrl(0),
      O => res_28_33_417
    );
  res_20_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(20),
      I2 => op2(20),
      I3 => op_ctrl(4),
      I4 => op2(4),
      I5 => op_ctrl(0),
      O => res_20_33_372
    );
  res_17_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(17),
      I2 => op2(17),
      I3 => op_ctrl(4),
      I4 => op2(1),
      I5 => op_ctrl(0),
      O => res_17_33_352
    );
  res_27_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(27),
      I2 => op2(27),
      I3 => op_ctrl(4),
      I4 => op2(11),
      I5 => op_ctrl(0),
      O => res_27_33_414
    );
  res_19_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(19),
      I2 => op2(19),
      I3 => op_ctrl(4),
      I4 => op2(3),
      I5 => op_ctrl(0),
      O => res_19_33_364
    );
  res_31_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(31),
      I2 => op2(31),
      I3 => op_ctrl(4),
      I4 => op2(15),
      I5 => op_ctrl(0),
      O => res_31_33_436
    );
  res_23_33 : LUT6
    generic map(
      INIT => X"00280028AA280028"
    )
    port map (
      I0 => N52,
      I1 => op1(23),
      I2 => op2(23),
      I3 => op_ctrl(4),
      I4 => op2(7),
      I5 => op_ctrl(0),
      O => res_23_33_389
    );
  res_19_116_SW0 : LUT6
    generic map(
      INIT => X"5557555500020000"
    )
    port map (
      I0 => op1(4),
      I1 => shift_dir,
      I2 => op1(3),
      I3 => op1(2),
      I4 => inst_shifter_buf_2_3_Q,
      I5 => inst_shifter_buf_4_19_Q,
      O => N177
    );
  res_17_97 : LUT6
    generic map(
      INIT => X"AAAAAAAA00020000"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => shift_dir,
      I3 => op1(2),
      I4 => inst_shifter_buf_2_1_Q,
      I5 => inst_shifter_N01,
      O => res_17_97_356
    );
  inst_shifter_buf_5_mux0000_16_21 : LUT6
    generic map(
      INIT => X"0000000000008000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => op1(4),
      I2 => op_ctrl(0),
      I3 => op_ctrl(4),
      I4 => op_ctrl(2),
      I5 => op_ctrl(3),
      O => inst_shifter_N8
    );
  inst_shifter_buf_3_mux0000_4_Q : MUXF7
    port map (
      I0 => N185,
      I1 => N186,
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
      O => N185
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
      O => N186
    );
  inst_shifter_buf_2_mux0000_29_Q : MUXF7
    port map (
      I0 => N187,
      I1 => N188,
      S => op1(0),
      O => inst_shifter_buf_2_29_Q
    );
  inst_shifter_buf_2_mux0000_29_F : LUT6
    generic map(
      INIT => X"FFBFCC8CFBBBC888"
    )
    port map (
      I0 => inst_shifter_N01,
      I1 => op1(1),
      I2 => shift_dir,
      I3 => op2(31),
      I4 => op2(29),
      I5 => inst_shifter_buf_1_27_Q,
      O => N187
    );
  inst_shifter_buf_2_mux0000_29_G : LUT6
    generic map(
      INIT => X"FDECFDEC75643120"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(1),
      I2 => op2(30),
      I3 => op2(28),
      I4 => inst_shifter_buf_1_27_Q,
      I5 => inst_shifter_N01,
      O => N188
    );
  inst_shifter_buf_3_mux0000_8_Q : MUXF7
    port map (
      I0 => N189,
      I1 => N190,
      S => shift_dir,
      O => inst_shifter_buf_3_8_Q
    );
  inst_shifter_buf_3_mux0000_8_F : LUT6
    generic map(
      INIT => X"FDB9ECA875316420"
    )
    port map (
      I0 => op1(2),
      I1 => op1(1),
      I2 => inst_shifter_buf_1_4_Q,
      I3 => inst_shifter_buf_1_6_Q,
      I4 => inst_shifter_buf_1_8_Q,
      I5 => inst_shifter_buf_1_2_Q,
      O => N189
    );
  inst_shifter_buf_3_mux0000_8_G : LUT5
    generic map(
      INIT => X"FDEC3120"
    )
    port map (
      I0 => op1(1),
      I1 => op1(2),
      I2 => inst_shifter_buf_1_10_Q,
      I3 => inst_shifter_buf_1_8_Q,
      I4 => inst_shifter_buf_2_12_Q,
      O => N190
    );
  res_0_313 : MUXF7
    port map (
      I0 => N191,
      I1 => N192,
      S => op_ctrl(3),
      O => res_0_313_313
    );
  res_0_313_F : LUT6
    generic map(
      INIT => X"0220220020002000"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(4),
      I2 => op1(0),
      I3 => op_ctrl(1),
      I4 => op_ctrl(0),
      I5 => op2(0),
      O => N191
    );
  res_0_313_G : LUT6
    generic map(
      INIT => X"2000200220002022"
    )
    port map (
      I0 => op_ctrl(2),
      I1 => op_ctrl(4),
      I2 => op1(31),
      I3 => op_ctrl(0),
      I4 => nul,
      I5 => op_ctrl(1),
      O => N192
    );
  XST_GND : GND
    port map (
      G => N194
    );
  res_12_861 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => res_12_57_326,
      I1 => N38,
      I2 => op1(12),
      I3 => N39,
      I4 => op2(12),
      I5 => N46,
      O => res_12_861_328
    );
  res_12_862 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => res_12_57_326,
      I1 => N38,
      I2 => op1(12),
      I3 => N39,
      I4 => op2(12),
      O => res_12_862_329
    );
  res_12_86_f7 : MUXF7
    port map (
      I0 => res_12_862_329,
      I1 => res_12_861_328,
      S => res_add(12),
      O => res_12_86
    );
  res_3_761 : LUT6
    generic map(
      INIT => X"FFF8FFFDFFF8FFF8"
    )
    port map (
      I0 => op1(3),
      I1 => N38,
      I2 => res_3_49_440,
      I3 => N46,
      I4 => op2(3),
      I5 => N40,
      O => res_3_761_442
    );
  res_3_762 : LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
    port map (
      I0 => op2(3),
      I1 => op1(3),
      I2 => N40,
      I3 => N38,
      I4 => res_3_49_440,
      O => res_3_762_443
    );
  res_3_76_f7 : MUXF7
    port map (
      I0 => res_3_762_443,
      I1 => res_3_761_442,
      S => res_add(3),
      O => res_3_76
    );
  res_11_761 : LUT6
    generic map(
      INIT => X"FFF8FFFDFFF8FFF8"
    )
    port map (
      I0 => op1(11),
      I1 => N38,
      I2 => res_11_49_321,
      I3 => N46,
      I4 => op2(11),
      I5 => N40,
      O => res_11_761_323
    );
  res_11_762 : LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
    port map (
      I0 => op2(11),
      I1 => op1(11),
      I2 => N40,
      I3 => N38,
      I4 => res_11_49_321,
      O => res_11_762_324
    );
  res_11_76_f7 : MUXF7
    port map (
      I0 => res_11_762_324,
      I1 => res_11_761_323,
      S => res_add(11),
      O => res_11_76
    );
  inst_shifter_buf_3_mux0000_12_1 : LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => inst_shifter_buf_2_16_Q,
      I1 => op1(2),
      I2 => inst_shifter_buf_2_12_Q,
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
      O => inst_shifter_buf_3_mux0000_12_1_220
    );
  inst_shifter_buf_3_mux0000_12_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_3_mux0000_12_1_220,
      I1 => inst_shifter_buf_3_mux0000(12),
      S => shift_dir,
      O => inst_shifter_buf_3_12_Q
    );
  inst_shifter_buf_2_mux0000_27_1 : LUT5
    generic map(
      INIT => X"DFD58A80"
    )
    port map (
      I0 => op1(1),
      I1 => op2(30),
      I2 => op1(0),
      I3 => op2(29),
      I4 => inst_shifter_buf_1_27_Q,
      O => inst_shifter_buf_2_mux0000(27)
    );
  inst_shifter_buf_2_mux0000_27_2 : LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => inst_shifter_buf_1_25_Q,
      I1 => op1(1),
      I2 => inst_shifter_buf_1_27_Q,
      O => inst_shifter_buf_2_mux0000_27_1_218
    );
  inst_shifter_buf_2_mux0000_27_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_2_mux0000_27_1_218,
      I1 => inst_shifter_buf_2_mux0000(27),
      S => shift_dir,
      O => inst_shifter_buf_2_27_Q
    );
  res_7_761 : LUT6
    generic map(
      INIT => X"FFF8FFFDFFF8FFF8"
    )
    port map (
      I0 => op1(7),
      I1 => N38,
      I2 => res_7_49_457,
      I3 => N46,
      I4 => op2(7),
      I5 => N40,
      O => res_7_761_459
    );
  res_7_762 : LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
    port map (
      I0 => op2(7),
      I1 => op1(7),
      I2 => N40,
      I3 => N38,
      I4 => res_7_49_457,
      O => res_7_762_460
    );
  res_7_76_f7 : MUXF7
    port map (
      I0 => res_7_762_460,
      I1 => res_7_761_459,
      S => res_add(7),
      O => res_7_76
    );
  res_15_761 : LUT6
    generic map(
      INIT => X"FFF8FFFDFFF8FFF8"
    )
    port map (
      I0 => op1(15),
      I1 => N38,
      I2 => res_15_49_339,
      I3 => N46,
      I4 => op2(15),
      I5 => N40,
      O => res_15_761_341
    );
  res_15_762 : LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
    port map (
      I0 => op2(15),
      I1 => op1(15),
      I2 => N40,
      I3 => N38,
      I4 => res_15_49_339,
      O => res_15_762_342
    );
  res_15_76_f7 : MUXF7
    port map (
      I0 => res_15_762_342,
      I1 => res_15_761_341,
      S => res_add(15),
      O => res_15_76
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
      O => res_0_1841_311
    );
  res_0_1842 : LUT5
    generic map(
      INIT => X"00008000"
    )
    port map (
      I0 => op_ctrl(1),
      I1 => nul,
      I2 => op_ctrl(3),
      I3 => op_ctrl(0),
      I4 => op_ctrl(4),
      O => res_0_1842_312
    );
  res_0_184_f7 : MUXF7
    port map (
      I0 => res_0_1842_312,
      I1 => res_0_1841_311,
      S => shifter_out(0),
      O => res_0_184
    );
  nul_cmp_eq00001971 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => res_add(10),
      I1 => res_add(7),
      I2 => res_add(6),
      I3 => res_add(8),
      I4 => res_add(11),
      I5 => res_add(22),
      O => nul_cmp_eq00001971_232
    );
  nul_cmp_eq0000197_f7 : MUXF7
    port map (
      I0 => nul_cmp_eq00001971_232,
      I1 => N194,
      S => res_add(9),
      O => nul_cmp_eq0000197
    );
  res_6_741 : LUT6
    generic map(
      INIT => X"FFFFFFFFECEC2820"
    )
    port map (
      I0 => N44,
      I1 => op1(6),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => N38,
      I5 => N39,
      O => res_6_741_453
    );
  res_6_742 : LUT5
    generic map(
      INIT => X"EEE4E4E4"
    )
    port map (
      I0 => op1(6),
      I1 => N40,
      I2 => N38,
      I3 => N44,
      I4 => op_ctrl(1),
      O => res_6_742_454
    );
  res_6_74_f7 : MUXF7
    port map (
      I0 => res_6_742_454,
      I1 => res_6_741_453,
      S => op2(6),
      O => res_6_74
    );
  res_14_741 : LUT6
    generic map(
      INIT => X"FFFFFFFFECEC2820"
    )
    port map (
      I0 => N44,
      I1 => op1(14),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => N38,
      I5 => N39,
      O => res_14_741_335
    );
  res_14_742 : LUT5
    generic map(
      INIT => X"EEE4E4E4"
    )
    port map (
      I0 => op1(14),
      I1 => N40,
      I2 => N38,
      I3 => N44,
      I4 => op_ctrl(1),
      O => res_14_742_336
    );
  res_14_74_f7 : MUXF7
    port map (
      I0 => res_14_742_336,
      I1 => res_14_741_335,
      S => op2(14),
      O => res_14_74
    );
  res_10_741 : LUT6
    generic map(
      INIT => X"FFFFFFFFECEC2820"
    )
    port map (
      I0 => N44,
      I1 => op1(10),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => N38,
      I5 => N39,
      O => res_10_741_317
    );
  res_10_742 : LUT5
    generic map(
      INIT => X"EEE4E4E4"
    )
    port map (
      I0 => op1(10),
      I1 => N40,
      I2 => N38,
      I3 => N44,
      I4 => op_ctrl(1),
      O => res_10_742_318
    );
  res_10_74_f7 : MUXF7
    port map (
      I0 => res_10_742_318,
      I1 => res_10_741_317,
      S => op2(10),
      O => res_10_74
    );
  res_8_741 : LUT6
    generic map(
      INIT => X"FFFFFFFFECEC2820"
    )
    port map (
      I0 => N44,
      I1 => op1(8),
      I2 => op_ctrl(1),
      I3 => op_ctrl(0),
      I4 => N38,
      I5 => N39,
      O => res_8_741_463
    );
  res_8_742 : LUT5
    generic map(
      INIT => X"EEE4E4E4"
    )
    port map (
      I0 => op1(8),
      I1 => N40,
      I2 => N38,
      I3 => N44,
      I4 => op_ctrl(1),
      O => res_8_742_464
    );
  res_8_74_f7 : MUXF7
    port map (
      I0 => res_8_742_464,
      I1 => res_8_741_463,
      S => op2(8),
      O => res_8_74
    );
  res_26_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(26),
      I1 => op2(26),
      I2 => N40,
      I3 => N52,
      I4 => op_ctrl(0),
      I5 => op2(10),
      O => res_26_501_409
    );
  res_26_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(26),
      I1 => op2(26),
      I2 => N40,
      I3 => N52,
      O => res_26_502_410
    );
  res_26_50_f7 : MUXF7
    port map (
      I0 => res_26_502_410,
      I1 => res_26_501_409,
      S => op_ctrl(4),
      O => res_26_50
    );
  res_22_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(22),
      I1 => op2(22),
      I2 => N40,
      I3 => N52,
      I4 => op_ctrl(0),
      I5 => op2(6),
      O => res_22_501_385
    );
  res_22_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(22),
      I1 => op2(22),
      I2 => N40,
      I3 => N52,
      O => res_22_502_386
    );
  res_22_50_f7 : MUXF7
    port map (
      I0 => res_22_502_386,
      I1 => res_22_501_385,
      S => op_ctrl(4),
      O => res_22_50
    );
  res_18_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(18),
      I1 => op2(18),
      I2 => N40,
      I3 => N52,
      I4 => op_ctrl(0),
      I5 => op2(2),
      O => res_18_501_360
    );
  res_18_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(18),
      I1 => op2(18),
      I2 => N40,
      I3 => N52,
      O => res_18_502_361
    );
  res_18_50_f7 : MUXF7
    port map (
      I0 => res_18_502_361,
      I1 => res_18_501_360,
      S => op_ctrl(4),
      O => res_18_50
    );
  res_16_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(16),
      I1 => op2(16),
      I2 => N40,
      I3 => N52,
      I4 => op_ctrl(0),
      I5 => op2(0),
      O => res_16_501_348
    );
  res_16_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(16),
      I1 => op2(16),
      I2 => N40,
      I3 => N52,
      O => res_16_502_349
    );
  res_16_50_f7 : MUXF7
    port map (
      I0 => res_16_502_349,
      I1 => res_16_501_348,
      S => op_ctrl(4),
      O => res_16_50
    );
  res_30_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(30),
      I1 => op2(30),
      I2 => N40,
      I3 => N52,
      I4 => op_ctrl(0),
      I5 => op2(14),
      O => res_30_501_432
    );
  res_30_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(30),
      I1 => op2(30),
      I2 => N40,
      I3 => N52,
      O => res_30_502_433
    );
  res_30_50_f7 : MUXF7
    port map (
      I0 => res_30_502_433,
      I1 => res_30_501_432,
      S => op_ctrl(4),
      O => res_30_50
    );
  res_24_501 : LUT6
    generic map(
      INIT => X"1010FF1010101010"
    )
    port map (
      I0 => op1(24),
      I1 => op2(24),
      I2 => N40,
      I3 => N52,
      I4 => op_ctrl(0),
      I5 => op2(8),
      O => res_24_501_397
    );
  res_24_502 : LUT4
    generic map(
      INIT => X"7610"
    )
    port map (
      I0 => op1(24),
      I1 => op2(24),
      I2 => N40,
      I3 => N52,
      O => res_24_502_398
    );
  res_24_50_f7 : MUXF7
    port map (
      I0 => res_24_502_398,
      I1 => res_24_501_397,
      S => op_ctrl(4),
      O => res_24_50
    );
  inst_shifter_buf_4_mux0000_3_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(2),
      I2 => inst_shifter_buf_2_11_Q,
      I3 => inst_shifter_buf_2_15_Q,
      O => inst_shifter_buf_4_mux0000_3_1
    );
  inst_shifter_buf_4_mux0000_3_12 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(2),
      I1 => op1(1),
      I2 => inst_shifter_buf_1_9_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_1_7_Q,
      I5 => inst_shifter_buf_2_3_Q,
      O => inst_shifter_buf_4_mux0000_3_11_226
    );
  inst_shifter_buf_4_mux0000_3_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_4_mux0000_3_11_226,
      I1 => inst_shifter_buf_4_mux0000_3_1,
      S => op1(3),
      O => inst_shifter_buf_4_3_Q
    );
  inst_shifter_buf_4_mux0000_1_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(2),
      I2 => inst_shifter_buf_2_9_Q,
      I3 => inst_shifter_buf_2_13_Q,
      O => inst_shifter_buf_4_mux0000_1_1
    );
  inst_shifter_buf_4_mux0000_1_12 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(2),
      I1 => op1(1),
      I2 => inst_shifter_buf_1_7_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_1_5_Q,
      I5 => inst_shifter_buf_2_1_Q,
      O => inst_shifter_buf_4_mux0000_1_11_222
    );
  inst_shifter_buf_4_mux0000_1_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_4_mux0000_1_11_222,
      I1 => inst_shifter_buf_4_mux0000_1_1,
      S => op1(3),
      O => inst_shifter_buf_4_1_Q
    );
  inst_shifter_buf_4_mux0000_2_11 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => shift_dir,
      I1 => op1(2),
      I2 => inst_shifter_buf_2_10_Q,
      I3 => inst_shifter_buf_2_14_Q,
      O => inst_shifter_buf_4_mux0000_2_1
    );
  inst_shifter_buf_4_mux0000_2_12 : LUT6
    generic map(
      INIT => X"F755D555A2008000"
    )
    port map (
      I0 => op1(2),
      I1 => op1(1),
      I2 => inst_shifter_buf_1_8_Q,
      I3 => shift_dir,
      I4 => inst_shifter_buf_1_6_Q,
      I5 => inst_shifter_buf_2_2_Q,
      O => inst_shifter_buf_4_mux0000_2_11_224
    );
  inst_shifter_buf_4_mux0000_2_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_4_mux0000_2_11_224,
      I1 => inst_shifter_buf_4_mux0000_2_1,
      S => op1(3),
      O => inst_shifter_buf_4_2_Q
    );
  inst_shifter_buf_5_mux0000_0_11 : LUT6
    generic map(
      INIT => X"FDB9ECA875316420"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => inst_shifter_buf_3_16_Q,
      I3 => inst_shifter_buf_3_8_Q,
      I4 => inst_shifter_buf_3_0_Q,
      I5 => inst_shifter_buf_3_24_Q,
      O => inst_shifter_buf_5_mux0000_0_1
    );
  inst_shifter_buf_5_mux0000_0_12 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => inst_shifter_buf_3_0_Q,
      O => inst_shifter_buf_5_mux0000_0_11_228
    );
  inst_shifter_buf_5_mux0000_0_1_f7 : MUXF7
    port map (
      I0 => inst_shifter_buf_5_mux0000_0_11_228,
      I1 => inst_shifter_buf_5_mux0000_0_1,
      S => shift_dir,
      O => shifter_out(0)
    );
  res_24_1121 : LUT4
    generic map(
      INIT => X"FE10"
    )
    port map (
      I0 => op1(4),
      I1 => op1(3),
      I2 => inst_shifter_buf_3_24_Q,
      I3 => inst_shifter_N01,
      O => res_24_1121_394
    );
  res_24_1122 : LUT6
    generic map(
      INIT => X"FFFDFAF8CFCDCAC8"
    )
    port map (
      I0 => op1(3),
      I1 => inst_shifter_N01,
      I2 => op1(4),
      I3 => inst_shifter_buf_3_16_Q,
      I4 => inst_shifter_buf_3_24_Q,
      I5 => inst_shifter_buf_4_8_Q,
      O => res_24_1122_395
    );
  res_24_112_f7 : MUXF7
    port map (
      I0 => res_24_1122_395,
      I1 => res_24_1121_394,
      S => shift_dir,
      O => res_24_112
    );
  res_16_11111 : LUT5
    generic map(
      INIT => X"FDEC3120"
    )
    port map (
      I0 => op1(3),
      I1 => op1(4),
      I2 => inst_shifter_buf_3_24_Q,
      I3 => inst_shifter_buf_3_16_Q,
      I4 => inst_shifter_N01,
      O => res_16_1111
    );
  res_16_11112 : LUT6
    generic map(
      INIT => X"FDECFDEC75643120"
    )
    port map (
      I0 => op1(3),
      I1 => op1(4),
      I2 => inst_shifter_buf_3_8_Q,
      I3 => inst_shifter_buf_3_16_Q,
      I4 => inst_shifter_buf_3_0_Q,
      I5 => inst_shifter_N01,
      O => res_16_11111_346
    );
  res_16_1111_f7 : MUXF7
    port map (
      I0 => res_16_11111_346,
      I1 => res_16_1111,
      S => shift_dir,
      O => res_16_111
    );

end Structure;

