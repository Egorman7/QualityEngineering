------------------------------------------------------------------------
-- Company: Digilent Inc.
-- Engineer: Mircea Dabacan
--
-- Create Date:    11:27:54 04/15/05
-- Design Name:    Basys BIST
-- Module Name:    PinDrivers - Behavioral
-- Project Name:   
-- Target Device:  XC3SE100, tq144
-- Tool versions:  WebPack 7.1.01i
-- Description:
-- The file implements IO drivers:
--           PIO : inout std_logic_vector(87 downto 70);
-- They can be written or read as bytes to or from registers:
-- reg 0x86 or 0x87 - JB4, JB3, JB2, JB1, JA4, JA3, JA2, JA1
-- reg 0x88 or 0x89 - JD4, JD3, JD2, JD1, JC4, JC3, JC2, JC1
-- The IO drivers are shortcut-protected.

--	The SW and BTN state can be read with this module, from registers:
-- reg 0x80 or 0x81 - btn(3 downto 0)&"xxxx"
-- reg 0x82 or 0x83 - sw(7 downto 0)


-- The file is used together with communication modules and PC software
-- to implement a shortcut test for the target board. 
-- The PC software has to:
	-- set a test vector of 18 bits (all '1's)
	-- send the test vector (byte-wise) to registers:
   -- 0x86, 0x88, via USB
	-- read same registers and compare to the original test vector.
	-- loop the previous steps 16 more times, with a moving '0' as test 
   	-- vector. 
--
-- Dependencies:
-- 
-- Revision 0.01 - File Created for D2SB
--				0.02 - File modified for S3E Starter Board
--          0.03 - File modified for Phoenix Board
--          0.04 - File truncated to allow just read of BTN and SW
--          0.05 - Pin drivers for Fx2, J and LCD connectors added back
--          0.06 - File modified for Basys
--          0.07 - File modified for Basys2 UserTest (MirceaD - 23March09)
-- Additional Comments:
-- 
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PinDrivers is
    Port ( -- ck : in std_logic;								-- sys clk: 50Mhz
	        busIn : in std_logic_vector(7 downto 0);
           busOut : out std_logic_vector(7 downto 0);
           Wr : in std_logic;								-- write cycle
           adrIn : in std_logic_vector(7 downto 0);-- Epp address
           CompSel : in std_logic;						-- component select
--           HandShakeReqOut : out std_logic;			-- unused; steady '0'
--           DoneOut : out std_logic;				      -- unused; steady '0'
           btn : in std_logic_vector(3 downto 0); 
           sw : in std_logic_vector(7 downto 0); 
           PIO : inout std_logic_vector(87 downto 72)); 
			                -- JA, JB, JC, JD, PS2 and VGA pins
--           PS2C: inout std_logic;
--           PS2D: inout std_logic);
end PinDrivers;

architecture Behavioral of PinDrivers is

signal PIOint : std_logic_vector(87 downto 70):=
			  x"FFFF"&"11";

begin

-- Combinatorial busOut
	busOut <= "00000000"	when CompSel = '0' else  -- prepared for OR-ing 
	                                              -- when not selected
	          btn(3 downto 0) &  -- BTNs (read only)
--             "00" & PS2C & PS2D 
             "0000"            when adrIn(3 downto 1) = "000" else
				 sw(7 downto 0)    when adrIn(3 downto 1) = "001" else
				 PIO(79 downto 72) when adrIn(3 downto 1) = "011" else
             -- JB4...1 & JA4...1
				 PIO(87 downto 80) when adrIn(3 downto 1) = "100" else
             -- JD4...1 & JC4...1
				 "00000000";	-- prepared for OR-ing

-- Output Latches	
--	outReg: process(ck, Wr) is
	outReg: process(Wr) is
	begin
--	if ck'event and ck = '1' then	
		if wr'event and wr = '0' and 		  -- write cycle
		   CompSel = '1' then  -- component selected
--			if adrIn(3 downto 1) = "000" then
--				PIOint(71 downto 70) <= busIn(1 downto 0); -- Sync and PS2
--            -- PS2C, PS2D
			if adrIn(3 downto 1) = "011" then 
				PIOint(79 downto 72) <= busIn; --JB&JA
			elsif adrIn(3 downto 1) = "100" then 
				PIOint(87 downto 80) <= busIn; --JD&JC
			else 
				null;
			end if;
		end if;
--	end if;
	end process;

-- Combinatorial Output buffers
	outBuf: process(PIOint) is
	begin
		 for i in 72 to 87 loop
			if PIOint(i) = '0' then
				PIO(i) <= 'L';
			else
				PIO(i) <= 'Z';
			end if;
		 end loop;
	end process;

--	outBufPS2D: process(PIOint) is
--	begin
--			if PIOint(70) = '0' then
--				PS2D <= 'L';  -- low
--			else
--				PS2D <= 'Z';  -- weak high with pullup
--			end if;
--	end process;
--
--	outBufPS2C: process(PIOint) is
--	begin
--			if PIOint(71) = '0' then
--				PS2C <= 'L';  -- low
--			else
--				PS2C <= 'Z';  -- weak high with pullup
--			end if;
--	end process;


end Behavioral;
