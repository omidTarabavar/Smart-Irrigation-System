library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity WSystem is
	port(TIN,LIN,RESET,CLK : in std_logic;
	    	MIN : in std_logic_vector(2 downto 0);
		LOUT,TOUT,STATE : out std_logic;
		MOUT : out std_logic_vector(2 downto 0);
		SEG : out std_logic_vector(6 downto 0));
end WSystem;
