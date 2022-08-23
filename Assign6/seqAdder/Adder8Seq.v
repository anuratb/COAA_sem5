`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal)
// 
// Create Date:    18:10:00 10/09/2021 
// Design Name: 
// Module Name:    Adder8Seq 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Top Module joining all the other submodules together
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Adder8Seq(clk,load,rst,A,B,cin,S,cout,in
    );
	input [7:0] A;
	input	[7:0] B;
	input	cin,clk,rst,load,in;
	// load  = 1 for loading input else 0
	//rst = 1 for reset
	output [7:0]S;
	output cout;
	//for getting outputs from the input register
	wire [7:0] a;
	wire [7:0] b;
	wire s;//current sum bit
	//Input shift registers
	Reg8 U1(.A(A),.in(in),.rst(rst),.load(load),.clk(clk),.B(a));
	Reg8 U2(.A(B),.in(in),.rst(rst),.load(load),.clk(clk),.B(b));
	
	Reg8 U3(.A(8'b0),.in(s),.rst(rst),.load(load),.clk(clk),.B(S));//shift the output
	seqAdder U4(.a(a[0]),.b(b[0]),.cin(cin),.load(load),.rst(rst),.clk(clk),.s(s),.c(cout));//seq adder block
	
	

endmodule
