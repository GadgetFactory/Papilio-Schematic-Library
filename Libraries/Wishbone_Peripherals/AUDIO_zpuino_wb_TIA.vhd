--
-- A simulation model of YM2149 (AY-3-8910 with bells on)

-- Copyright (c) MikeJ - Jan 2005
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
-- Clues from MAME sound driver and Kazuhiro TSUJIKAWA
--
-- These are the measured outputs from a real chip for a single Isolated channel into a 1K load (V)
-- vol 15 .. 0
-- 3.27 2.995 2.741 2.588 2.452 2.372 2.301 2.258 2.220 2.198 2.178 2.166 2.155 2.148 2.141 2.132
-- As the envelope volume is 5 bit, I have fitted a curve to the not quite log shape in order
-- to produced all the required values.
-- (The first part of the curve is a bit steeper and the last bit is more linear than expected)
--
-- NOTE, this component uses LINEAR mixing of the three analogue channels, and is only
-- accurate for designs where the outputs are buffered and not simply wired together.
-- The ouput level is more complex in that case and requires a larger table.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

library board;
  use board.zpuino_config.all;
  use board.zpu_config.all;
  use board.zpupkg.all;
  
entity AUDIO_zpuino_wb_TIA is

  port (
	 wishbone_in : in std_logic_vector(61 downto 0);
	 wishbone_out : out std_logic_vector(33 downto 0);

	 data_out:   out std_logic_vector(17 downto 0)			--Digital data out - this should be fed into an audio mixer or Delta-Sigma DAC.
  );
end;

architecture RTL of AUDIO_zpuino_wb_TIA is
  
 component papilio_TIA is
 
 port(clk: in std_logic;       
          cnt: in std_logic;
          freq: in std_logic_vector(4 downto 0);
          ctrl: in std_logic_vector(3 downto 0);
          ao: out std_logic
         );
 end component;
  
  signal  wb_clk_i:    std_logic;                     -- Wishbone clock
  signal  wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
  signal  wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
  signal  wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
  signal  wb_we_i:     std_logic;                     -- Wishbone write enable signal
  signal  wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
  signal  wb_stb_i:    std_logic;                     -- Wishbone strobe signal  

  signal  wb_dat_o:    std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
  signal  wb_ack_o:    std_logic;                      -- Wishbone acknowledge out signal
  signal  wb_inta_o:   std_logic;
 	signal TIA_audio_out: std_logic_vector(15 downto 0);
	signal TIA_clk:	std_logic;
	
	signal frequency               : std_logic_vector(7 downto 0);
	signal control                : std_logic_vector(7 downto 0);
	signal predivcnt: integer;
begin
-- Unpack the wishbone array into signals so the modules code is not confusing.
  wb_clk_i <= wishbone_in(61);
  wb_rst_i <= wishbone_in(60);
  wb_dat_i <= wishbone_in(59 downto 28);
  wb_adr_i <= wishbone_in(27 downto 3);
  wb_we_i <= wishbone_in(2);
  wb_cyc_i <= wishbone_in(1);
  wb_stb_i <= wishbone_in(0); 
  
  wishbone_out(33 downto 2) <= wb_dat_o;
  wishbone_out(1) <= wb_ack_o;
  wishbone_out(0) <= wb_inta_o; 
  data_out (15 downto 0) <= TIA_audio_out;
  
 -- wishbone signals  
  wb_ack_o <= wb_cyc_i and wb_stb_i;
  wb_inta_o <= '0';
  
  predivider: process(wb_clk_i)
  begin
	if rising_edge(wb_clk_i) then
		if wb_rst_i='1' then
			TIA_clk <= '0';
			predivcnt <= 1600;
		else
		if predivcnt=0 then
			TIA_clk <=not TIA_clk;
			predivcnt <= 1600;
		else
			predivcnt <= predivcnt -1 ;
		end if;
	end if;
  end if;
  end process;
  
  TIA: papilio_TIA
   port map (
		clk => TIA_clk,    
        cnt => '1',
        freq => frequency,
        ctrl => control,
        ao => TIA_audio_out

  );



end architecture RTL;

library ieee;
use ieee.std_logic_1164.all;       
use ieee.numeric_std.all;

--use work.TIA_common.all;

entity audio is 
    port(clk: in std_logic;       
          cnt: in std_logic;
          freq: in std_logic_vector(4 downto 0);
          ctrl: in std_logic_vector(3 downto 0);
          ao: out std_logic
         );
end audio;

architecture arch of audio is 
    
    signal dvdr: unsigned(4 downto 0) := "00000";
    signal sr4: std_logic_vector(3 downto 0) := "0000";
    signal sr5: std_logic_vector(4 downto 0) := "00000";
    signal sr5_tap: std_logic;
    signal sr4_in: std_logic;   
    signal sr5_in: std_logic;       
    signal sr4_cnt: std_logic;  
    signal sr5_cnt: std_logic;      
    
begin

    process(clk)
    begin 
        if (clk'event and clk = '1') then           
            if (cnt = '1') then                 
                if (sr4_cnt = '1') then 
                    sr4 <= sr4_in & sr4(3 downto 1);
                end if;
                if (sr5_cnt = '1') then 
                    sr5 <= sr5_in & sr5(4 downto 1);
                end if;             
                if (dvdr = unsigned(freq)) then 
                    dvdr <= "00000";
                else 
                    dvdr <= dvdr + 1;
                end if;
            end if;
        end if;                     
    end process;    
    
    sr5_in <= '1' when 
        (ctrl = "0000") or 
        (sr5_tap = '1') or      
        (sr5 = "00000" and (ctrl(0) = '1' or ctrl(1) = '1' or sr4 = "1111"))
        else '0';
        
    sr4_in <= '1' when 
        (ctrl = "0000") or 
        (ctrl(3 downto 2) = "00" and (sr4 = "1111" or ((sr4(1) xnor sr4(0)) = '1'))) or
        (ctrl(3 downto 2) = "11" and (sr4(3 downto 1) = "101" or sr4(1) = '0')) or
        (ctrl(3 downto 2) = "01" and sr4(3) = '0') or
        (ctrl(3 downto 2) = "10" and sr5(0) = '1') 
        else '0';
    
    sr5_tap <= sr5(0) xor sr4(0) when (ctrl(1 downto 0) = "00") else sr5(0) xor sr5(3);             
    
    sr5_cnt <= '1' when (dvdr = unsigned(freq)) else '0';  -- CHECKME
        
    sr4_cnt <= '1' when 
        (dvdr = unsigned(freq) and (
            (ctrl(1 downto 0) = "10" and sr5(4 downto 1) = "0001") or 
            (ctrl(1 downto 0) = "11" and sr5(0) = '1')  or
            (ctrl(1) = '0')))
        else '0';
        
    ao <= sr4(0);

end arch;
