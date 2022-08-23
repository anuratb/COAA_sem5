`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal) 
// 
// Create Date:    18:05:04 10/09/2021 
// Design Name: 
// Module Name:    Reg8 
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
module Reg8(A,in,load,clk,rst,B
    );
	input [7:0] A;  //for parallel loading
	
	input in;      //series input 
	input load;    // switch between parallel load vs shify
	input clk;     //clock
	input rst;    //for resetting all to 0
	output reg [7:0] B;//for storing the intermidiate bits
	always @(posedge clk)
		begin
		if(rst)
			B <= 7'b0;
		else if(load)
			B <= A;
		else
			B <={in,B[7:1]};
		end

endmodule
