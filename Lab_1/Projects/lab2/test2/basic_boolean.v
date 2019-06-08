`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:00 03/01/2015 
// Design Name: 
// Module Name:    basic_boolean 
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
module basic_boolean(input [0:7]a, output [0:7]b);


assign b[0] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[1] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[2] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[3] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[4] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[5] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[6] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;
assign b[7] = a[1] && a[2] && a[3] && a[4] && a[5] && a[6] && a[7] && a[0] ? 1 : 0;

endmodule
