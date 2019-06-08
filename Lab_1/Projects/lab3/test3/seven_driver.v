`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:54 03/01/2015 
// Design Name: 
// Module Name:    seven_driver 
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
module seven_driver(
    input value,
    output [0:3] an,
    output [0:6] segments
    );

     // value=true - 7
     // value=false - 5  

		assign an[0] = value ? "0" : "0";
		assign an[1] = value ? "0" : "0";
		assign an[2] = value ? "1" : "1";
		assign an[3] = value ? "1" : "1";
		
	  assign segments[0] = value ? 1 : 0;
     assign segments[1] = value ? 0 : 0;
     assign segments[2] = value ? 0 : 1;
     assign segments[3] = value ? 1 : 0;
     assign segments[4] = value ? 1 : 0;
     assign segments[5] = value ? 1 : 1;
     assign segments[6] = value ? 1 : 0;
     //assign segments[7] = value ? 0 : 1;
endmodule
