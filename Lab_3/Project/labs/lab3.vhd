
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test is
port(
	pSW: in std_logic_vector(7 downto 0);
	pLED: buffer std_logic_vector(7 downto 0);
	pLED1: out std_logic_vector(7 downto 0);
	pHex: buffer std_logic_vector(7 downto 0);
	btn: in std_logic;
	clk: in std_logic);
end test;

-- PART 1 --
--architecture t1 of test is
--begin
--	pLED(2) <= pSW(2);
--	pLED1(2)<= pSW(2);
--end architecture;


-- PART 2 --
--architecture t1 of test is
--begin
--	pLED1(0)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(1)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(2)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(3)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(4)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(5)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(6)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--	pLED1(7)<= pSW(0) and pSW(1) and pSW(2) and pSW(3) and pSW(4) and pSW(5) and pSW(6) and pSW(7);
--end architecture;



-- PART 3 --
--architecture t1 of test is
--begin
--	process(pSW)
--	begin
--		if (pSW(1) = '1') then pHex <= "00100100";
--		else pHex <= "10011001";
--		end if;
--	end process;
--end architecture;


-- PART 4 --
--architecture t1 of test is
--begin
--	process(clk, pLED)
--	variable cnt : integer range 0 to 23;
--	begin
--		if(clk'event and clk = '1') then
--			if(cnt = 23) then
--				cnt := 0;
--				if (pLED(1) = '1') then
--					pLED(1) <= '0';
--					pLED(0) <= '0';
--				else
--					pLED(1) <= '1';
--					pLED(0) <= '1';
--				end if;
--			else
--				cnt := cnt + 1;
--			end if;
--		end if;
--	end process;
--end architecture;

-- PART 5 --
architecture t1 of test is
begin
	process(clk, pHex, btn)
	variable cnt : integer range 0 to 100;
	variable b : std_logic := '0';
	begin
		if(clk'event and clk = '1') then
			if(cnt = 100) then
				cnt := 0;
				if (b = '0') then
					pHex <= "11111111";
					b := '1';
				else
					b := '0';
					if (btn = '1') then
						pHex <= "10100100";
					else
						pHex <= "00000000";
					end if;
				end if;
			else
				cnt := cnt + 1;
			end if;
		end if;
	end process;
end architecture;