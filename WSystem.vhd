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
begin
CLK_PROC :  process(RESET,NS,CLK)
begin
	if (RESET = '1') then PS <= ST0;
	elsif rising_edge(CLK) then PS <= NS;
	end if;
end process;

CMB_PROC : process(TIN,LIN,MIN,PS)
begin
	case PS is 
		when ST0 =>
			if (TIN = '1' or LIN = '1') and MIN <= "001" then 
			NS <= ST1;
			STATE <= '1';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0110111";
			elsif (TIN = '0' and LIN = '0') and MIN <= "011" then
			NS <= ST1;
			STATE <= '1';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0110111";
			else
			NS <= ST0;
			STATE <= '0';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0000001";
			end if;
		when ST1 =>
			if (TIN = '1' or LIN = '1') and MIN >= "011" then
			NS <= ST0;
			STATE <= '0';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0000001";
			elsif MIN >= "111" then
			NS <= ST0;
			STATE <= '0';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0000001";
			else
			NS <= ST1;
			STATE <= '1';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0110111";
			end if;
		when others =>
			NS <= ST0;
			STATE <= '0';
			LOUT <= LIN; TOUT <= TIN; MOUT <= MIN;
			SEG <= "0000001";
	end case;
end process;
end architecture;
