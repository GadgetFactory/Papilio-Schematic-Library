--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.3
--  \   \         Application : 
--  /   /         Filename : xil_10080_19
-- /___/   /\     Timestamp : 02/08/2013 16:21:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.zpu_config.all;
use work.pad.all;

entity LogicStart_MegaWing is
   port (    
			 Audio        : in    std_logic; 
          Seg7_dot     : in    std_logic; 
          Seg7_enable  : in    std_logic_vector (3 downto 0); 
          Seg7_segdata : in    std_logic_vector (6 downto 0); 
          VGA_Blue     : in    std_logic_vector (1 downto 0); 
          VGA_Green    : in    std_logic_vector (2 downto 0); 
          VGA_Hsync    : in    std_logic; 
          VGA_Red      : in    std_logic_vector (2 downto 0); 
          VGA_Vsync    : in    std_logic; 	
			 gpio_clk: in std_logic;
			 gpio_o:   in std_logic_vector(48 downto 0);
			 gpio_t:   in std_logic_vector(48 downto 0);
			 gpio_i:   out std_logic_vector(48 downto 0);

			 gpio_spp_data: out std_logic_vector(48 downto 0);
			 gpio_spp_read: in std_logic_vector(48 downto 0); 
			 
          WING_AH   : inout std_logic_vector (7 downto 0); 
          WING_AL   : inout std_logic_vector (7 downto 0); 
          WING_BH   : inout std_logic_vector (7 downto 0); 
          WING_BL   : inout std_logic_vector (7 downto 0); 
          WING_CH   : inout std_logic_vector (7 downto 0); 
          WING_CL   : inout std_logic_vector (7 downto 0));
end LogicStart_MegaWing;

architecture BEHAVIORAL of LogicStart_MegaWing is
--  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  
--  -- SPP signal is one more than GPIO count
--  signal gpio_spp_data: std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_spp_read: std_logic_vector(zpuino_gpio_count-1 downto 0);
--  
--  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
--    "0" &
--    "1111111111111111" &
--    "1111111111111111" &
--    "1111111111111111";
--  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
--    "0" &
--    "1111111111111111" &
--    "1111111111111111" &
--    "1111111111111111";  

begin

	WING_BH(2) <= Audio;

	--7 Segment
	WING_AL(0) <= Seg7_enable(3);
	WING_AL(1) <= Seg7_dot;
	WING_AL(2) <= Seg7_enable(2);
	WING_AL(3) <= Seg7_segdata(4);
	WING_AL(4) <= Seg7_segdata(5);
	WING_AL(5) <= Seg7_segdata(2);
	WING_AL(6) <= Seg7_segdata(3);
	WING_AL(7) <= Seg7_segdata(0);
	WING_AH(0) <= Seg7_enable(1);
	WING_AH(1) <= Seg7_segdata(6);
	WING_AH(2) <= Seg7_segdata(1);
	WING_AH(3) <= Seg7_enable(0);

	--VGA
	WING_BL(0) <= VGA_Vsync;
	WING_BL(1) <= VGA_Hsync;
	WING_BL(2) <= VGA_Blue(0);
	WING_BL(3) <= VGA_Blue(1);
	WING_BL(4) <= VGA_Green(0);
	WING_BL(5) <= VGA_Green(1);
	WING_BL(6) <= VGA_Green(2);
	WING_BL(7) <= VGA_Red(0);
	WING_BH(0) <= VGA_Red(1);
	WING_BH(1) <= VGA_Red(2);
  

--  pin00: IOPAD port map(I => gpio_o(0), O => gpio_i(0), T => gpio_t(0), C => gpio_clk,PAD => WING_AL(0) );
--  pin01: IOPAD port map(I => gpio_o(1), O => gpio_i(1), T => gpio_t(1), C => gpio_clk,PAD => WING_AL(1) );
--  pin02: IOPAD port map(I => gpio_o(2), O => gpio_i(2), T => gpio_t(2), C => gpio_clk,PAD => WING_AL(2) );
--  pin03: IOPAD port map(I => gpio_o(3), O => gpio_i(3), T => gpio_t(3), C => gpio_clk,PAD => WING_AL(3) );
--  pin04: IOPAD port map(I => gpio_o(4), O => gpio_i(4), T => gpio_t(4), C => gpio_clk,PAD => WING_AL(4) );
--  pin05: IOPAD port map(I => gpio_o(5), O => gpio_i(5), T => gpio_t(5), C => gpio_clk,PAD => WING_AL(5) );
--  pin06: IOPAD port map(I => gpio_o(6), O => gpio_i(6), T => gpio_t(6), C => gpio_clk,PAD => WING_AL(6) );
--  pin07: IOPAD port map(I => gpio_o(7), O => gpio_i(7), T => gpio_t(7), C => gpio_clk,PAD => WING_AL(7) );
--  pin08: IOPAD port map(I => gpio_o(8), O => gpio_i(8), T => gpio_t(8), C => gpio_clk,PAD => WING_AH(0) );
--  pin09: IOPAD port map(I => gpio_o(9), O => gpio_i(9), T => gpio_t(9), C => gpio_clk,PAD => WING_AH(1) );
--  pin10: IOPAD port map(I => gpio_o(10),O => gpio_i(10),T => gpio_t(10),C => gpio_clk,PAD => WING_AH(2) );
--  pin11: IOPAD port map(I => gpio_o(11),O => gpio_i(11),T => gpio_t(11),C => gpio_clk,PAD => WING_AH(3) );
  pin12: IOPAD port map(I => gpio_o(12),O => gpio_i(12),T => gpio_t(12),C => gpio_clk,PAD => WING_AH(4) );
  pin13: IOPAD port map(I => gpio_o(13),O => gpio_i(13),T => gpio_t(13),C => gpio_clk,PAD => WING_AH(5) );
  pin14: IOPAD port map(I => gpio_o(14),O => gpio_i(14),T => gpio_t(14),C => gpio_clk,PAD => WING_AH(6) );
  pin15: IOPAD port map(I => gpio_o(15),O => gpio_i(15),T => gpio_t(15),C => gpio_clk,PAD => WING_AH(7) );

--  pin16: IOPAD port map(I => gpio_o(16),O => gpio_i(16),T => gpio_t(16),C => gpio_clk,PAD => WING_BL(0) );
--  pin17: IOPAD port map(I => gpio_o(17),O => gpio_i(17),T => gpio_t(17),C => gpio_clk,PAD => WING_BL(1) );
--  pin18: IOPAD port map(I => gpio_o(18),O => gpio_i(18),T => gpio_t(18),C => gpio_clk,PAD => WING_BL(2) );
--  pin19: IOPAD port map(I => gpio_o(19),O => gpio_i(19),T => gpio_t(19),C => gpio_clk,PAD => WING_BL(3) );
--  pin20: IOPAD port map(I => gpio_o(20),O => gpio_i(20),T => gpio_t(20),C => gpio_clk,PAD => WING_BL(4) );
--  pin21: IOPAD port map(I => gpio_o(21),O => gpio_i(21),T => gpio_t(21),C => gpio_clk,PAD => WING_BL(5) );
--  pin22: IOPAD port map(I => gpio_o(22),O => gpio_i(22),T => gpio_t(22),C => gpio_clk,PAD => WING_BL(6) );
--  pin23: IOPAD port map(I => gpio_o(23),O => gpio_i(23),T => gpio_t(23),C => gpio_clk,PAD => WING_BL(7) );
--  pin24: IOPAD port map(I => gpio_o(24),O => gpio_i(24),T => gpio_t(24),C => gpio_clk,PAD => WING_BH(0) );
--  pin25: IOPAD port map(I => gpio_o(25),O => gpio_i(25),T => gpio_t(25),C => gpio_clk,PAD => WING_BH(1) );
--  pin26: IOPAD port map(I => gpio_o(26),O => gpio_i(26),T => gpio_t(26),C => gpio_clk,PAD => WING_BH(2) );
  pin27: IOPAD port map(I => gpio_o(27),O => gpio_i(27),T => gpio_t(27),C => gpio_clk,PAD => WING_BH(3) );
  pin28: IOPAD port map(I => gpio_o(28),O => gpio_i(28),T => gpio_t(28),C => gpio_clk,PAD => WING_BH(4) );
  pin29: IOPAD port map(I => gpio_o(29),O => gpio_i(29),T => gpio_t(29),C => gpio_clk,PAD => WING_BH(5) );
  pin30: IOPAD port map(I => gpio_o(30),O => gpio_i(30),T => gpio_t(30),C => gpio_clk,PAD => WING_BH(6) );
  pin31: IOPAD port map(I => gpio_o(31),O => gpio_i(31),T => gpio_t(31),C => gpio_clk,PAD => WING_BH(7) );

  pin32: IOPAD port map(I => gpio_o(32),O => gpio_i(32),T => gpio_t(32),C => gpio_clk,PAD => WING_CL(0) );
  pin33: IOPAD port map(I => gpio_o(33),O => gpio_i(33),T => gpio_t(33),C => gpio_clk,PAD => WING_CL(1) );
  pin34: IOPAD port map(I => gpio_o(34),O => gpio_i(34),T => gpio_t(34),C => gpio_clk,PAD => WING_CL(2) );
  pin35: IOPAD port map(I => gpio_o(35),O => gpio_i(35),T => gpio_t(35),C => gpio_clk,PAD => WING_CL(3) );
  pin36: IOPAD port map(I => gpio_o(36),O => gpio_i(36),T => gpio_t(36),C => gpio_clk,PAD => WING_CL(4) );
  pin37: IOPAD port map(I => gpio_o(37),O => gpio_i(37),T => gpio_t(37),C => gpio_clk,PAD => WING_CL(5) );
  pin38: IOPAD port map(I => gpio_o(38),O => gpio_i(38),T => gpio_t(38),C => gpio_clk,PAD => WING_CL(6) );
  pin39: IOPAD port map(I => gpio_o(39),O => gpio_i(39),T => gpio_t(39),C => gpio_clk,PAD => WING_CL(7) );
  pin40: IOPAD port map(I => gpio_o(40),O => gpio_i(40),T => gpio_t(40),C => gpio_clk,PAD => WING_CH(0) );
  pin41: IOPAD port map(I => gpio_o(41),O => gpio_i(41),T => gpio_t(41),C => gpio_clk,PAD => WING_CH(1) );
  pin42: IOPAD port map(I => gpio_o(42),O => gpio_i(42),T => gpio_t(42),C => gpio_clk,PAD => WING_CH(2) );
  pin43: IOPAD port map(I => gpio_o(43),O => gpio_i(43),T => gpio_t(43),C => gpio_clk,PAD => WING_CH(3) );
  pin44: IOPAD port map(I => gpio_o(44),O => gpio_i(44),T => gpio_t(44),C => gpio_clk,PAD => WING_CH(4) );
  pin45: IOPAD port map(I => gpio_o(45),O => gpio_i(45),T => gpio_t(45),C => gpio_clk,PAD => WING_CH(5) );
  pin46: IOPAD port map(I => gpio_o(46),O => gpio_i(46),T => gpio_t(46),C => gpio_clk,PAD => WING_CH(6) );
  pin47: IOPAD port map(I => gpio_o(47),O => gpio_i(47),T => gpio_t(47),C => gpio_clk,PAD => WING_CH(7) );
--  ospics:   OPAD port map ( I => gpio_o(48),   PAD => SPI_CS );
  

  process(gpio_spp_read)
--          sigmadelta_spp_data,
--          timers_pwm,
--          spi2_mosi,spi2_sck)
  begin

    gpio_spp_data <= (others => DontCareValue);

--    gpio_spp_data(0) <= platform_audio_sd; -- PPS0 : SIGMADELTA DATA
--    gpio_spp_data(1) <= timers_pwm(0);          -- PPS1 : TIMER0
--    gpio_spp_data(2) <= timers_pwm(1);          -- PPS2 : TIMER1
--    gpio_spp_data(3) <= spi2_mosi;              -- PPS3 : USPI MOSI
--    gpio_spp_data(4) <= spi2_sck;               -- PPS4 : USPI SCK
--    gpio_spp_data(5) <= platform_audio_sd; -- PPS5 : SIGMADELTA1 DATA
--    gpio_spp_data(6) <= uart2_tx;               -- PPS6 : UART2 DATA
--    gpio_spp_data(8) <= platform_audio_sd;
--    spi2_miso <= gpio_spp_read(0);              -- PPS0 : USPI MISO
--    uart2_rx <= gpio_spp_read(1);              -- PPS0 : USPI MISO

  end process;


end BEHAVIORAL;

-- synopsys translate_off
configuration CFG_LogicStart_MegaWing of  LogicStart_MegaWing is
   for BEHAVIORAL
   end for;
end CFG_LogicStart_MegaWing;
-- synopsys translate_on

