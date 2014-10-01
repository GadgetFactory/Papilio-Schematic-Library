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
  
entity AUDIO_zpuino_wb_2A03 is

  port (
	 wishbone_in : in std_logic_vector(61 downto 0);
	 wishbone_out : out std_logic_vector(33 downto 0);

	 data_outR:   out std_logic_vector(17 downto 0);			--Digital data out - this should be fed into an audio mixer or Delta-Sigma DAC.
	 data_outC:   out std_logic_vector(17 downto 0)			--Digital data out - this should be fed into an audio mixer or Delta-Sigma DAC.
  );
end;

architecture RTL of AUDIO_zpuino_wb_2A03 is
  
  component papilio_2A03apu is
--	Generic (
		--wing_slot_g : std_logic_vector(3 downto 0) := x"0";
--		timebase_g	: std_logic_vector(15 downto 0) := (others => '0');
--		period_g		: std_logic_vector(15 downto 0) := (others => '0')
---	);
  port (
	 wb_clk_i:   in  std_logic;                     -- Wishbone clock
    wb_rst_i:   in  std_logic;                     -- Wishbone reset (synchronous)
    wb_dat_o:   out std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
    wb_dat_i:   in  std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
    wb_adr_i:   in  std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
    wb_we_i:    in  std_logic;                     -- Wishbone write enable signal
    wb_cyc_i:   in  std_logic;                     -- Wishbone cycle signal
    wb_stb_i:   in  std_logic;                     -- Wishbone strobe signal
    wb_ack_o:   out std_logic;                      -- Wishbone acknowledge out signal
	
	-- External connections
--		iNES_clk		: in  std_logic;
		NES_apu_outR	: out std_logic_vector(15 downto 0);
		NES_apu_outC	: out std_logic_vector(15 downto 0)
		);
  end component;
  
 -- signal O_AUDIO              : std_logic_vector(7 downto 0) := (others => '0');
  
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
--  signal iNES_clk	: std_logic;
	signal NES_apu_outR: std_logic_vector(15 downto 0);
	signal NES_apu_outC: std_logic_vector(15 downto 0);
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
  data_outR <= NES_apu_outR(9 downto 0) & "00000000";
  data_outC <= NES_apu_outC(9 downto 0) & "00000000";


   NESAPU: papilio_2A03apu
--	generic map (
--		timebase_g	=> "0000000000000000",
--		period_g		=> "0000000000000000"
--	)
  port map (
    wb_clk_i    => wb_clk_i,
    wb_rst_i    => wb_rst_i,
    wb_dat_o    => wb_dat_o,
    wb_dat_i    => wb_dat_i,
    wb_adr_i    => wb_adr_i,
    wb_we_i     => wb_we_i,
    wb_cyc_i    => wb_cyc_i,
    wb_stb_i    => wb_stb_i,
    wb_ack_o    => wb_ack_o,
	
	-- External connections
--	  iNES_clk		  => iNES_clk,
	  NES_apu_outR		  => NES_apu_outR,
	  NES_apu_outC		  => NES_apu_outC

  );


end architecture RTL;
