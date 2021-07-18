library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity testbench is
end entity;

architecture road of testbench is
	component IITB_PROC is
    port (clk,rst  : in  std_logic);
   end component;

	
	signal clk: std_logic := '0';
	signal rst: std_logic := '0';
	


begin
	dut_instance : IITB_PROC
	port map(clk => clk, rst => rst);
		
	process
	  begin
	  rst <= '1';
		 for i in 1 to 10 loop
			clk <= '1';
			wait for 0.5 sec;
			clk <= '0';
			wait for 0.5 sec;
		 end loop;
		
	  rst <= '0';
		 for i in 1 to 300 loop
			clk <= '1';
			wait for 0.5 sec;
			clk <= '0';
			wait for 0.5 sec;
		 end loop;
		 
	  rst <= '0';
		 for i in 1 to 300 loop
			clk <= '1';
			wait for 0.5 sec;
			clk <= '0';
			wait for 0.5 sec;
		 end loop;
	  wait;
	end process;
	
end architecture;

			