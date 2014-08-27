--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_Pro.vhf
-- /___/   /\     Timestamp : 04/30/2014 15:10:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Virtual_Dashboard_Counter_Example/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Virtual_Dashboard_Counter_Example/LX9/Papilio_Pro.vhf -w C:/dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Virtual_Dashboard_Counter_Example/Papilio_Pro.sch
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
   port ( clk      : in    std_logic; 
          rxd      : in    std_logic; 
          txd      : out   std_logic; 
          WING_AL1 : out   std_logic; 
          WING_AH0 : inout std_logic; 
          WING_AH2 : inout std_logic; 
          WING_AH4 : inout std_logic; 
          WING_AH6 : inout std_logic; 
          WING_AL0 : inout std_logic; 
          WING_AL2 : inout std_logic; 
          WING_AL4 : inout std_logic; 
          WING_AL6 : inout std_logic);
end Papilio_Pro;

architecture BEHAVIORAL of Papilio_Pro is
   attribute brams      : string ;
   signal XLXN_854 : std_logic;
   signal XLXN_863 : std_logic;
   component papilio_clocks
      port ( CLK        : in    std_logic; 
             CLK_100Mhz : out   std_logic; 
             CLK_50Mhz  : out   std_logic; 
             CLK_32Mhz  : out   std_logic; 
             CLK_25Mhz  : out   std_logic; 
             CLK_10Mhz  : out   std_logic; 
             CLK_8Mhz   : out   std_logic);
   end component;
   
   component clk_divider_30to1hz
      port ( clk_32Mhz  : in    std_logic; 
             div19_30hz : out   std_logic; 
             div20_15hz : out   std_logic; 
             div21_8hz  : out   std_logic; 
             div22_4hz  : out   std_logic; 
             div23_2hz  : out   std_logic; 
             div24_1hz  : out   std_logic);
   end component;
   
   component BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag
      port ( led0      : in    std_logic; 
             led1      : in    std_logic; 
             led2      : in    std_logic; 
             led3      : in    std_logic; 
             led4      : in    std_logic; 
             led5      : in    std_logic; 
             led6      : in    std_logic; 
             led7      : in    std_logic; 
             switch0   : out   std_logic; 
             switch1   : out   std_logic; 
             switch2   : out   std_logic; 
             switch3   : out   std_logic; 
             switch4   : out   std_logic; 
             switch5   : out   std_logic; 
             switch6   : out   std_logic; 
             switch7   : out   std_logic; 
             clk_32Mhz : in    std_logic);
   end component;
   
   component BENCHY_sa_SumpBlaze_LogicAnalyzer8
      generic( brams : integer :=  12);
      port ( clk_32Mhz : in    std_logic; 
             la0       : in    std_logic; 
             rx        : in    std_logic; 
             tx        : out   std_logic; 
             la1       : in    std_logic; 
             la2       : in    std_logic; 
             la3       : in    std_logic; 
             la4       : in    std_logic; 
             la5       : in    std_logic; 
             la6       : in    std_logic; 
             la7       : in    std_logic);
   end component;
   attribute brams of BENCHY_sa_SumpBlaze_LogicAnalyzer8 : component is "12";
   
   component Counter8
      port ( clk    : in    std_logic; 
             count0 : out   std_logic; 
             count1 : out   std_logic; 
             count2 : out   std_logic; 
             count3 : out   std_logic; 
             count4 : out   std_logic; 
             count5 : out   std_logic; 
             count6 : out   std_logic; 
             count7 : out   std_logic; 
             reset  : out   std_logic);
   end component;
   
begin
   XLXI_95 : papilio_clocks
      port map (CLK=>clk,
                CLK_8Mhz=>open,
                CLK_10Mhz=>open,
                CLK_25Mhz=>open,
                CLK_32Mhz=>XLXN_863,
                CLK_50Mhz=>open,
                CLK_100Mhz=>open);
   
   XLXI_99 : clk_divider_30to1hz
      port map (clk_32Mhz=>XLXN_863,
                div19_30hz=>open,
                div20_15hz=>open,
                div21_8hz=>open,
                div22_4hz=>open,
                div23_2hz=>open,
                div24_1hz=>XLXN_854);
   
   XLXI_111 : BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag
      port map (clk_32Mhz=>XLXN_863,
                led0=>WING_AL0,
                led1=>WING_AL2,
                led2=>WING_AL4,
                led3=>WING_AL6,
                led4=>WING_AH0,
                led5=>WING_AH2,
                led6=>WING_AH4,
                led7=>WING_AH6,
                switch0=>open,
                switch1=>open,
                switch2=>open,
                switch3=>open,
                switch4=>open,
                switch5=>open,
                switch6=>open,
                switch7=>open);
   
   XLXI_112 : BENCHY_sa_SumpBlaze_LogicAnalyzer8
      port map (clk_32Mhz=>XLXN_863,
                la0=>WING_AL0,
                la1=>WING_AL2,
                la2=>WING_AL4,
                la3=>WING_AL6,
                la4=>WING_AH0,
                la5=>WING_AH2,
                la6=>WING_AH4,
                la7=>WING_AH6,
                rx=>rxd,
                tx=>txd);
   
   XLXI_113 : Counter8
      port map (clk=>XLXN_854,
                count0=>WING_AL0,
                count1=>WING_AL2,
                count2=>WING_AL4,
                count3=>WING_AL6,
                count4=>WING_AH0,
                count5=>WING_AH2,
                count6=>WING_AH4,
                count7=>WING_AH6,
                reset=>WING_AL1);
   
end BEHAVIORAL;


