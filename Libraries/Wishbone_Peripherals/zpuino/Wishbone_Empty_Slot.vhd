library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.papilio_pkg.all;

entity Wishbone_Empty_Slot is
  port (
	 wishbone_in : in wishbone_bus_in_type;
	 wishbone_out : out wishbone_bus_out_type  
  
--    wb_clk_i: in std_logic;
--	 	wb_rst_i: in std_logic;
--    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
--    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
--    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
--    wb_we_i:  in std_logic;
--    wb_cyc_i: in std_logic;
--    wb_stb_i: in std_logic;
--    wb_ack_o: out std_logic;
--    wb_inta_o:out std_logic
  );
end entity Wishbone_Empty_Slot;

architecture behave of Wishbone_Empty_Slot is

begin

  wishbone_out.wb_ack_o <= wishbone_in.wb_cyc_i and wishbone_in.wb_stb_i;
  wishbone_out.wb_inta_o <= '0';
  wishbone_out.wb_dat_o <= (others => DontCareValue);

end behave;

