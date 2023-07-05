library IEEE;
use IEEE.STD_LOGIC_1164.all;
package WSystemPKG is
	component WSystem is
		port(TIN,LIN,RESET,CLK : in std_logic;
	  	  	MIN : in std_logic_vector(2 downto 0);
			LOUT,TOUT : out std_logic;
			STATE : out std_logic_vector(1 downto 0);
			MOUT : out std_logic_vector(2 downto 0);
			SEG : out std_logic_vector(6 downto 0));
	end component;
	type STATE_TYPE is (ST0,ST1,ST2);
	constant CLK_PERIOD : time := 100 ns;
end package;


