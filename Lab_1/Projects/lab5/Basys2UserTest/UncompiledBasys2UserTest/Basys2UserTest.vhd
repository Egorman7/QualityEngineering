----------------------------------------------------------------------------------
-- Company: Digilent RO
-- Engineer: Mircea Dabacan
-- 
-- Create Date:    18:51:22 03/23/2009 
-- Design Name: Basys 2 User Test
-- Module Name:    Basys2UserTest - Structural 
-- Project Name:   
-- Target Devices: 
-- Tool versions: WebPack 10.1.03
-- Description: 
--
-- The file contains the structural description of the Basys2 User Test.
-- It combines the components:
-- - EppCtrl - Epp interface
-- - Pin Drivers - pin write drivers and read buffers for testing the user connectors 
-- - CompSel - to select PinDrivers component
-- - SimpleSsegLedDemo - to test buttons, switches, LEDs and seven segment display
-- - ckMux - to select between mclk and uclk
-- - DispCtrl - to generat VGA signals
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Basys2UserTest is
   port ( btn      : in    std_logic_vector (3 downto 0); 
          EppAstb  : in    std_logic; 
          EppDstb  : in    std_logic; 
          EppWr    : in    std_logic; 
          mclk     : in    std_logic; 
          sw       : in    std_logic_vector (7 downto 0); 
          uclk     : in    std_logic; 
          an       : out   std_logic_vector (3 downto 0); 
          dp       : out   std_logic; 
          EppWait  : out   std_logic; 
          HSync    : out   std_logic; 
          led      : out   std_logic_vector (7 downto 0); 
          OutBlue  : out   std_logic_vector (2 downto 1); 
          OutGreen : out   std_logic_vector (2 downto 0); 
          OutRed   : out   std_logic_vector (2 downto 0); 
          seg      : out   std_logic_vector (6 downto 0); 
          VSync    : out   std_logic; 
          EppDB    : inout std_logic_vector (7 downto 0); 
          PIO      : inout std_logic_vector (87 downto 72); 
          PS2C     : inout std_logic; 
          PS2D     : inout std_logic);
end Basys2UserTest;

architecture Structural of Basys2UserTest is

   signal busEppAdrOut : std_logic_vector (7 downto 0);
   signal busEppIn     : std_logic_vector (7 downto 0);
   signal busEppOut    : std_logic_vector (7 downto 0);
   signal ck50MHz      : std_logic;
   signal CS80_8F      : std_logic;
   signal ctlEppDwrOut : std_logic;

   component CompSel
      port ( regEppAdrIn : in    std_logic_vector (7 downto 0); 
             CS80_9F     : out   std_logic; 
             CS0_7       : out   std_logic; 
             CS8_F       : out   std_logic; 
             CS10        : out   std_logic);
   end component;
   
   component PinDrivers
      port ( Wr      : in    std_logic; 
             CompSel : in    std_logic; 
             busIn   : in    std_logic_vector (7 downto 0); 
             adrIn   : in    std_logic_vector (7 downto 0); 
             btn     : in    std_logic_vector (3 downto 0); 
             sw      : in    std_logic_vector (7 downto 0); 
             PIO     : inout std_logic_vector (87 downto 72); 
             busOut  : out   std_logic_vector (7 downto 0));
   end component;
   
   component EppCtrl
      port ( clk              : in    std_logic; 
             EppAstb          : in    std_logic; 
             EppDstb          : in    std_logic; 
             EppWr            : in    std_logic; 
             EppRst           : in    std_logic; 
             HandShakeReqIn   : in    std_logic; 
             ctlEppDoneIn     : in    std_logic; 
             busEppIn         : in    std_logic_vector (7 downto 0); 
             ctlEppRdCycleOut : inout std_logic; 
             regEppAdrOut     : inout std_logic_vector (7 downto 0); 
             EppWait          : out   std_logic; 
             ctlEppDwrOut     : out   std_logic; 
             ctlEppStartOut   : out   std_logic; 
             busEppOut        : out   std_logic_vector (7 downto 0); 
             EppDB            : inout std_logic_vector (7 downto 0));
   end component;
   
   component SimpleSsegLedDemo
      port ( ck   : in    std_logic; 
             btn  : in    std_logic_vector (3 downto 0); 
             sw   : in    std_logic_vector (7 downto 0); 
             dp   : out   std_logic; 
             led  : out   std_logic_vector (7 downto 0); 
             seg  : out   std_logic_vector (6 downto 0); 
             an   : out   std_logic_vector (3 downto 0); 
             PS2C : in    std_logic; 
             PS2D : in    std_logic);
   end component;
   
   component ckMux
      port ( ck0   : in    std_logic; 
             ck1   : in    std_logic; 
             sel   : in    std_logic; 
             ckOut : out   std_logic);
   end component;
   
   component DispCtrl
      port ( ck       : in    std_logic; 
             HS       : out   std_logic; 
             VS       : out   std_logic; 
             outRed   : out   std_logic_vector (2 downto 0); 
             outGreen : out   std_logic_vector (2 downto 0); 
             outBlue  : out   std_logic_vector (2 downto 1));
   end component;
   
begin
   CompSelInst : CompSel
      port map (regEppAdrIn(7 downto 0)=>busEppAdrOut(7 downto 0),
                CS0_7=>open,
                CS8_F=>open,
                CS10=>open,
                CS80_9F=>CS80_8F);
   
   PinDriversInst : PinDrivers
      port map (adrIn(7 downto 0)=>busEppAdrOut(7 downto 0),
                btn(3 downto 0)=>btn(3 downto 0),
                busIn(7 downto 0)=>busEppOut(7 downto 0),
                CompSel=>CS80_8F,
                sw(7 downto 0)=>sw(7 downto 0),
                Wr=>ctlEppDwrOut,
                busOut(7 downto 0)=>busEppIn(7 downto 0),
                PIO(87 downto 72)=>PIO(87 downto 72));
   
   EppCtrlInst : EppCtrl
      port map (busEppIn(7 downto 0)=>busEppIn(7 downto 0),
                clk=>mclk,
                ctlEppDoneIn=>'0',
                EppAstb=>EppAstb,
                EppDstb=>EppDstb,
                EppRst=>'1',
                EppWr=>EppWr,
                HandShakeReqIn=>'0',
                busEppOut(7 downto 0)=>busEppOut(7 downto 0),
                ctlEppDwrOut=>ctlEppDwrOut,
                ctlEppStartOut=>open,
                EppWait=>EppWait,
                ctlEppRdCycleOut=>open,
                EppDB(7 downto 0)=>EppDB(7 downto 0),
                regEppAdrOut(7 downto 0)=>busEppAdrOut(7 downto 0));
   
   SimpleSsegLedDemoInst : SimpleSsegLedDemo
      port map (btn(3 downto 0)=>btn(3 downto 0),
                ck=>mclk,
                PS2C=>PS2C,
                PS2D=>PS2D,
                sw(7 downto 0)=>sw(7 downto 0),
                an(3 downto 0)=>an(3 downto 0),
                dp=>dp,
                led(7 downto 0)=>led(7 downto 0),
                seg(6 downto 0)=>seg(6 downto 0));
   
   ckMuxInst : ckMux
      port map (ck0=>mclk,
                ck1=>uclk,
                sel=>sw(7),
                ckOut=>ck50MHz);
   
   DispCtrlInst : DispCtrl
      port map (ck=>ck50MHz,
                HS=>HSync,
                outBlue(2 downto 1)=>OutBlue(2 downto 1),
                outGreen(2 downto 0)=>OutGreen(2 downto 0),
                outRed(2 downto 0)=>OutRed(2 downto 0),
                VS=>VSync);
   
end Structural;
