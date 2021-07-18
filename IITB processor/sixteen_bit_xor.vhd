library ieee;
use ieee.std_logic_1164.all;
library work;


entity sixteen_bit_xor is
	port(A,B: in std_logic_vector(15 downto 0);
	     Cout: out std_logic;
		  X: out std_logic_vector(15 downto 0));
end entity;


architecture Arch of sixteen_bit_xor is

begin

   Cout <= '0';
	X <= A xor B;
	
end Arch;