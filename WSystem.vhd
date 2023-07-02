library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity WSystem is
	port(TIN,LIN,RESET,CLK : in std_logic;
	    	MIN : in std_logic_vector(2 downto 0);
		LOUT,TOUT,STATE : out std_logic;
		MOUT : out std_logic_vector(2 downto 0);
		SEG : out std_logic_vector(6 downto 0));
end WSystem;

architecture WS of WSystem is
type STATE_TYPE is (ST0,ST1);
signal PS,NS : STATE_TYPE;

CLK_PROC :  process(RESET,NS,CLK)
begin
	if (RESET = '1') then PS <= ST0;
	elsif (rising_edge(CLK) then PS <= NS;
	end if
end process;

CMB_PROC : process(T,L,M,PS)
begin
