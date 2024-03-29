------------------------------------------------------------------------
--  CompSel.vhd -- Component Selector
------------------------------------------------------------------------
--  Author : Mircea Dabacan
--           Copyright 2004 Digilent, Inc.
------------------------------------------------------------------------
-- Software version: Xilinx ISE 6.2.03i
--                   WebPack
------------------------------------------------------------------------
-- This file decodes the upper 5 bits of regEppAdrIn 
-- to generate a "SELECT" signal named CS0_7. 
-- CS0_7 is active (HIGH) whenever regEppAdrIn = "00000".
-- The selected component is assigned to the address range 0 to 7.
-- CompSel.vhd can be enhanced to select multiple components, 
-- with various address ranges assigned.

------------------------------------------------------------------------
-- Revision History:
-- 10/21/2004(MirceaD): created
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CompSel is
    Port (regEppAdrIn : in std_logic_vector(7 downto 0);
          CS80_9F : out std_logic;
          CS0_7 : out std_logic;
          CS8_F : out std_logic;
          CS10 : out std_logic);
end CompSel;

architecture Behavioral of CompSel is

begin

 CS0_7 <= '1' when regEppAdrIn(7 downto 3) = "00000" else '0';
 CS8_F <= '1' when regEppAdrIn(7 downto 3) = "00001" else '0';
 CS10 <= '1' when regEppAdrIn = "00010000" else '0';
 CS80_9F <= '1' when regEppAdrIn(7 downto 5) = "100" else '0';

end Behavioral;

