library ieee;
use ieee.std_logic_1164.all;
library work;


entity sixteen_bit_nand is
	port(A,B: in std_logic_vector(15 downto 0);
	     Cout: out std_logic;
		  N: out std_logic_vector(15 downto 0));
end entity;


architecture Arch of sixteen_bit_nand is

begin

   Cout <= '0';
	N <= A nand B;
	
end Arch;