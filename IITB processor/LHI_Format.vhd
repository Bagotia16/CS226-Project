library ieee;
use ieee.std_logic_1164.all;

entity LHI_Format is
	port (X: in std_logic_vector(8 downto 0);
	Y: out std_logic_vector(15 downto 0));
end entity LHI_Format;

architecture Arch of LHI_Format is

begin

	Y<=X(8)&X(7)&X(6)&X(5)&X(4)&X(3)&X(2)&X(1)&X(0)&'0'&'0'&'0'&'0'&'0'&'0'&'0';

end Arch;