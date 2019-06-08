`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:51:11 03/01/2015 
// Design Name: 
// Module Name:    basic_boolean_basys2 
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
module basic_boolean_basys2(
    input [0:7] sw,
    output [0:7] ld);

basic_boolean impl(.a(sw[0:7]), .b(ld[0:7]));

endmodule
