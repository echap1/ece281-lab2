--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : top_basys3_tb.vhd
--| AUTHOR(S)     : Capt Johnson
--| CREATED       : 01/30/2019 Last Modified 06/24/2020
--| DESCRIPTION   : This file implements a test bench for the full adder top level design.
--|
--| DOCUMENTATION : None
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : top_basys3.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is 
	
  -- declare the component of your top-level design unit under test (UUT)
  component sevenSegDecoder is
        Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
               o_S : out STD_LOGIC_VECTOR (6 downto 0));
    end component sevenSegDecoder;
  
 
	-- declare signals needed to stimulate the UUT inputs
	   -- TODO
	signal sw: std_logic_vector(3 downto 0) := "0000";
    signal seg: std_logic_vector(6 downto 0) := "0000000";
	-- finish declaring needed signals
begin
	-- PORT MAPS ----------------------------------------
	-- You must create the port map for your top_basys3.
	-- Look at your old test benches if you are unsure what to do
	-----------------------------------------------------
	sevenSegDecoder_inst: sevenSegDecoder
    port map(
       i_D => sw,
       o_S => seg
    );
	-- PROCESSES ----------------------------------------	
	-- Test Plan Process
	-- Implement the test plan here.  Body of process is continuously from time = 0  
	test_process : process 
	begin
        sw <= x"0"; wait for 20 ns; assert seg = "1000000" report "bad 0" severity failure;
        sw <= x"1"; wait for 20 ns; assert seg = "1111001" report "bad 1" severity failure;
        sw <= x"2"; wait for 20 ns; assert seg = "0100100" report "bad 2" severity failure;
        sw <= x"3"; wait for 20 ns; assert seg = "0110000" report "bad 3" severity failure;
        sw <= x"4"; wait for 20 ns; assert seg = "0011001" report "bad 4" severity failure;
        sw <= x"5"; wait for 20 ns; assert seg = "0010010" report "bad 5" severity failure;
        sw <= x"6"; wait for 20 ns; assert seg = "0000010" report "bad 6" severity failure;
        sw <= x"7"; wait for 20 ns; assert seg = "1111000" report "bad 7" severity failure;
        sw <= x"8"; wait for 20 ns; assert seg = "0000000" report "bad 8" severity failure;
        sw <= x"9"; wait for 20 ns; assert seg = "0011000" report "bad 9" severity failure;
        sw <= x"A"; wait for 20 ns; assert seg = "0001000" report "bad A" severity failure;
        sw <= x"B"; wait for 20 ns; assert seg = "0000011" report "bad B" severity failure;
        sw <= x"C"; wait for 20 ns; assert seg = "0100111" report "bad C" severity failure;
        sw <= x"D"; wait for 20 ns; assert seg = "0100001" report "bad D" severity failure;
        sw <= x"E"; wait for 20 ns; assert seg = "0000110" report "bad E" severity failure;
        sw <= x"F"; wait for 20 ns; assert seg = "0001110" report "bad F" severity failure;
	
		wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end test_bench;