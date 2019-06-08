`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:54:26 03/01/2015 
// Design Name: 
// Module Name:    seven_driver_basys2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seven_driver_basys2(
    input [0:0] sw,
    output [0:3] an,
    output [0:6] seg
    );

seven_driver driver57(.value(sw[0]), .an(an), .segments(seg));

endmodule
