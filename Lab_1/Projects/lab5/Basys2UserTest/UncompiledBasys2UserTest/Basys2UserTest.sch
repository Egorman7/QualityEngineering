VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL busEppOut(7:0)
        SIGNAL busEppAdrOut(7:0)
        SIGNAL busEppIn(7:0)
        SIGNAL led(7:0)
        SIGNAL seg(6:0)
        SIGNAL an(3:0)
        SIGNAL EppWr
        SIGNAL EppDstb
        SIGNAL EppAstb
        SIGNAL EppWait
        SIGNAL EppDB(7:0)
        SIGNAL sw(7:0)
        SIGNAL btn(3:0)
        SIGNAL dp
        SIGNAL XLXN_587
        SIGNAL XLXN_601
        SIGNAL PIO(87:72)
        SIGNAL mclk
        SIGNAL sw(7)
        SIGNAL PS2D
        SIGNAL PS2C
        SIGNAL XLXN_602(7:0)
        SIGNAL XLXN_603
        SIGNAL CS80_8F
        SIGNAL XLXN_605(7:0)
        SIGNAL XLXN_606
        SIGNAL XLXN_607
        SIGNAL XLXN_609
        SIGNAL uclk
        SIGNAL ck50MHz
        SIGNAL XLXN_621
        SIGNAL VSync
        SIGNAL HSync
        SIGNAL OutRed(2:0)
        SIGNAL OutGreen(2:0)
        SIGNAL OutBlue(2:1)
        SIGNAL XLXN_627
        SIGNAL ctlEppDwrOut
        SIGNAL XLXN_608(7:0)
        SIGNAL XLXN_631(7:0)
        SIGNAL XLXN_632
        SIGNAL XLXN_633
        SIGNAL XLXN_634(7:0)
        SIGNAL XLXN_635(6:0)
        SIGNAL XLXN_636(3:0)
        SIGNAL XLXN_637
        SIGNAL XLXN_638(7:0)
        SIGNAL XLXN_639(7:0)
        SIGNAL XLXN_640(6:0)
        SIGNAL XLXN_641(3:0)
        SIGNAL XLXN_642
        SIGNAL XLXN_643
        SIGNAL XLXN_644(7:0)
        SIGNAL XLXN_645(6:0)
        SIGNAL XLXN_646(3:0)
        SIGNAL XLXN_647
        SIGNAL XLXN_648
        SIGNAL XLXN_649(3:0)
        SIGNAL XLXN_650
        SIGNAL XLXN_651(7:0)
        SIGNAL XLXN_652(6:0)
        SIGNAL XLXN_653(3:0)
        SIGNAL XLXN_654
        SIGNAL XLXN_655
        SIGNAL XLXN_656(3:0)
        SIGNAL XLXN_657
        SIGNAL XLXN_658(7:0)
        SIGNAL XLXN_659(6:0)
        SIGNAL XLXN_660(3:0)
        SIGNAL XLXN_661
        SIGNAL XLXN_662
        SIGNAL XLXN_663(3:0)
        SIGNAL XLXN_664
        SIGNAL XLXN_665(7:0)
        SIGNAL XLXN_666(6:0)
        SIGNAL XLXN_667(3:0)
        SIGNAL XLXN_668
        PORT Output led(7:0)
        PORT Output seg(6:0)
        PORT Output an(3:0)
        PORT Input EppWr
        PORT Input EppDstb
        PORT Input EppAstb
        PORT Output EppWait
        PORT BiDirectional EppDB(7:0)
        PORT Input sw(7:0)
        PORT Input btn(3:0)
        PORT Output dp
        PORT BiDirectional PIO(87:72)
        PORT Input mclk
        PORT BiDirectional PS2D
        PORT BiDirectional PS2C
        PORT Input uclk
        PORT Output VSync
        PORT Output HSync
        PORT Output OutRed(2:0)
        PORT Output OutGreen(2:0)
        PORT Output OutBlue(2:1)
        BEGIN BLOCKDEF CompSel
            TIMESTAMP 2006 9 14 9 35 22
            LINE N 320 160 384 160 
            LINE N 320 96 384 96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
            LINE N 320 32 384 32 
            RECTANGLE N 64 -64 320 192 
        END BLOCKDEF
        BEGIN BLOCKDEF PinDrivers
            TIMESTAMP 2009 3 23 15 47 24
            RECTANGLE N 320 -172 384 -148 
            LINE N 384 -160 320 -160 
            RECTANGLE N 320 -108 384 -84 
            LINE N 384 -96 320 -96 
            RECTANGLE N 320 -236 384 -212 
            LINE N 320 -224 384 -224 
            RECTANGLE N 64 -256 320 64 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -172 64 -148 
            LINE N 0 -160 64 -160 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 64 32 0 32 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF EppCtrl
            TIMESTAMP 2008 2 21 7 50 53
            LINE N 368 -416 432 -416 
            RECTANGLE N 368 -428 432 -404 
            RECTANGLE N 368 -364 432 -340 
            LINE N 432 -352 368 -352 
            LINE N 368 -288 432 -288 
            LINE N 368 -224 432 -224 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 0 32 64 32 
            LINE N 432 -160 368 -160 
            LINE N 432 -32 368 -32 
            LINE N 368 -96 432 -96 
            LINE N 368 32 432 32 
            RECTANGLE N 368 20 432 44 
            RECTANGLE N 64 -448 368 64 
            RECTANGLE N 0 -108 64 -84 
            LINE N 0 -96 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF SimpleSsegLedDemo
            TIMESTAMP 2009 3 23 16 16 11
            LINE N 64 -224 0 -224 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 20 384 44 
            LINE N 320 32 384 32 
            RECTANGLE N 320 84 384 108 
            LINE N 320 96 384 96 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -236 384 -212 
            LINE N 384 -224 320 -224 
            RECTANGLE N 320 -172 384 -148 
            LINE N 384 -160 320 -160 
            RECTANGLE N 64 -384 320 124 
            LINE N 384 -352 320 -352 
            LINE N 384 -288 320 -288 
        END BLOCKDEF
        BEGIN BLOCKDEF ckMux
            TIMESTAMP 2008 9 11 23 7 30
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF DispCtrl
            TIMESTAMP 2009 3 22 21 22 45
            LINE N 64 80 0 80 
            LINE N 352 16 416 16 
            LINE N 352 48 416 48 
            RECTANGLE N 352 -172 416 -148 
            LINE N 352 -160 416 -160 
            RECTANGLE N 352 -140 416 -116 
            LINE N 352 -128 416 -128 
            RECTANGLE N 352 -108 416 -84 
            LINE N 352 -96 416 -96 
            RECTANGLE N 64 -196 352 112 
        END BLOCKDEF
        BEGIN BLOCK XLXI_4 CompSel
            PIN regEppAdrIn(7:0) busEppAdrOut(7:0)
            PIN CS80_9F CS80_8F
            PIN CS0_7
            PIN CS8_F
            PIN CS10
        END BLOCK
        BEGIN BLOCK XLXI_73 gnd
            PIN G XLXN_587
        END BLOCK
        BEGIN BLOCK XLXI_80 EppCtrl
            PIN clk mclk
            PIN EppAstb EppAstb
            PIN EppDstb EppDstb
            PIN EppWr EppWr
            PIN EppRst XLXN_601
            PIN HandShakeReqIn XLXN_587
            PIN ctlEppDoneIn XLXN_587
            PIN busEppIn(7:0) busEppIn(7:0)
            PIN ctlEppRdCycleOut
            PIN regEppAdrOut(7:0) busEppAdrOut(7:0)
            PIN EppWait EppWait
            PIN ctlEppDwrOut ctlEppDwrOut
            PIN ctlEppStartOut
            PIN busEppOut(7:0) busEppOut(7:0)
            PIN EppDB(7:0) EppDB(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_81 vcc
            PIN P XLXN_601
        END BLOCK
        BEGIN BLOCK XLXI_9 PinDrivers
            PIN Wr ctlEppDwrOut
            PIN CompSel CS80_8F
            PIN busIn(7:0) busEppOut(7:0)
            PIN adrIn(7:0) busEppAdrOut(7:0)
            PIN btn(3:0) btn(3:0)
            PIN sw(7:0) sw(7:0)
            PIN PIO(87:72) PIO(87:72)
            PIN busOut(7:0) busEppIn(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_82 SimpleSsegLedDemo
            PIN ck mclk
            PIN btn(3:0) btn(3:0)
            PIN sw(7:0) sw(7:0)
            PIN dp dp
            PIN led(7:0) led(7:0)
            PIN seg(6:0) seg(6:0)
            PIN an(3:0) an(3:0)
            PIN PS2C PS2C
            PIN PS2D PS2D
        END BLOCK
        BEGIN BLOCK XLXI_83 ckMux
            PIN ck0 mclk
            PIN ck1 uclk
            PIN sel sw(7)
            PIN ckOut ck50MHz
        END BLOCK
        BEGIN BLOCK XLXI_84 DispCtrl
            PIN ck ck50MHz
            PIN HS HSync
            PIN VS VSync
            PIN outRed(2:0) OutRed(2:0)
            PIN outGreen(2:0) OutGreen(2:0)
            PIN outBlue(2:1) OutBlue(2:1)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH led(7:0)
            WIRE 2608 1904 2784 1904
        END BRANCH
        BEGIN BRANCH seg(6:0)
            WIRE 2608 1968 2784 1968
        END BRANCH
        BEGIN BRANCH an(3:0)
            WIRE 2608 2032 2784 2032
        END BRANCH
        BEGIN BRANCH EppDstb
            WIRE 944 1184 1136 1184
        END BRANCH
        BEGIN BRANCH EppAstb
            WIRE 944 1120 1136 1120
        END BRANCH
        BEGIN BRANCH EppWait
            WIRE 944 1504 1136 1504
        END BRANCH
        BEGIN BRANCH busEppIn(7:0)
            WIRE 1568 1120 1888 1120
            WIRE 1888 1120 2224 1120
            BEGIN DISPLAY 1888 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH busEppAdrOut(7:0)
            WIRE 1568 1504 1712 1504
            WIRE 1712 1248 1712 1424
            WIRE 1712 1424 1776 1424
            WIRE 1712 1424 1712 1504
            WIRE 1712 1248 1936 1248
            WIRE 1936 1248 2224 1248
            BEGIN DISPLAY 1936 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH EppDB(7:0)
            WIRE 944 1376 1136 1376
        END BRANCH
        BEGIN BRANCH EppWr
            WIRE 944 1248 1136 1248
        END BRANCH
        BEGIN BRANCH busEppOut(7:0)
            WIRE 1568 1056 1888 1056
            WIRE 1888 1056 2224 1056
            BEGIN DISPLAY 1888 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_601
            WIRE 1120 1312 1136 1312
        END BRANCH
        BEGIN INSTANCE XLXI_9 2224 1280 R0
        END INSTANCE
        BEGIN BRANCH PIO(87:72)
            WIRE 2608 1056 2784 1056
        END BRANCH
        BEGIN BRANCH btn(3:0)
            WIRE 2608 1120 2688 1120
            WIRE 2688 1120 2784 1120
            WIRE 2688 1120 2688 1712
            WIRE 2608 1712 2688 1712
        END BRANCH
        BEGIN BRANCH sw(7:0)
            WIRE 2608 1184 2720 1184
            WIRE 2720 1184 2784 1184
            WIRE 2720 1184 2720 1776
            WIRE 2608 1776 2688 1776
            WIRE 2688 1776 2720 1776
        END BRANCH
        BEGIN BRANCH dp
            WIRE 2608 1840 2784 1840
        END BRANCH
        BEGIN BRANCH sw(7)
            WIRE 960 928 1120 928
            WIRE 1120 928 1168 928
            WIRE 960 928 960 2096
            WIRE 960 2096 2688 2096
            WIRE 2688 1872 2688 2096
            BEGIN DISPLAY 1120 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mclk
            WIRE 944 800 992 800
            WIRE 992 800 1168 800
            WIRE 992 800 992 1056
            WIRE 992 1056 1120 1056
            WIRE 1120 1056 1136 1056
            WIRE 992 1056 992 1712
            WIRE 992 1712 2224 1712
            BEGIN DISPLAY 1120 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PS2D
            WIRE 2608 1648 2784 1648
        END BRANCH
        BEGIN BRANCH PS2C
            WIRE 2608 1584 2784 1584
        END BRANCH
        BEGIN BRANCH CS80_8F
            WIRE 2160 1488 2208 1488
            WIRE 2208 1312 2224 1312
            WIRE 2208 1312 2208 1376
            WIRE 2208 1376 2208 1488
            BEGIN DISPLAY 2208 1376 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_4 1776 1456 R0
        END INSTANCE
        INSTANCE XLXI_73 1600 1488 R0
        BEGIN INSTANCE XLXI_80 1136 1472 R0
        END INSTANCE
        BEGIN BRANCH XLXN_587
            WIRE 1568 1312 1616 1312
            WIRE 1616 1312 1616 1440
            WIRE 1616 1312 1664 1312
            WIRE 1664 1312 1664 1360
            WIRE 1568 1440 1616 1440
        END BRANCH
        INSTANCE XLXI_81 1120 1376 R270
        BEGIN BRANCH uclk
            WIRE 944 864 1168 864
        END BRANCH
        BEGIN INSTANCE XLXI_83 1168 960 R0
        END INSTANCE
        BEGIN BRANCH ck50MHz
            WIRE 1552 800 1888 800
            WIRE 1888 800 2048 800
            WIRE 2048 800 2048 896
            WIRE 2048 896 2192 896
            BEGIN DISPLAY 1888 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 944 800 mclk R180 28
        IOMARKER 944 864 uclk R180 28
        BEGIN BRANCH VSync
            WIRE 2608 864 2784 864
        END BRANCH
        BEGIN BRANCH HSync
            WIRE 2608 832 2784 832
        END BRANCH
        BEGIN BRANCH OutRed(2:0)
            WIRE 2608 656 2784 656
        END BRANCH
        BEGIN BRANCH OutGreen(2:0)
            WIRE 2608 688 2784 688
        END BRANCH
        BEGIN BRANCH OutBlue(2:1)
            WIRE 2608 720 2784 720
        END BRANCH
        IOMARKER 944 1376 EppDB(7:0) R180 28
        BEGIN BRANCH ctlEppDwrOut
            WIRE 1568 1184 1904 1184
            WIRE 1904 1184 2224 1184
            BEGIN DISPLAY 1904 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2784 656 OutRed(2:0) R0 28
        IOMARKER 2784 688 OutGreen(2:0) R0 28
        IOMARKER 2784 720 OutBlue(2:1) R0 28
        IOMARKER 2784 832 HSync R0 28
        IOMARKER 2784 864 VSync R0 28
        IOMARKER 2784 1056 PIO(87:72) R0 28
        IOMARKER 2784 1120 btn(3:0) R0 28
        IOMARKER 2784 1184 sw(7:0) R0 28
        BEGIN INSTANCE XLXI_82 2224 1936 R0
        END INSTANCE
        IOMARKER 2784 1584 PS2C R0 28
        IOMARKER 2784 1648 PS2D R0 28
        IOMARKER 2784 1840 dp R0 28
        IOMARKER 2784 1904 led(7:0) R0 28
        IOMARKER 2784 1968 seg(6:0) R0 28
        IOMARKER 2784 2032 an(3:0) R0 28
        BUSTAP 2688 1776 2688 1872
        IOMARKER 944 1248 EppWr R180 28
        IOMARKER 944 1504 EppWait R180 28
        IOMARKER 944 1120 EppAstb R180 28
        IOMARKER 944 1184 EppDstb R180 28
        BEGIN INSTANCE XLXI_84 2192 816 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
