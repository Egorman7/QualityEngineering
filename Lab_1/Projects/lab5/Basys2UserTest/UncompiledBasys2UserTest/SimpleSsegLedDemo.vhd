----------------------------------------------------------------------------------
-- Company: Digilent RO
-- Engineer: Mircea Dabacan
-- 
-- Create Date:    19:04:55 03/22/2009 
-- Design Name: 
-- Module Name:    SimpleSsegLesDemo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- This is the source file for the Simple Demo for Basys 2, 
-- provided by the Digilent Reference Component Library.

-- The project demonstrates the behavior of:
--  - Switches and LEDs: switches control LEDs state
--  When SW6 is LOW:
--  - seven segment display: all digits count synchronously from 0 to F
--    hexadecimal. All decimal points are turned ON. 
--  - buttons: pressing a button turns OFF the coresponding seven 
--    segment display digit
--  When SW6 is HIGH:
--  - seven segment display: last two digits show the last received scan code
--    from a keyboard connected to the PS2 port. All decimal points are turned ON. 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created 20/03/2009(MirceaD)
-- Revision 0.02 - Modified for Basys2UserTest 23/03/2009(MirceaD)

-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SimpleSsegLedDemo is

  Port (ck:  in  std_logic;
        btn: in  std_logic_vector(3 downto 0);
        sw:  in  std_logic_vector(7 downto 0);
        led: out std_logic_vector(7 downto 0);
        seg: out std_logic_vector(6 downto 0);
        dp:  out std_logic;
        an:  out std_logic_vector(3 downto 0);
        PS2C: in std_logic;   -- PS2 serial clock 
        PS2D: in std_logic    -- PS2 serial data 
		  );

end SimpleSsegLedDemo;

architecture Behavioral of SimpleSsegLedDemo is

  signal cntDiv: std_logic_vector(28 downto 0); -- general clock div/cnt
  alias cntDisp: std_logic_vector(3 downto 0) is cntDiv(28 downto 25);
  alias clkDisp: std_logic is cntDiv(16);  -- divided clock
  -- 50MHz/2^17=381Hz
  alias ck1: std_logic is cntDiv(9);  -- divided clock
  -- 50MHz/2^10=48828Hz

  signal s_buf:std_logic_vector (9 downto 0);  -- buffer for PS2 receiver
  signal key_code:std_logic_vector (7 downto 0):= x"00";  -- scan code from keyboard
  signal par:std_logic; -- parity bit for PS2 receiver
  signal wdg: integer range 0 to 50000000; -- watch dog counter (1 sec at 50MHz)
  signal digit:std_logic_vector (3 downto 0);  -- curent displayed digit
  signal PS2Cold:std_logic;  -- stored PS2C for edge d

begin

  led <= sw;

--  ckDivider: process(ck)
--  begin
--    if ck'event and ck='1' then
--      cntDiv <= cntDiv - '1';
--    end if;
--  end process;

-- selecting the content of the seven segment display
--  process(sw(6))
--  begin
  --case SW(6) is
--    when '0' =>    -- sw6 LOW
	   --digit <= cntDisp; -- simple counter on all digits
		--an <= btn;        -- pressed buton turns digit OFF
--      dp <= '0';        -- al decimal points ON
    --when others => -- sw6 HIGH
      -- displaying the keyboard scan code on seven segment display last two digits
--      dp <= '1';        -- al decimal points OFF
		--an    <= "0011";
		--digit <=cntDisp;
     -- case clkDisp is
		--  when '0' =>
		--    digit <= key_code(3 downto 0); -- digit 0 (LSD)
      --    an    <= "1010";	--A	
		--  when others =>
		--    digit <= key_code(7 downto 4); -- digit 1
      --    an    <= "1100";	--C	
     -- end case;
  --end ca-se;
  --end process;
  
  process(btn)
  begin
    if (btn(0)='1') then
		digit <= "0100";
		an <= "1110";
		dp <= '0';
    end if;
	     if (btn(1)='1') then
		digit <= "0011";
		an <= "1101";
		dp <= '0';
    end if;
	     if (btn(2)='1') then
		digit <= "0010";
		an <= "1011";
		dp <= '0';
    end if;
	     if (btn(3)='1') then
		digit <= "0001";
		an <= "0111";
		dp <= '0';
    end if;
  end process;
		  

-- watchdog counter
  wdgCnt: process(ck)
  begin
    if ck'event and ck = '1' then
      if PS2D = '0' then -- PS2 data not idle  
        wdg <= 0; -- reset watchdog
      else
        if wdg < 50000000 then -- less than 1 sec
		    wdg <= wdg + 1; -- increment
        end if;
      end if;		  
    end if;
  end process;	 



  process (wdg,PS2C)
  begin
    if ck1'event and ck1 = '1' then
      PS2Cold <= PS2C;               -- storing old value of PS2C for edge detection 
      if  wdg = 50000000 then 		 -- PS2D idle for the last 1 sec. 
        s_buf<="1111111111";
        par<='0';
        key_code<="00000000";						-- no valid byte available 
      elsif PS2Cold = '0' and PS2C = '1' then  -- rising egde of PS2C
        if s_buf(0)='0' then							-- 11 bits received ("start bit" reached S_buf(0))
          if (par='1' and PS2D='1') then		-- correct byte: parity OK, stop bit OK.
            key_code<=s_buf(8 downto 1);		-- the received byte is delivered
            s_buf<="1111111111";					-- a new reception is prepared
            par<='0';
          else 											-- incorrect byte
            s_buf<="1111111111";
            par<='0';
            key_code<="00000000";				-- no valid byte available 
          end if;
        else 												-- not yet 11 bits
          s_buf<=PS2D&s_buf(9 downto 1);		-- shift bits to right, adding the new received one
          par<=par xor PS2D;						-- parity check. Includes the received parity bit.
        end if;
      end if;
    end if;
  end process;



  --HEX-to-seven-segment decoder
--   HEX:   in    STD_LOGIC_VECTOR (3 downto 0);
--   LED:   out   STD_LOGIC_VECTOR (6 downto 0);
-- 
-- segment encoinputg
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3
   
    with digit SELect
   seg<= "1111001" when "0001",   --1
         "0100100" when "0010",   --2
         "0110000" when "0011",   --3
         "0011001" when "0100",   --4
         "0010010" when "0101",   --5
         "0000010" when "0110",   --6
         "1111000" when "0111",   --7
         "0000000" when "1000",   --8
         "0010000" when "1001",   --9
         "0001000" when "1010",   --A
         "0000011" when "1011",   --b
         "1000110" when "1100",   --C
         "0100001" when "1101",   --d
         "0000110" when "1110",   --E
         "0001110" when "1111",   --F
         "1000000" when others;   --0
 
end Behavioral;

