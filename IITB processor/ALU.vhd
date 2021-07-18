library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;


entity ALU is 
	port( alu_A,alu_B : in std_logic_vector(15 downto 0);
		   op_type : in std_logic_vector(1 downto 0);
		   C_out, Z_out: out std_logic;
		   alu_C : out std_logic_vector(15 downto 0));
end entity;


architecture arch of ALU is
	signal t1,t2,t3,t4: std_logic_vector(15 downto 0);
	signal car1, car2, car3 : std_logic;

	component sixteen_bit_adder is
		port(A, B: in std_logic_vector(15 downto 0);
			  Cin : in std_logic;
		     S: out std_logic_vector(15 downto 0); 
		     Cout: out std_logic);
	end component sixteen_bit_adder;

	component sixteen_bit_nand is
		port(A,B: in std_logic_vector(15 downto 0);
		     Cout: out std_logic;
		     N: out std_logic_vector(15 downto 0));
	end component sixteen_bit_nand;
	
	component sixteen_bit_xor is
		port(A,B: in std_logic_vector(15 downto 0);
		     Cout: out std_logic;
		     X: out std_logic_vector(15 downto 0));
	end component sixteen_bit_xor;

begin

	op_1: sixteen_bit_adder port map (A => alu_A, B => alu_B, Cin => '0', S => t1, Cout => car1);
	op_2: sixteen_bit_nand port map (A => alu_A, B => alu_B, Cout => car2, N => t2);
	op_3: sixteen_bit_xor port map (A => alu_A, B => alu_B, Cout => car3, X => t3);

	process (op_type, t1, t2, t3, t4, car1, car2)
	begin
	
		if (op_type = "00") then
			t4 <= t1; -- ADD operation
			C_out <= car1;

		elsif (op_type = "01") then
			t4 <= t2; -- NAND operation
			C_out <= car2;
			
		elsif (op_type = "10") then
			t4 <= t3; -- XOR operation
			C_out <= car3;
	   end if;
		
		Z_out <= not (t4(0) or t4(1) or t4(2) or t4(3) or t4(4) or t4(5) or t4(6) or t4(7) or t4(8) or t4(9) or t4(10) or t4(11) or t4(12) or t4(13) or t4(14) or t4(15));
		alu_C <= t4;
		
	end process;

end arch;