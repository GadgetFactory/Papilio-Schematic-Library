--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_Pro.vhf
-- /___/   /\     Timestamp : 01/28/2014 16:32:09
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Audio_RetroCade_Synth/LX9 -intstyle ise -family spartan6 -flat -suppress -vhdl C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Audio_RetroCade_Synth/LX9/Papilio_Pro.vhf -w C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Audio_RetroCade_Synth/Papilio_Pro.sch
--Design Name: Papilio_Pro
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

entity Papilio_Pro is
   port ( CLK        : in    std_logic; 
          RXD        : in    std_logic; 
          SPI_MISO   : in    std_logic; 
          WING_CL1   : in    std_logic; 
          WING_CL3   : in    std_logic; 
          WING_CL7   : in    std_logic; 
          DRAM_ADDR  : out   std_logic_vector (12 downto 0); 
          DRAM_BA    : out   std_logic_vector (1 downto 0); 
          DRAM_CAS_N : out   std_logic; 
          DRAM_CKE   : out   std_logic; 
          DRAM_CLK   : out   std_logic; 
          DRAM_CS_N  : out   std_logic; 
          DRAM_DQM   : out   std_logic_vector (1 downto 0); 
          DRAM_RAS_N : out   std_logic; 
          DRAM_WE_N  : out   std_logic; 
          LED        : out   std_logic; 
          SPI_MOSI   : out   std_logic; 
          SPI_SCK    : out   std_logic; 
          TXD        : out   std_logic; 
          WING_BL0   : out   std_logic; 
          WING_BL1   : out   std_logic; 
          WING_BL2   : out   std_logic; 
          WING_BL3   : out   std_logic; 
          WING_CH0   : out   std_logic; 
          WING_CL0   : out   std_logic; 
          WING_CL2   : out   std_logic; 
          WING_CL4   : out   std_logic; 
          WING_CL6   : out   std_logic; 
          DRAM_DQ    : inout std_logic_vector (15 downto 0); 
          SPI_CS     : inout std_logic; 
          WING_AH0   : inout std_logic; 
          WING_AH1   : inout std_logic; 
          WING_AH2   : inout std_logic; 
          WING_AH3   : inout std_logic; 
          WING_AH4   : inout std_logic; 
          WING_AH5   : inout std_logic; 
          WING_AH6   : inout std_logic; 
          WING_AH7   : inout std_logic; 
          WING_AL0   : inout std_logic; 
          WING_AL1   : inout std_logic; 
          WING_AL2   : inout std_logic; 
          WING_AL3   : inout std_logic; 
          WING_AL4   : inout std_logic; 
          WING_AL5   : inout std_logic; 
          WING_AL6   : inout std_logic; 
          WING_AL7   : inout std_logic; 
          WING_BH0   : inout std_logic; 
          WING_BH1   : inout std_logic; 
          WING_BH2   : inout std_logic; 
          WING_BH3   : inout std_logic; 
          WING_BH4   : inout std_logic; 
          WING_BH5   : inout std_logic; 
          WING_BH6   : inout std_logic; 
          WING_BH7   : inout std_logic; 
          WING_BL4   : inout std_logic; 
          WING_BL5   : inout std_logic; 
          WING_BL6   : inout std_logic; 
          WING_BL7   : inout std_logic; 
          WING_CH1   : inout std_logic; 
          WING_CH2   : inout std_logic; 
          WING_CH3   : inout std_logic; 
          WING_CH4   : inout std_logic; 
          WING_CH5   : inout std_logic; 
          WING_CH6   : inout std_logic; 
          WING_CH7   : inout std_logic; 
          WING_CL5   : inout std_logic);
end Papilio_Pro;

architecture BEHAVIORAL of Papilio_Pro is
   attribute BOX_TYPE   : string ;
   signal XLXN_329                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_330                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_331                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_332                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_333                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_334                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_335                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_336                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_408                                  : std_logic_vector (147 
         downto 0);
   signal XLXN_409                                  : std_logic_vector (97 
         downto 0);
   signal XLXN_434                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_435                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_438                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_439                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_440                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_441                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_448                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_449                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_453                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_454                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_471                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_472                                  : std_logic_vector (7 
         downto 0);
   signal XLXN_473                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_474                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_475                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_476                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_477                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_478                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_484                                  : std_logic_vector (17 
         downto 0);
   signal XLXN_504                                  : std_logic;
   signal XLXN_509                                  : std_logic;
   signal XLXN_511                                  : std_logic;
   signal XLXN_514                                  : std_logic_vector (17 
         downto 0);
   signal XLXN_515                                  : std_logic_vector (17 
         downto 0);
   signal XLXN_516                                  : std_logic;
   signal XLXN_517                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_518                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_519                                  : std_logic_vector (61 
         downto 0);
   signal XLXN_520                                  : std_logic_vector (33 
         downto 0);
   signal XLXN_533                                  : std_logic;
   signal XLXI_28_wishbone_slot_video_in_openSignal : std_logic_vector (63 
         downto 0);
   component Papilio_Wing_Pinout
      port ( gpio_bus_out     : in    std_logic_vector (147 downto 0); 
             gpio_bus_in      : out   std_logic_vector (97 downto 0); 
             WING_AH0         : inout std_logic; 
             WING_AH1         : inout std_logic; 
             WING_AH2         : inout std_logic; 
             WING_AH3         : inout std_logic; 
             WING_AH4         : inout std_logic; 
             WING_AH5         : inout std_logic; 
             WING_AH6         : inout std_logic; 
             WING_AH7         : inout std_logic; 
             WING_AL0         : inout std_logic; 
             WING_AL1         : inout std_logic; 
             WING_AL2         : inout std_logic; 
             WING_AL3         : inout std_logic; 
             WING_AL4         : inout std_logic; 
             WING_AL5         : inout std_logic; 
             WING_AL6         : inout std_logic; 
             WING_AL7         : inout std_logic; 
             WING_BH0         : inout std_logic; 
             WING_BH1         : inout std_logic; 
             WING_BH2         : inout std_logic; 
             WING_BH3         : inout std_logic; 
             WING_BH4         : inout std_logic; 
             WING_BH5         : inout std_logic; 
             WING_BH6         : inout std_logic; 
             WING_BH7         : inout std_logic; 
             WING_BL0         : inout std_logic; 
             WING_BL1         : inout std_logic; 
             WING_BL2         : inout std_logic; 
             WING_BL3         : inout std_logic; 
             WING_BL4         : inout std_logic; 
             WING_BL5         : inout std_logic; 
             WING_BL6         : inout std_logic; 
             WING_BL7         : inout std_logic; 
             WING_CL0         : inout std_logic; 
             WING_CL1         : inout std_logic; 
             WING_CL2         : inout std_logic; 
             WING_CL3         : inout std_logic; 
             WING_CL4         : inout std_logic; 
             WING_CL5         : inout std_logic; 
             WING_CL6         : inout std_logic; 
             WING_CL7         : inout std_logic; 
             WING_CH0         : inout std_logic; 
             WING_CH1         : inout std_logic; 
             WING_CH2         : inout std_logic; 
             WING_CH3         : inout std_logic; 
             WING_CH4         : inout std_logic; 
             WING_CH5         : inout std_logic; 
             WING_CH6         : inout std_logic; 
             WING_CH7         : inout std_logic; 
             WingType_miso_BH : inout std_logic_vector (7 downto 0); 
             WingType_miso_BL : inout std_logic_vector (7 downto 0); 
             WingType_miso_AH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_BL : inout std_logic_vector (7 downto 0); 
             WingType_mosi_BH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_CL : inout std_logic_vector (7 downto 0); 
             WingType_mosi_AH : inout std_logic_vector (7 downto 0); 
             WingType_miso_CL : inout std_logic_vector (7 downto 0); 
             WingType_miso_CH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_CH : inout std_logic_vector (7 downto 0); 
             WingType_mosi_AL : inout std_logic_vector (7 downto 0); 
             WingType_miso_AL : inout std_logic_vector (7 downto 0));
   end component;
   
   component Wing_GPIO
      port ( wt_miso : inout std_logic_vector (7 downto 0); 
             wt_mosi : inout std_logic_vector (7 downto 0));
   end component;
   
   component ZPUino_Papilio_Pro_V1
      port ( gpio_bus_out            : out   std_logic_vector (147 downto 0); 
             gpio_bus_in             : in    std_logic_vector (97 downto 0); 
             SPI_CS                  : inout std_logic; 
             TXD                     : out   std_logic; 
             SPI_MOSI                : out   std_logic; 
             SPI_SCK                 : out   std_logic; 
             clk_96Mhz               : out   std_logic; 
             clk_1Mhz                : out   std_logic; 
             clk_osc_32Mhz           : out   std_logic; 
             DRAM_DQ                 : inout std_logic_vector (15 downto 0); 
             LED                     : out   std_logic; 
             DRAM_CAS_N              : out   std_logic; 
             DRAM_CKE                : out   std_logic; 
             DRAM_CLK                : out   std_logic; 
             DRAM_CS_N               : out   std_logic; 
             DRAM_RAS_N              : out   std_logic; 
             DRAM_WE_N               : out   std_logic; 
             DRAM_ADDR               : out   std_logic_vector (12 downto 0); 
             DRAM_BA                 : out   std_logic_vector (1 downto 0); 
             DRAM_DQM                : out   std_logic_vector (1 downto 0); 
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
             vgaclkout               : out   std_logic);
   end component;
   
   component Wishbone_Empty_Slot
      port ( wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_wb_passthrough
      port ( raw_out      : out   std_logic_vector (17 downto 0); 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_wb_YM2149
      port ( data_out     : out   std_logic_vector (17 downto 0); 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component AUDIO_zpuino_wb_sid6581
      port ( clk_1MHZ     : in    std_logic; 
             audio_data   : out   std_logic_vector (17 downto 0); 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component COMM_zpuino_wb_UART
      port ( rx           : in    std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0); 
             enabled      : out   std_logic; 
             tx           : out   std_logic);
   end component;
   
   component AUDIO_zpuino_sa_audiomixer
      port ( clk       : in    std_logic; 
             rst       : in    std_logic; 
             ena       : in    std_logic; 
             data_in1  : in    std_logic_vector (17 downto 0); 
             data_in2  : in    std_logic_vector (17 downto 0); 
             data_in3  : in    std_logic_vector (17 downto 0); 
             audio_out : out   std_logic);
   end component;
   
   component MISC_zpuino_sa_splitter4
      port ( in1  : in    std_logic; 
             out1 : out   std_logic; 
             out2 : out   std_logic; 
             out3 : out   std_logic; 
             out4 : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component COMM_zpuino_wb_SPI
      port ( miso         : in    std_logic; 
             sck          : out   std_logic; 
             mosi         : out   std_logic; 
             wishbone_in  : in    std_logic_vector (61 downto 0); 
             wishbone_out : out   std_logic_vector (33 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   XLXI_20 : Papilio_Wing_Pinout
      port map (gpio_bus_out(147 downto 0)=>XLXN_408(147 downto 0),
                gpio_bus_in(97 downto 0)=>XLXN_409(97 downto 0),
                WingType_miso_AH(7 downto 0)=>XLXN_333(7 downto 0),
                WingType_miso_AL(7 downto 0)=>XLXN_335(7 downto 0),
                WingType_miso_BH(7 downto 0)=>XLXN_329(7 downto 0),
                WingType_miso_BL(7 downto 0)=>XLXN_331(7 downto 0),
                WingType_miso_CH(7 downto 0)=>XLXN_453(7 downto 0),
                WingType_miso_CL(7 downto 0)=>XLXN_471(7 downto 0),
                WingType_mosi_AH(7 downto 0)=>XLXN_334(7 downto 0),
                WingType_mosi_AL(7 downto 0)=>XLXN_336(7 downto 0),
                WingType_mosi_BH(7 downto 0)=>XLXN_330(7 downto 0),
                WingType_mosi_BL(7 downto 0)=>XLXN_332(7 downto 0),
                WingType_mosi_CH(7 downto 0)=>XLXN_454(7 downto 0),
                WingType_mosi_CL(7 downto 0)=>XLXN_472(7 downto 0),
                WING_AH0=>WING_AH0,
                WING_AH1=>WING_AH1,
                WING_AH2=>WING_AH2,
                WING_AH3=>WING_AH3,
                WING_AH4=>WING_AH4,
                WING_AH5=>WING_AH5,
                WING_AH6=>WING_AH6,
                WING_AH7=>WING_AH7,
                WING_AL0=>WING_AL0,
                WING_AL1=>WING_AL1,
                WING_AL2=>WING_AL2,
                WING_AL3=>WING_AL3,
                WING_AL4=>WING_AL4,
                WING_AL5=>WING_AL5,
                WING_AL6=>WING_AL6,
                WING_AL7=>WING_AL7,
                WING_BH0=>WING_BH0,
                WING_BH1=>WING_BH1,
                WING_BH2=>WING_BH2,
                WING_BH3=>WING_BH3,
                WING_BH4=>WING_BH4,
                WING_BH5=>WING_BH5,
                WING_BH6=>WING_BH6,
                WING_BH7=>WING_BH7,
                WING_BL0=>open,
                WING_BL1=>open,
                WING_BL2=>open,
                WING_BL3=>open,
                WING_BL4=>WING_BL4,
                WING_BL5=>WING_BL5,
                WING_BL6=>WING_BL6,
                WING_BL7=>WING_BL7,
                WING_CH0=>open,
                WING_CH1=>WING_CH1,
                WING_CH2=>WING_CH2,
                WING_CH3=>WING_CH3,
                WING_CH4=>WING_CH4,
                WING_CH5=>WING_CH5,
                WING_CH6=>WING_CH6,
                WING_CH7=>WING_CH7,
                WING_CL0=>open,
                WING_CL1=>open,
                WING_CL2=>open,
                WING_CL3=>open,
                WING_CL4=>open,
                WING_CL5=>WING_CL5,
                WING_CL6=>open,
                WING_CL7=>open);
   
   XLXI_24 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_329(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_330(7 downto 0));
   
   XLXI_25 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_331(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_332(7 downto 0));
   
   XLXI_26 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_333(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_334(7 downto 0));
   
   XLXI_27 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_335(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_336(7 downto 0));
   
   XLXI_28 : ZPUino_Papilio_Pro_V1
      port map (CLK=>CLK,
                gpio_bus_in(97 downto 0)=>XLXN_409(97 downto 0),
                RXD=>RXD,
                SPI_MISO=>SPI_MISO,
                wishbone_slot_video_in(63 downto 
            0)=>XLXI_28_wishbone_slot_video_in_openSignal(63 downto 0),
                wishbone_slot_5_out(33 downto 0)=>XLXN_449(33 downto 0),
                wishbone_slot_6_out(33 downto 0)=>XLXN_518(33 downto 0),
                wishbone_slot_8_out(33 downto 0)=>XLXN_520(33 downto 0),
                wishbone_slot_9_out(33 downto 0)=>XLXN_441(33 downto 0),
                wishbone_slot_10_out(33 downto 0)=>XLXN_439(33 downto 0),
                wishbone_slot_11_out(33 downto 0)=>XLXN_478(33 downto 0),
                wishbone_slot_12_out(33 downto 0)=>XLXN_435(33 downto 0),
                wishbone_slot_13_out(33 downto 0)=>XLXN_474(33 downto 0),
                wishbone_slot_14_out(33 downto 0)=>XLXN_476(33 downto 0),
                clk_osc_32Mhz=>open,
                clk_1Mhz=>XLXN_509,
                clk_96Mhz=>XLXN_511,
                DRAM_ADDR(12 downto 0)=>DRAM_ADDR(12 downto 0),
                DRAM_BA(1 downto 0)=>DRAM_BA(1 downto 0),
                DRAM_CAS_N=>DRAM_CAS_N,
                DRAM_CKE=>DRAM_CKE,
                DRAM_CLK=>DRAM_CLK,
                DRAM_CS_N=>DRAM_CS_N,
                DRAM_DQM(1 downto 0)=>DRAM_DQM(1 downto 0),
                DRAM_RAS_N=>DRAM_RAS_N,
                DRAM_WE_N=>DRAM_WE_N,
                gpio_bus_out(147 downto 0)=>XLXN_408(147 downto 0),
                LED=>LED,
                SPI_MOSI=>SPI_MOSI,
                SPI_SCK=>SPI_SCK,
                TXD=>TXD,
                vgaclkout=>open,
                wishbone_slot_video_out=>open,
                wishbone_slot_5_in(61 downto 0)=>XLXN_448(61 downto 0),
                wishbone_slot_6_in(61 downto 0)=>XLXN_517(61 downto 0),
                wishbone_slot_8_in(61 downto 0)=>XLXN_519(61 downto 0),
                wishbone_slot_9_in(61 downto 0)=>XLXN_440(61 downto 0),
                wishbone_slot_10_in(61 downto 0)=>XLXN_438(61 downto 0),
                wishbone_slot_11_in(61 downto 0)=>XLXN_477(61 downto 0),
                wishbone_slot_12_in(61 downto 0)=>XLXN_434(61 downto 0),
                wishbone_slot_13_in(61 downto 0)=>XLXN_473(61 downto 0),
                wishbone_slot_14_in(61 downto 0)=>XLXN_475(61 downto 0),
                DRAM_DQ(15 downto 0)=>DRAM_DQ(15 downto 0),
                SPI_CS=>SPI_CS);
   
   XLXI_32 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_440(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_441(33 downto 0));
   
   XLXI_33 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_438(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_439(33 downto 0));
   
   XLXI_35 : Wishbone_Empty_Slot
      port map (wishbone_in(61 downto 0)=>XLXN_434(61 downto 0),
                wishbone_out(33 downto 0)=>XLXN_435(33 downto 0));
   
   XLXI_38 : AUDIO_zpuino_wb_passthrough
      port map (wishbone_in(61 downto 0)=>XLXN_448(61 downto 0),
                raw_out(17 downto 0)=>XLXN_484(17 downto 0),
                wishbone_out(33 downto 0)=>XLXN_449(33 downto 0));
   
   XLXI_49 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_471(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_472(7 downto 0));
   
   XLXI_50 : AUDIO_zpuino_wb_YM2149
      port map (wishbone_in(61 downto 0)=>XLXN_473(61 downto 0),
                data_out(17 downto 0)=>XLXN_515(17 downto 0),
                wishbone_out(33 downto 0)=>XLXN_474(33 downto 0));
   
   XLXI_51 : AUDIO_zpuino_wb_sid6581
      port map (clk_1MHZ=>XLXN_509,
                wishbone_in(61 downto 0)=>XLXN_475(61 downto 0),
                audio_data(17 downto 0)=>XLXN_514(17 downto 0),
                wishbone_out(33 downto 0)=>XLXN_476(33 downto 0));
   
   XLXI_52 : COMM_zpuino_wb_UART
      port map (rx=>WING_CL1,
                wishbone_in(61 downto 0)=>XLXN_477(61 downto 0),
                enabled=>open,
                tx=>WING_CL0,
                wishbone_out(33 downto 0)=>XLXN_478(33 downto 0));
   
   XLXI_53 : Wing_GPIO
      port map (wt_miso(7 downto 0)=>XLXN_453(7 downto 0),
                wt_mosi(7 downto 0)=>XLXN_454(7 downto 0));
   
   XLXI_54 : AUDIO_zpuino_sa_audiomixer
      port map (clk=>XLXN_511,
                data_in1(17 downto 0)=>XLXN_514(17 downto 0),
                data_in2(17 downto 0)=>XLXN_515(17 downto 0),
                data_in3(17 downto 0)=>XLXN_484(17 downto 0),
                ena=>XLXN_533,
                rst=>XLXN_516,
                audio_out=>XLXN_504);
   
   XLXI_58 : MISC_zpuino_sa_splitter4
      port map (in1=>XLXN_504,
                out1=>WING_BL0,
                out2=>WING_BL1,
                out3=>WING_BL2,
                out4=>WING_BL3);
   
   XLXI_59 : GND
      port map (G=>XLXN_516);
   
   XLXI_61 : COMM_zpuino_wb_SPI
      port map (miso=>WING_CL3,
                wishbone_in(61 downto 0)=>XLXN_517(61 downto 0),
                mosi=>WING_CL4,
                sck=>WING_CL2,
                wishbone_out(33 downto 0)=>XLXN_518(33 downto 0));
   
   XLXI_62 : COMM_zpuino_wb_SPI
      port map (miso=>WING_CL7,
                wishbone_in(61 downto 0)=>XLXN_519(61 downto 0),
                mosi=>WING_CH0,
                sck=>WING_CL6,
                wishbone_out(33 downto 0)=>XLXN_520(33 downto 0));
   
   XLXI_63 : VCC
      port map (P=>XLXN_533);
   
end BEHAVIORAL;


