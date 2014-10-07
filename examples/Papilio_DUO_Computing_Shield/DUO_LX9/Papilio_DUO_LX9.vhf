--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_DUO_LX9.vhf
-- /___/   /\     Timestamp : 10/06/2014 15:17:59
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_Computing_Shield/DUO_LX9/Papilio_DUO_LX9.vhf -w D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_Computing_Shield/Papilio_DUO_LX9.sch
--Design Name: Papilio_DUO_LX9
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Papilio_DUO_LX9 is
   port ( CLK        : in    std_logic; 
          RXD        : in    std_logic; 
          SPI_MISO   : in    std_logic; 
          ARD_RESET  : out   std_logic; 
          SPI_MOSI   : out   std_logic; 
          SPI_SCK    : out   std_logic; 
          sram_addr  : out   std_logic_vector (18 downto 0); 
          sram_ce    : out   std_logic; 
          sram_oe    : out   std_logic; 
          sram_we    : out   std_logic; 
          TXD        : out   std_logic; 
          Arduino_0  : inout std_logic; 
          Arduino_1  : inout std_logic; 
          Arduino_2  : inout std_logic; 
          Arduino_3  : inout std_logic; 
          Arduino_4  : inout std_logic; 
          Arduino_5  : inout std_logic; 
          Arduino_6  : inout std_logic; 
          Arduino_7  : inout std_logic; 
          Arduino_8  : inout std_logic; 
          Arduino_9  : inout std_logic; 
          Arduino_10 : inout std_logic; 
          Arduino_11 : inout std_logic; 
          Arduino_12 : inout std_logic; 
          Arduino_13 : inout std_logic; 
          Arduino_14 : inout std_logic; 
          Arduino_15 : inout std_logic; 
          Arduino_16 : inout std_logic; 
          Arduino_17 : inout std_logic; 
          Arduino_18 : inout std_logic; 
          Arduino_19 : inout std_logic; 
          Arduino_20 : inout std_logic; 
          Arduino_21 : inout std_logic; 
          Arduino_22 : inout std_logic; 
          Arduino_23 : inout std_logic; 
          Arduino_24 : inout std_logic; 
          Arduino_25 : inout std_logic; 
          Arduino_26 : inout std_logic; 
          Arduino_27 : inout std_logic; 
          Arduino_28 : inout std_logic; 
          Arduino_29 : inout std_logic; 
          Arduino_30 : inout std_logic; 
          Arduino_31 : inout std_logic; 
          Arduino_32 : inout std_logic; 
          Arduino_33 : inout std_logic; 
          Arduino_34 : inout std_logic; 
          Arduino_35 : inout std_logic; 
          Arduino_36 : inout std_logic; 
          Arduino_37 : inout std_logic; 
          Arduino_38 : inout std_logic; 
          Arduino_39 : inout std_logic; 
          Arduino_40 : inout std_logic; 
          Arduino_41 : inout std_logic; 
          Arduino_42 : inout std_logic; 
          Arduino_43 : inout std_logic; 
          Arduino_44 : inout std_logic; 
          Arduino_45 : inout std_logic; 
          Arduino_46 : inout std_logic; 
          Arduino_47 : inout std_logic; 
          Arduino_48 : inout std_logic; 
          Arduino_49 : inout std_logic; 
          Arduino_50 : inout std_logic; 
          Arduino_51 : inout std_logic; 
          Arduino_52 : inout std_logic; 
          Arduino_53 : inout std_logic; 
          SPI_CS     : inout std_logic; 
          sram_data  : inout std_logic_vector (7 downto 0));
end Papilio_DUO_LX9;

architecture BEHAVIORAL of Papilio_DUO_LX9 is
   attribute IOSTANDARD : string ;
   attribute SLEW       : string ;
   attribute DRIVE      : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_408                                  : std_logic_vector (165 
         downto 0);
   signal XLXN_409                                  : std_logic_vector (109 
         downto 0);
   signal XLXN_430                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_431                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_432                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_433                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_442                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_443                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_448                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_449                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_450                                  : std_logic_vector (17 
         downto 0);
   signal XLXN_452                                  : std_logic;
   signal XLXN_456                                  : std_logic;
   signal XLXN_536                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_537                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_549                                  : std_logic;
   signal XLXN_567                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_568                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_584                                  : std_logic;
   signal XLXN_585                                  : std_logic;
   signal XLXN_586                                  : std_logic;
   signal XLXN_587                                  : std_logic;
   signal XLXN_588                                  : std_logic;
   signal XLXN_589                                  : std_logic;
   signal XLXN_590                                  : std_logic;
   signal XLXN_591                                  : std_logic;
   signal XLXN_592                                  : std_logic;
   signal XLXN_593                                  : std_logic;
   signal XLXN_596                                  : std_logic;
   signal XLXN_622                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_623                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_626                                  : std_logic;
   signal XLXN_627                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_628                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_629                                  : std_logic;
   signal XLXN_630                                  : std_logic;
   signal XLXN_631                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_632                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_633                                  : std_logic;
   signal XLXN_634                                  : std_logic;
   signal XLXN_635                                  : std_logic;
   signal XLXN_639                                  : std_logic;
   signal XLXN_640                                  : std_logic;
   signal XLXN_641                                  : std_logic;
   signal XLXN_642                                  : std_logic;
   signal XLXI_39_wishbone_slot_video_in_openSignal : std_logic_vector (63 
         downto 0);
   component Wishbone_Empty_Slot
      port ( wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_wb_passthrough
      port ( raw_out      : out   std_logic_vector (17 downto 0); 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component ZPUino_Papilio_DUO_V1
      port ( gpio_bus_out            : out   std_logic_vector (165 downto 0); 
             gpio_bus_in             : in    std_logic_vector (109 downto 0); 
             SPI_CS                  : inout std_logic; 
             TXD                     : out   std_logic; 
             SPI_MOSI                : out   std_logic; 
             SPI_SCK                 : out   std_logic; 
             clk_96Mhz               : out   std_logic; 
             clk_1Mhz                : out   std_logic; 
             clk_osc_32Mhz           : out   std_logic; 
             sram_data               : inout std_logic_vector (7 downto 0); 
             sram_ce                 : out   std_logic; 
             sram_we                 : out   std_logic; 
             sram_oe                 : out   std_logic; 
             CLK                     : in    std_logic; 
             SPI_MISO                : in    std_logic; 
             RXD                     : in    std_logic; 
             wishbone_slot_5_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_5_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_6_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_6_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_8_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_8_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_9_in      : out   std_logic_vector (61 downto 0); 
             wishbone_slot_9_out     : in    std_logic_vector (33 downto 0); 
             wishbone_slot_10_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_10_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_11_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_11_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_12_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_12_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_13_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_13_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_14_in     : out   std_logic_vector (61 downto 0); 
             wishbone_slot_14_out    : in    std_logic_vector (33 downto 0); 
             wishbone_slot_video_in  : in    std_logic_vector (63 downto 0); 
             wishbone_slot_video_out : out   std_logic_vector (33 downto 0); 
             vgaclkout               : out   std_logic; 
             sram_addr               : out   std_logic_vector (18 downto 0));
   end component;
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component PULLDOWN
      port ( O : out   std_logic);
   end component;
   attribute BOX_TYPE of PULLDOWN : component is "BLACK_BOX";
   
   component VIDEO_zpuino_wb_vga_hqvga
      port ( clk_50Mhz    : in    std_logic; 
             vga_hsync    : out   std_logic; 
             vga_vsync    : out   std_logic; 
             vga_r2       : out   std_logic; 
             vga_r1       : out   std_logic; 
             vga_r0       : out   std_logic; 
             vga_g2       : out   std_logic; 
             vga_g1       : out   std_logic; 
             vga_g0       : out   std_logic; 
             vga_b1       : out   std_logic; 
             vga_b0       : out   std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_sa_sigmadeltaDAC
      port ( data_in   : in    std_logic_vector (17 downto 0); 
             audio_out : out   std_logic; 
             clk_96Mhz : in    std_logic);
   end component;
   
   component VIDEO_zpuino_wb_char_ram_8x8_sp
      port ( wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component clk_32to50_dcm
      port ( CLK_IN1  : in    std_logic; 
             CLK_OUT1 : out   std_logic);
   end component;
   
   component COMM_zpuino_wb_UART
      port ( rx           : in    std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0); 
             enabled      : out   std_logic; 
             tx           : out   std_logic);
   end component;
   
   component COMM_zpuino_wb_SPI
      port ( miso         : in    std_logic; 
             sck          : out   std_logic; 
             mosi         : out   std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component MISC_zpuino_sa_splitter4
      port ( in1  : in    std_logic; 
             out1 : out   std_logic; 
             out2 : out   std_logic; 
             out3 : out   std_logic; 
             out4 : out   std_logic);
   end component;
   
   component Computing_Shield_Pinout
      port ( gpio_bus_out : in    std_logic_vector (165 downto 0); 
             gpio_bus_in  : out   std_logic_vector (109 downto 0); 
             WING_AL0     : inout std_logic; 
             WING_AL1     : inout std_logic; 
             WING_AL2     : inout std_logic; 
             WING_AL3     : inout std_logic; 
             WING_AL4     : inout std_logic; 
             WING_AL5     : inout std_logic; 
             WING_AL6     : inout std_logic; 
             WING_AL7     : inout std_logic; 
             WING_AH0     : inout std_logic; 
             WING_AH1     : inout std_logic; 
             WING_AH2     : inout std_logic; 
             WING_AH3     : inout std_logic; 
             WING_AH4     : inout std_logic; 
             WING_AH5     : inout std_logic; 
             WING_BL0     : inout std_logic; 
             WING_BL1     : inout std_logic; 
             WING_BL2     : inout std_logic; 
             WING_BL3     : inout std_logic; 
             WING_BL4     : inout std_logic; 
             WING_BL5     : inout std_logic; 
             WING_BL6     : inout std_logic; 
             WING_BL7     : inout std_logic; 
             VGA_Red2     : in    std_logic; 
             VGA_Red1     : in    std_logic; 
             VGA_Red0     : in    std_logic; 
             VGA_Green2   : in    std_logic; 
             VGA_Green1   : in    std_logic; 
             VGA_Green0   : in    std_logic; 
             VGA_Blue1    : in    std_logic; 
             VGA_Blue0    : in    std_logic; 
             VGA_Hsync    : in    std_logic; 
             VGA_Vsync    : in    std_logic; 
             Audio1_Left  : in    std_logic; 
             WING_CL0     : inout std_logic; 
             WING_CL1     : inout std_logic; 
             WING_CL2     : inout std_logic; 
             WING_CL3     : inout std_logic; 
             WING_CL4     : inout std_logic; 
             WING_CL5     : inout std_logic; 
             WING_CL6     : inout std_logic; 
             WING_CL7     : inout std_logic; 
             WING_CH0     : inout std_logic; 
             WING_CH1     : inout std_logic; 
             WING_CH2     : inout std_logic; 
             WING_CH3     : inout std_logic; 
             WING_CH4     : inout std_logic; 
             WING_CH5     : inout std_logic; 
             WING_CH6     : inout std_logic; 
             WING_CH7     : inout std_logic; 
             WING_DL0     : inout std_logic; 
             WING_DL1     : inout std_logic; 
             WING_DL2     : inout std_logic; 
             WING_DL3     : inout std_logic; 
             WING_DL4     : inout std_logic; 
             WING_DL5     : inout std_logic; 
             WING_DL6     : inout std_logic; 
             WING_DL7     : inout std_logic; 
             WING_DH0     : inout std_logic; 
             WING_DH1     : inout std_logic; 
             WING_DH2     : inout std_logic; 
             WING_DH3     : inout std_logic; 
             WING_DH4     : inout std_logic; 
             WING_DH5     : inout std_logic; 
             WING_DH6     : inout std_logic; 
             WING_DH7     : inout std_logic; 
             SD_MISO      : out   std_logic; 
             SD_MOSI      : in    std_logic; 
             RS232_RX     : in    std_logic; 
             RS232_TX     : out   std_logic; 
             SD_SCK       : in    std_logic; 
             Audio1_Right : in    std_logic; 
             Audio2_Right : in    std_logic; 
             Audio2_Left  : in    std_logic);
   end component;
   
begin
   XLXI_31 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_442(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_443(33 downto 0));
   
   XLXI_36 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_432(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_433(33 downto 0));
   
   XLXI_37 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_430(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_431(33 downto 0));
   
   XLXI_38 : AUDIO_zpuino_wb_passthrough
      port map (wishbone_in(61 downto 0)=>XLXN_448(61 downto 0),
                raw_out(17 downto 0)=>XLXN_450(17 downto 0),
                wishbone_out(33 downto 0)=>XLXN_449(33 downto 0));
   
   XLXI_39 : ZPUino_Papilio_DUO_V1
      port map (CLK=>CLK,
                gpio_bus_in(109 downto 0)=>XLXN_409(109 downto 0),
                RXD=>RXD,
                SPI_MISO=>SPI_MISO,
                wishbone_slot_video_in(63 downto 
            0)=>XLXI_39_wishbone_slot_video_in_openSignal(63 downto 0),
                wishbone_slot_5_out(33 downto 0)=>XLXN_449(33 downto 0),
                wishbone_slot_6_out(33 downto 0)=>XLXN_623(33 downto 0),
                wishbone_slot_8_out(33 downto 0)=>XLXN_443(33 downto 0),
                wishbone_slot_9_out(33 downto 0)=>XLXN_537(33 downto 0),
                wishbone_slot_10_out(33 downto 0)=>XLXN_568(33 downto 0),
                wishbone_slot_11_out(33 downto 0)=>XLXN_628(33 downto 0),
                wishbone_slot_12_out(33 downto 0)=>XLXN_632(33 downto 0),
                wishbone_slot_13_out(33 downto 0)=>XLXN_433(33 downto 0),
                wishbone_slot_14_out(33 downto 0)=>XLXN_431(33 downto 0),
                clk_osc_32Mhz=>XLXN_549,
                clk_1Mhz=>open,
                clk_96Mhz=>XLXN_452,
                gpio_bus_out(165 downto 0)=>XLXN_408(165 downto 0),
                SPI_MOSI=>SPI_MOSI,
                SPI_SCK=>SPI_SCK,
                sram_addr(18 downto 0)=>sram_addr(18 downto 0),
                sram_ce=>sram_ce,
                sram_oe=>sram_oe,
                sram_we=>sram_we,
                TXD=>TXD,
                vgaclkout=>open,
                wishbone_slot_video_out=>open,
                wishbone_slot_5_in(61 downto 0)=>XLXN_448(61 downto 0),
                wishbone_slot_6_in(61 downto 0)=>XLXN_622(61 downto 0),
                wishbone_slot_8_in(61 downto 0)=>XLXN_442(61 downto 0),
                wishbone_slot_9_in(61 downto 0)=>XLXN_536(61 downto 0),
                wishbone_slot_10_in(61 downto 0)=>XLXN_567(61 downto 0),
                wishbone_slot_11_in(61 downto 0)=>XLXN_627(61 downto 0),
                wishbone_slot_12_in(61 downto 0)=>XLXN_631(61 downto 0),
                wishbone_slot_13_in(61 downto 0)=>XLXN_432(61 downto 0),
                wishbone_slot_14_in(61 downto 0)=>XLXN_430(61 downto 0),
                SPI_CS=>SPI_CS,
                sram_data(7 downto 0)=>sram_data(7 downto 0));
   
   XLXI_45 : OBUF
      port map (I=>XLXN_456,
                O=>ARD_RESET);
   
   XLXI_47 : PULLDOWN
      port map (O=>XLXN_456);
   
   XLXI_54 : VIDEO_zpuino_wb_vga_hqvga
      port map (clk_50Mhz=>XLXN_596,
                wishbone_in(61 downto 0)=>XLXN_536(61 downto 0),
                vga_b0=>XLXN_593,
                vga_b1=>XLXN_592,
                vga_g0=>XLXN_591,
                vga_g1=>XLXN_590,
                vga_g2=>XLXN_589,
                vga_hsync=>XLXN_584,
                vga_r0=>XLXN_588,
                vga_r1=>XLXN_587,
                vga_r2=>XLXN_586,
                vga_vsync=>XLXN_585,
                wishbone_out(33 downto 0)=>XLXN_537(33 downto 0));
   
   XLXI_58 : AUDIO_zpuino_sa_sigmadeltaDAC
      port map (clk_96Mhz=>XLXN_452,
                data_in(17 downto 0)=>XLXN_450(17 downto 0),
                audio_out=>XLXN_626);
   
   XLXI_62 : VIDEO_zpuino_wb_char_ram_8x8_sp
      port map (wishbone_in(61 downto 0)=>XLXN_567(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_568(33 downto 0));
   
   XLXI_64 : clk_32to50_dcm
      port map (CLK_IN1=>XLXN_549,
                CLK_OUT1=>XLXN_596);
   
   XLXI_73 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_622(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_623(33 downto 0));
   
   XLXI_81 : COMM_zpuino_wb_UART
      port map (rx=>XLXN_630,
                wishbone_in(61 downto 0)=>XLXN_627(61 downto 0),
                enabled=>open,
                tx=>XLXN_629,
                wishbone_out(33 downto 0)=>XLXN_628(33 downto 0));
   
   XLXI_82 : COMM_zpuino_wb_SPI
      port map (miso=>XLXN_633,
                wishbone_in(61 downto 0)=>XLXN_631(61 downto 0),
                mosi=>XLXN_634,
                sck=>XLXN_635,
                wishbone_out(33 downto 0)=>XLXN_632(33 downto 0));
   
   XLXI_84 : MISC_zpuino_sa_splitter4
      port map (in1=>XLXN_626,
                out1=>XLXN_639,
                out2=>XLXN_640,
                out3=>XLXN_641,
                out4=>XLXN_642);
   
   XLXI_86 : Computing_Shield_Pinout
      port map (Audio1_Left=>XLXN_639,
                Audio1_Right=>XLXN_640,
                Audio2_Left=>XLXN_641,
                Audio2_Right=>XLXN_642,
                gpio_bus_out(165 downto 0)=>XLXN_408(165 downto 0),
                RS232_RX=>XLXN_629,
                SD_MOSI=>XLXN_634,
                SD_SCK=>XLXN_635,
                VGA_Blue0=>XLXN_593,
                VGA_Blue1=>XLXN_592,
                VGA_Green0=>XLXN_591,
                VGA_Green1=>XLXN_590,
                VGA_Green2=>XLXN_589,
                VGA_Hsync=>XLXN_584,
                VGA_Red0=>XLXN_588,
                VGA_Red1=>XLXN_587,
                VGA_Red2=>XLXN_586,
                VGA_Vsync=>XLXN_585,
                gpio_bus_in(109 downto 0)=>XLXN_409(109 downto 0),
                RS232_TX=>XLXN_630,
                SD_MISO=>XLXN_633,
                WING_AH0=>Arduino_8,
                WING_AH1=>Arduino_9,
                WING_AH2=>Arduino_10,
                WING_AH3=>Arduino_11,
                WING_AH4=>Arduino_12,
                WING_AH5=>Arduino_13,
                WING_AL0=>Arduino_0,
                WING_AL1=>Arduino_1,
                WING_AL2=>Arduino_2,
                WING_AL3=>Arduino_3,
                WING_AL4=>Arduino_4,
                WING_AL5=>Arduino_5,
                WING_AL6=>Arduino_6,
                WING_AL7=>Arduino_7,
                WING_BL0=>Arduino_21,
                WING_BL1=>Arduino_20,
                WING_BL2=>Arduino_19,
                WING_BL3=>Arduino_18,
                WING_BL4=>Arduino_17,
                WING_BL5=>Arduino_16,
                WING_BL6=>Arduino_15,
                WING_BL7=>Arduino_14,
                WING_CH0=>Arduino_38,
                WING_CH1=>Arduino_40,
                WING_CH2=>Arduino_42,
                WING_CH3=>Arduino_44,
                WING_CH4=>Arduino_46,
                WING_CH5=>Arduino_48,
                WING_CH6=>Arduino_50,
                WING_CH7=>Arduino_52,
                WING_CL0=>Arduino_22,
                WING_CL1=>Arduino_24,
                WING_CL2=>Arduino_26,
                WING_CL3=>Arduino_28,
                WING_CL4=>Arduino_30,
                WING_CL5=>Arduino_32,
                WING_CL6=>Arduino_34,
                WING_CL7=>Arduino_36,
                WING_DH0=>Arduino_37,
                WING_DH1=>Arduino_35,
                WING_DH2=>Arduino_33,
                WING_DH3=>Arduino_31,
                WING_DH4=>Arduino_29,
                WING_DH5=>Arduino_27,
                WING_DH6=>Arduino_25,
                WING_DH7=>Arduino_23,
                WING_DL0=>Arduino_53,
                WING_DL1=>Arduino_51,
                WING_DL2=>Arduino_49,
                WING_DL3=>Arduino_47,
                WING_DL4=>Arduino_45,
                WING_DL5=>Arduino_43,
                WING_DL6=>Arduino_41,
                WING_DL7=>Arduino_39);
   
end BEHAVIORAL;


