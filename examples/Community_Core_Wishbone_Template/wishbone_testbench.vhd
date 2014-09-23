library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity wishbone_testbench is
end entity;


architecture sim of wishbone_testbench is

  constant period: time := 10 ns;

  signal clk: std_logic := '1';
  signal rst: std_logic := '0';

	COMPONENT Wishbone_Symbol_Example
	PORT(
		wishbone_in : IN std_logic_vector(61 downto 0);          
		wishbone_out : OUT std_logic_vector(33 downto 0)
		);
	END COMPONENT;

  signal wb_dat_o:   std_logic_vector(31 downto 0);
  signal wb_dat_i:   std_logic_vector(31 downto 0);
  signal wb_adr_i:   std_logic_vector(31 downto 0);
  signal wb_we_i:    std_logic := '0';
  signal wb_cyc_i:   std_logic := '0';
  signal wb_stb_i:   std_logic := '0';
  signal wb_ack_o:   std_logic;
  
  signal wb_in:   std_logic_vector(61 downto 0);
  signal wb_out:   std_logic_vector(33 downto 0);
  
  constant REGISTER0_ADDR:   std_logic_vector(31 downto 0) := x"00000000";
  constant REGISTER1_ADDR:   std_logic_vector(31 downto 0) := x"00000001";
  constant REGISTER2_ADDR:   std_logic_vector(31 downto 0) := x"00000002";

  signal wb_dat_o_dly:   std_logic_vector(31 downto 0);

begin

  clk <= not clk after period/2;

  -- Reset
  process
  begin
    wait for 5 ns;
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait;
  end process;

	Inst_Wishbone_Symbol_Example: Wishbone_Symbol_Example PORT MAP(
		wishbone_in => wb_in,
		wishbone_out => wb_out
	);
	
  wb_in(61) <= clk;
  wb_in(60) <= rst;
  wb_in(59 downto 28) <= wb_dat_i;
  wb_in(27 downto 3) <= wb_adr_i(24 downto 0);
  wb_in(2) <= wb_we_i;
  wb_in(1) <= wb_cyc_i;
  wb_in(0) <= wb_stb_i; 
  wb_dat_o <= wb_out(33 downto 2);
  wb_ack_o <= wb_out(1);
  --wb_inta_o <= wb_out(0);

  -- Delayed read
  wb_dat_o_dly<=transport wb_dat_o after 1 ps;

  process
    procedure wbwrite(a: in std_logic_vector(31 downto 0); d: in std_logic_vector(31 downto 0) ) is
    begin
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='1';
      wb_dat_i<=d;
      wb_adr_i<=a;
      wait until rising_edge(clk);
		if wb_ack_o /= '1' then
			wait until wb_ack_o='1';
		end if;
      wait until rising_edge(clk);
      wb_cyc_i<='0';
      wb_stb_i<='0';
      wb_we_i <='0';
    end procedure;

    procedure wbread( a: in std_logic_vector(31 downto 0); d: out std_logic_vector(31 downto 0)) is
    begin
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='0';
      wb_adr_i<=a;
      wait until rising_edge(clk);
		if wb_ack_o /= '1' then
			wait until wb_ack_o='1';
		end if;
      wait until rising_edge(clk);
      d := wb_dat_o_dly;
      wb_cyc_i<='0';
      wb_stb_i<='0';
      wb_we_i <='0';
    end procedure;

    variable r : std_logic_vector(31 downto 0);

  begin
    
    wait until rst='1';
    wait until rst='0';
    wait until rising_edge(clk);

	-- This is where you should start providing your stimulus to test your design.
	
	-- Test register R/W
	-- Read and write to the Wishbone Bus
		wbwrite( REGISTER0_ADDR, x"aaaaaaaa");
		wait for 200 ns;
		wbwrite( REGISTER1_ADDR, x"55555555");
		wait for 200 ns;
		wbread( REGISTER2_ADDR, r );   
		assert( r(8 downto 0) = x"aa");			--Check to see if the result is what we expect.

    wait for 200 ns;
    report "Finsihed" severity failure;
  end process;


end sim;
