--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_Pro.vhf
-- /___/   /\     Timestamp : 08/27/2014 14:10:08
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug/LX9/Papilio_Pro.vhf -w D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug/Papilio_Pro.sch
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
   port ( ARD_SPI_MISO     : in    std_logic; 
          DRAGON_SPI_MOSI  : in    std_logic; 
          DRAGON_SPI_RESET : in    std_logic; 
          DRAGON_SPI_SCK   : in    std_logic; 
          WING_BL2         : in    std_logic; 
          ARD_RESET        : out   std_logic; 
          ARD_SPI_MOSI     : out   std_logic; 
          ARD_SPI_SCLK     : out   std_logic; 
          ARD_TMS          : out   std_logic; 
          DRAGON_SPI_GND   : out   std_logic; 
          DRAGON_SPI_MISO  : out   std_logic; 
          DRAGON_SPI_VTG   : out   std_logic);
end Papilio_Pro;

architecture BEHAVIORAL of Papilio_Pro is
   attribute BOX_TYPE   : string ;
   component HappyJTAG2
      port ( FT_TCK    : in    std_logic; 
             FT_MOSI   : in    std_logic; 
             FT_MISO   : out   std_logic; 
             FT_TMS    : in    std_logic; 
             FT_RESET  : in    std_logic; 
             AVR_TCK   : out   std_logic; 
             AVR_TDI   : out   std_logic; 
             AVR_TDO   : in    std_logic; 
             AVR_TMS   : out   std_logic; 
             AVR_RESET : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   XLXI_40 : HappyJTAG2
      port map (AVR_TDO=>ARD_SPI_MISO,
                FT_MOSI=>DRAGON_SPI_MOSI,
                FT_RESET=>DRAGON_SPI_RESET,
                FT_TCK=>DRAGON_SPI_SCK,
                FT_TMS=>WING_BL2,
                AVR_RESET=>ARD_RESET,
                AVR_TCK=>ARD_SPI_SCLK,
                AVR_TDI=>ARD_SPI_MOSI,
                AVR_TMS=>ARD_TMS,
                FT_MISO=>DRAGON_SPI_MISO);
   
   XLXI_41 : GND
      port map (G=>DRAGON_SPI_GND);
   
   XLXI_42 : VCC
      port map (P=>DRAGON_SPI_VTG);
   
end BEHAVIORAL;


