`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:36:50 03/01/2015 
// Design Name: 
// Module Name:    clock_divider 
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
module clock_divider(
    input clk,
    output one_second
    );

reg [25:0] counter;

    // count up on each positive clock
    always @(posedge clk)
            counter <= counter + 4;

    // one second signal would be emitted when 
    // 26th bit of the counter would become "1"
    assign one_second = counter[25];
endmodule
