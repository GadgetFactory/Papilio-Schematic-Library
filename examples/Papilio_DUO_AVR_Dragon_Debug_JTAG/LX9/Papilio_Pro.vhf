--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Papilio_Pro.vhf
-- /___/   /\     Timestamp : 08/27/2014 17:38:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug_JTAG/LX9 -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug_JTAG/LX9/Papilio_Pro.vhf -w D:/Dropbox/GadgetFactory/GadgetFactory_Engineering/Papilio-Schematic-Library/examples/Papilio_DUO_AVR_Dragon_Debug_JTAG/Papilio_Pro.sch
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
   port ( ARD_JTAG_TDO      : in    std_logic; 
          DRAGON_JTAG_RESET : in    std_logic; 
          DRAGON_JTAG_TCK   : in    std_logic; 
          DRAGON_JTAG_TDI   : in    std_logic; 
          DRAGON_JTAG_TMS   : in    std_logic; 
          ARD_JTAG_TCK      : out   std_logic; 
          ARD_JTAG_TDI      : out   std_logic; 
          ARD_JTAG_TMS      : out   std_logic; 
          ARD_RESET         : out   std_logic; 
          DRAGON_JTAG_GND   : out   std_logic; 
          DRAGON_JTAG_GND2  : out   std_logic; 
          DRAGON_JTAG_TDO   : out   std_logic; 
          DRAGON_JTAG_VTG   : out   std_logic);
end Papilio_Pro;

architecture BEHAVIORAL of Papilio_Pro is
   attribute BOX_TYPE   : string ;
   signal ARD_RESET_DUMMY   : std_logic;
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
   
   component PULLUP
      port ( O : out   std_logic);
   end component;
   attribute BOX_TYPE of PULLUP : component is "BLACK_BOX";
   
begin
   ARD_RESET <= ARD_RESET_DUMMY;
   XLXI_40 : HappyJTAG2
      port map (AVR_TDO=>ARD_JTAG_TDO,
                FT_MOSI=>DRAGON_JTAG_TDI,
                FT_RESET=>DRAGON_JTAG_RESET,
                FT_TCK=>DRAGON_JTAG_TCK,
                FT_TMS=>DRAGON_JTAG_TMS,
                AVR_RESET=>ARD_RESET_DUMMY,
                AVR_TCK=>ARD_JTAG_TCK,
                AVR_TDI=>ARD_JTAG_TDI,
                AVR_TMS=>ARD_JTAG_TMS,
                FT_MISO=>DRAGON_JTAG_TDO);
   
   XLXI_41 : GND
      port map (G=>DRAGON_JTAG_GND);
   
   XLXI_42 : VCC
      port map (P=>DRAGON_JTAG_VTG);
   
   XLXI_43 : GND
      port map (G=>DRAGON_JTAG_GND2);
   
   XLXI_52 : PULLUP
      port map (O=>ARD_RESET_DUMMY);
   
end BEHAVIORAL;


