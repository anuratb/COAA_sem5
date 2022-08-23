`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060)
// 
// Create Date:    13:19:08 09/26/2021 
// Design Name: 
// Module Name:    Reg32 
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
module Reg32(A,in,op,sel,clk,rst
    );
	input [31:0] A;  //for parallel loading
	output reg op;  //output 	
	input in;//series input 
	input sel; // switch between parallel load vs shify
	input clk; //clock
	input rst;//for resetting all to 0
	reg [30:0] B;//for storing the intermidiate bits
	always @(posedge clk or posedge rst or posedge sel)
		begin
		if(rst)
			{op,B [30:0]} <= 32'b0;
		else if(sel)
			{op,B[30:0]} <= A;
		else
			{op,B[30:0]} <={B[30:0],in};
		end

endmodule
