--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : 
--  /   /         Filename : xil_9956_21
-- /___/   /\     Timestamp : 03/26/2014 16:22:05
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

entity HappyJTAG2 is
   port ( AVR_TDO   : in    std_logic; 
          FT_MOSI   : in    std_logic; 
          FT_RESET  : in    std_logic; 
          FT_TCK    : in    std_logic; 
          FT_TMS    : in    std_logic; 
          AVR_RESET : out   std_logic; 
          AVR_TCK   : out   std_logic; 
          AVR_TDI   : out   std_logic; 
          AVR_TMS   : out   std_logic; 
          FT_MISO   : out   std_logic);
end HappyJTAG2;

architecture BEHAVIORAL of HappyJTAG2 is
begin

AVR_TCK <= FT_TCK;
AVR_TDI <= FT_MOSI;
FT_MISO <= AVR_TDO;
AVR_TMS <= FT_TMS;
AVR_RESET <= FT_RESET;


end BEHAVIORAL;

-- synopsys translate_off
configuration CFG_HappyJTAG2 of  HappyJTAG2 is
   for BEHAVIORAL
   end for;
end CFG_HappyJTAG2;
-- synopsys translate_on

