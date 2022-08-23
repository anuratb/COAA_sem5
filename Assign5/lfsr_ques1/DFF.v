`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal (19CS10060)
// 
// Create Date:    04:27:21 09/27/2021 
// Design Name: 
// Module Name:    DFF 
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
module DFF(
input clock,
input reset,
input D,
output reg Q );
	
	always @(posedge clock or posedge reset)
	begin
		if(reset)
			Q <= 1'b0;
		else
			Q <= D;
	end

endmodule
