`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060)
// 
// Create Date:    15:34:37 09/26/2021 
// Design Name: 
// Module Name:    Comparator32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This is the top module ccombining the other modules of register and comparator
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Comparator32(A,B,op,sel,rst,l,e,g,clk
    );
	input op;//control signal
	input [31:0] A;//First operand
	input [31:0] B;//Second operand
	input sel;//indicating the load/shift
	input rst;//reset signal
	output l,e,g;//output signals
	input clk;//clock
	reg zero = 1'b0;
	wire l1,e1,g1;//temporary outputs
	wire a,b;
	Reg32 R1(.A(A),.in(zero),.op(a),.sel(sel),.clk(clk),.rst(rst));//first register
	Reg32 R2(.A(B),.in(zero),.op(b),.sel(sel),.clk(clk),.rst(rst));//second register
	Seq_unsigned_Comparator32 Cmp(.clk(clk),.l(l1),.e(e1),.g(g1),.a(a),.b(b),.rst(rst),.op(op));//comparator
	and U1(l,op,l1);
	and U2(e,op,e1);
	and U3(g,op,g1);

endmodule
