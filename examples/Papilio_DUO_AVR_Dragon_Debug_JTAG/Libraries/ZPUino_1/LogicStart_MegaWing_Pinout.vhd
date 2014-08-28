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
library board;
use board.zpupkg.all;
use board.zpuinopkg.all;
use board.zpuino_config.all;
use board.zpu_config.all;

library zpuino;
use zpuino.pad.all;
use zpuino.papilio_pkg.all;

entity LogicStart_MegaWing_Pinout is
   port (    
			 Audio        : in    std_logic; 
          Seg7_dot     : in    std_logic; 
          Seg7_enable  : in    std_logic_vector (3 downto 0); 
          Seg7_segdata : in    std_logic_vector (6 downto 0); 
--          VGA_Red      : in    std_logic_vector (2 downto 0); 
--          VGA_Green    : in    std_logic_vector (2 downto 0); 			 
--          VGA_Blue     : in    std_logic_vector (1 downto 0); 
			 VGA_Red2	  : in 	 std_logic;
			 VGA_Red1	  : in 	 std_logic;
			 VGA_Red0	  : in 	 std_logic;
			 VGA_Green2	  : in 	 std_logic;
			 VGA_Green1	  : in 	 std_logic;
			 VGA_Green0	  : in 	 std_logic;
			 VGA_Blue1	  : in 	 std_logic;
			 VGA_Blue0	  : in 	 std_logic;
          VGA_Hsync    : in    std_logic; 
          VGA_Vsync    : in    std_logic; 	
			 
			 SPI_CLK      : in    std_logic; 
			 SPI_MOSI     : in    std_logic; 
			 SPI_MISO     : out    std_logic; 
			 SPI_CS       : in    std_logic; 			 

			gpio_bus_in : out std_logic_vector(97 downto 0);
			gpio_bus_out : in std_logic_vector(147 downto 0);	
			 
			 WING_AH0	: inout std_logic;
			 WING_AH1	: inout std_logic;
			 WING_AH2	: inout std_logic;
			 WING_AH3	: inout std_logic;
			 WING_AH4	: inout std_logic;
			 WING_AH5	: inout std_logic;
			 WING_AH6	: inout std_logic;
			 WING_AH7	: inout std_logic;
			 
			 WING_AL0	: inout std_logic;
			 WING_AL1	: inout std_logic;
			 WING_AL2	: inout std_logic;
			 WING_AL3	: inout std_logic;
			 WING_AL4	: inout std_logic;
			 WING_AL5	: inout std_logic;
			 WING_AL6	: inout std_logic;
			 WING_AL7	: inout std_logic;

			 WING_BH0	: inout std_logic;
			 WING_BH1	: inout std_logic;
			 WING_BH2	: inout std_logic;
			 WING_BH3	: inout std_logic;
			 WING_BH4	: inout std_logic;
			 WING_BH5	: inout std_logic;
			 WING_BH6	: inout std_logic;
			 WING_BH7	: inout std_logic;

			 WING_BL0	: inout std_logic;
			 WING_BL1	: inout std_logic;
			 WING_BL2	: inout std_logic;
			 WING_BL3	: inout std_logic;
			 WING_BL4	: inout std_logic;
			 WING_BL5	: inout std_logic;
			 WING_BL6	: inout std_logic;
			 WING_BL7	: inout std_logic;

			 WING_CH0	: inout std_logic;
			 WING_CH1	: inout std_logic;
			 WING_CH2	: inout std_logic;
			 WING_CH3	: inout std_logic;
			 WING_CH4	: inout std_logic;
			 WING_CH5	: inout std_logic;
			 WING_CH6	: inout std_logic;
			 WING_CH7	: inout std_logic;

			 WING_CL0	: inout std_logic;
			 WING_CL1	: inout std_logic;
			 WING_CL2	: inout std_logic;
			 WING_CL3	: inout std_logic;
			 WING_CL4	: inout std_logic;
			 WING_CL5	: inout std_logic;
			 WING_CL6	: inout std_logic;
			 WING_CL7	: inout std_logic
			 );
end LogicStart_MegaWing_Pinout;

architecture BEHAVIORAL of LogicStart_MegaWing_Pinout is
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

  signal gpio_o:      std_logic_vector(48 downto 0);
  signal gpio_t:      std_logic_vector(48 downto 0);
  signal gpio_i:      std_logic_vector(48 downto 0);
  
  signal gpio_spp_data: std_logic_vector(48 downto 0);
  signal gpio_spp_read: std_logic_vector(48 downto 0); 

  signal gpio_clk: std_logic;  

begin
	--gpio_bus_in(97 downto 49) <= gpio_spp_data;
	--gpio_bus_in(48 downto 0) <= gpio_i;
	
	gpio_clk <= gpio_bus_out(147);
	gpio_o <= gpio_bus_out(146 downto 98);
	gpio_t <= gpio_bus_out(97 downto 49);
	gpio_spp_read <= gpio_bus_out(48 downto 0);	

	WING_BH2 <= Audio;

	--7 Segment
	WING_AL0 <= Seg7_enable(3);
	WING_AL1 <= Seg7_dot;
	WING_AL2 <= Seg7_enable(2);
	WING_AL3 <= Seg7_segdata(4);
	WING_AL4 <= Seg7_segdata(5);
	WING_AL5 <= Seg7_segdata(2);
	WING_AL6 <= Seg7_segdata(3);
	WING_AL7 <= Seg7_segdata(0);
	WING_AH0 <= Seg7_enable(1);
	WING_AH1 <= Seg7_segdata(6);
	WING_AH2 <= Seg7_segdata(1);
	WING_AH3 <= Seg7_enable(0);

	--VGA
	WING_BL0 <= VGA_Vsync;
	WING_BL1 <= VGA_Hsync;
	WING_BL2 <= VGA_Blue0;
	WING_BL3 <= VGA_Blue1;
	WING_BL4 <= VGA_Green0;
	WING_BL5 <= VGA_Green1;
	WING_BL6 <= VGA_Green2;
	WING_BL7 <= VGA_Red0;
	WING_BH0 <= VGA_Red1;
	WING_BH1 <= VGA_Red2;
	
	--SPI ADC
	WING_AH7 <= SPI_CLK;
	WING_AH6 <= SPI_MOSI;
	SPI_MISO <= WING_AH5;
	--WING_AH4 <= SPI_CS;
  
--  pin00: IOPAD port map(I => gpio_o(0), O => gpio_i(0), T => gpio_t(0), C => gpio_clk,PAD => WING_AL0 );
--  pin01: IOPAD port map(I => gpio_o(1), O => gpio_i(1), T => gpio_t(1), C => gpio_clk,PAD => WING_AL1 );
--  pin02: IOPAD port map(I => gpio_o(2), O => gpio_i(2), T => gpio_t(2), C => gpio_clk,PAD => WING_AL2 );
--  pin03: IOPAD port map(I => gpio_o(3), O => gpio_i(3), T => gpio_t(3), C => gpio_clk,PAD => WING_AL3 );
--  pin04: IOPAD port map(I => gpio_o(4), O => gpio_i(4), T => gpio_t(4), C => gpio_clk,PAD => WING_AL4 );
--  pin05: IOPAD port map(I => gpio_o(5), O => gpio_i(5), T => gpio_t(5), C => gpio_clk,PAD => WING_AL5 );
--  pin06: IOPAD port map(I => gpio_o(6), O => gpio_i(6), T => gpio_t(6), C => gpio_clk,PAD => WING_AL6 );
--  pin07: IOPAD port map(I => gpio_o(7), O => gpio_i(7), T => gpio_t(7), C => gpio_clk,PAD => WING_AL7 );
--  pin08: IOPAD port map(I => gpio_o(8), O => gpio_i(8), T => gpio_t(8), C => gpio_clk,PAD => WING_AH0 );
--  pin09: IOPAD port map(I => gpio_o(9), O => gpio_i(9), T => gpio_t(9), C => gpio_clk,PAD => WING_AH1 );
--  pin10: IOPAD port map(I => gpio_o(10),O => gpio_i(10),T => gpio_t(10),C => gpio_clk,PAD => WING_AH2 );
--  pin11: IOPAD port map(I => gpio_o(11),O => gpio_i(11),T => gpio_t(11),C => gpio_clk,PAD => WING_AH3 );
  pin12: IOPAD port map(I => gpio_o(12),O => gpio_i(12),T => gpio_t(12),C => gpio_clk,PAD => WING_AH4 );
--  pin13: IOPAD port map(I => gpio_o(13),O => gpio_i(13),T => gpio_t(13),C => gpio_clk,PAD => WING_AH5 );
--  pin14: IOPAD port map(I => gpio_o(14),O => gpio_i(14),T => gpio_t(14),C => gpio_clk,PAD => WING_AH6 );
--  pin15: IOPAD port map(I => gpio_o(15),O => gpio_i(15),T => gpio_t(15),C => gpio_clk,PAD => WING_AH7 );

--  pin16: IOPAD port map(I => gpio_o(16),O => gpio_i(16),T => gpio_t(16),C => gpio_clk,PAD => WING_BL0 );
--  pin17: IOPAD port map(I => gpio_o(17),O => gpio_i(17),T => gpio_t(17),C => gpio_clk,PAD => WING_BL1 );
--  pin18: IOPAD port map(I => gpio_o(18),O => gpio_i(18),T => gpio_t(18),C => gpio_clk,PAD => WING_BL2 );
--  pin19: IOPAD port map(I => gpio_o(19),O => gpio_i(19),T => gpio_t(19),C => gpio_clk,PAD => WING_BL3 );
--  pin20: IOPAD port map(I => gpio_o(20),O => gpio_i(20),T => gpio_t(20),C => gpio_clk,PAD => WING_BL4 );
--  pin21: IOPAD port map(I => gpio_o(21),O => gpio_i(21),T => gpio_t(21),C => gpio_clk,PAD => WING_BL5 );
--  pin22: IOPAD port map(I => gpio_o(22),O => gpio_i(22),T => gpio_t(22),C => gpio_clk,PAD => WING_BL6 );
--  pin23: IOPAD port map(I => gpio_o(23),O => gpio_i(23),T => gpio_t(23),C => gpio_clk,PAD => WING_BL7 );
--  pin24: IOPAD port map(I => gpio_o(24),O => gpio_i(24),T => gpio_t(24),C => gpio_clk,PAD => WING_BH0 );
--  pin25: IOPAD port map(I => gpio_o(25),O => gpio_i(25),T => gpio_t(25),C => gpio_clk,PAD => WING_BH1 );
--  pin26: IOPAD port map(I => gpio_o(26),O => gpio_i(26),T => gpio_t(26),C => gpio_clk,PAD => WING_BH2 );
  pin27: IOPAD port map(I => gpio_o(27),O => gpio_bus_in(27),T => gpio_t(27),C => gpio_clk,PAD => WING_BH3 );
  pin28: IOPAD port map(I => gpio_o(28),O => gpio_bus_in(28),T => gpio_t(28),C => gpio_clk,PAD => WING_BH4 );
  pin29: IOPAD port map(I => gpio_o(29),O => gpio_bus_in(29),T => gpio_t(29),C => gpio_clk,PAD => WING_BH5 );
  pin30: IOPAD port map(I => gpio_o(30),O => gpio_bus_in(30),T => gpio_t(30),C => gpio_clk,PAD => WING_BH6 );
  pin31: IOPAD port map(I => gpio_o(31),O => gpio_bus_in(31),T => gpio_t(31),C => gpio_clk,PAD => WING_BH7 );

  pin32: IOPAD port map(I => gpio_o(32),O => gpio_bus_in(32),T => gpio_t(32),C => gpio_clk,PAD => WING_CL0 );
  pin33: IOPAD port map(I => gpio_o(33),O => gpio_bus_in(33),T => gpio_t(33),C => gpio_clk,PAD => WING_CL1 );
  pin34: IOPAD port map(I => gpio_o(34),O => gpio_bus_in(34),T => gpio_t(34),C => gpio_clk,PAD => WING_CL2 );
  pin35: IOPAD port map(I => gpio_o(35),O => gpio_bus_in(35),T => gpio_t(35),C => gpio_clk,PAD => WING_CL3 );
  pin36: IOPAD port map(I => gpio_o(36),O => gpio_bus_in(36),T => gpio_t(36),C => gpio_clk,PAD => WING_CL4 );
  pin37: IOPAD port map(I => gpio_o(37),O => gpio_bus_in(37),T => gpio_t(37),C => gpio_clk,PAD => WING_CL5 );
  pin38: IOPAD port map(I => gpio_o(38),O => gpio_bus_in(38),T => gpio_t(38),C => gpio_clk,PAD => WING_CL6 );
  pin39: IOPAD port map(I => gpio_o(39),O => gpio_bus_in(39),T => gpio_t(39),C => gpio_clk,PAD => WING_CL7 );
  pin40: IOPAD port map(I => gpio_o(40),O => gpio_bus_in(40),T => gpio_t(40),C => gpio_clk,PAD => WING_CH0 );
  pin41: IOPAD port map(I => gpio_o(41),O => gpio_bus_in(41),T => gpio_t(41),C => gpio_clk,PAD => WING_CH1 );
  pin42: IOPAD port map(I => gpio_o(42),O => gpio_bus_in(42),T => gpio_t(42),C => gpio_clk,PAD => WING_CH2 );
  pin43: IOPAD port map(I => gpio_o(43),O => gpio_bus_in(43),T => gpio_t(43),C => gpio_clk,PAD => WING_CH3 );
  pin44: IOPAD port map(I => gpio_o(44),O => gpio_bus_in(44),T => gpio_t(44),C => gpio_clk,PAD => WING_CH4 );
  pin45: IOPAD port map(I => gpio_o(45),O => gpio_bus_in(45),T => gpio_t(45),C => gpio_clk,PAD => WING_CH5 );
  pin46: IOPAD port map(I => gpio_o(46),O => gpio_bus_in(46),T => gpio_t(46),C => gpio_clk,PAD => WING_CH6 );
  pin47: IOPAD port map(I => gpio_o(47),O => gpio_bus_in(47),T => gpio_t(47),C => gpio_clk,PAD => WING_CH7 );
--  ospics:   OPAD port map ( I => gpio_o(48),   PAD => SPI_CS );
  

  process(gpio_spp_read)
--          sigmadelta_spp_data,
--          timers_pwm,
--          spi2_mosi,spi2_sck)
  begin

--		gpio_spp_data <= (others => DontCareValue);
		gpio_bus_in(97 downto 49) <= (others => DontCareValue);


  end process;


end BEHAVIORAL;


