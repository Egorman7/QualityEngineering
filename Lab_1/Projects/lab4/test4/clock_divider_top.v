`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:54 03/01/2015 
// Design Name: 
// Module Name:    clock_divider_top 
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
/**
 * Top module to test clock divider -
 * blink lamp with 1 second period.
 */
module clock_divider_top(
    input clk,
    output [0:0] ld
    );

    clock_divider count(.clk(clk), .one_second(ld[0]));
endmodule
