library ieee;
use ieee.std_logic_1164.all;

entity seven_bit_sign_extender is
	port (X: in std_logic_vector(8 downto 0);
	Y: out std_logic_vector(15 downto 0));
end entity seven_bit_sign_extender;

architecture Arch of seven_bit_sign_extender is

begin

      Y(8 downto 0) <= X(8 downto 0); 
		Y(15) <= X(8);
		Y(14) <= X(8); 
		Y(13) <= X(8);
		Y(12) <= X(8); 
		Y(11) <= X(8);
		Y(10) <= X(8);
		Y(9) <= X(8);
		
end Arch;