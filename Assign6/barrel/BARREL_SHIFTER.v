`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal(19CS10060)
// 
// Create Date:    10:42:10 10/09/2021 
// Design Name: 
// Module Name:    BARREL_SHIFTER 
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
module BARREL_SHIFTER(
input [7:0] in, 
input [2:0] shamt, 
input dir, 
output [7:0] out);
wire[7:0] rev1,levb2,levb1, levb0, rev2;
//reverse the input
	reverser r1(in[7:0],dir,rev1[7:0]);
//apply b2
	MUX m1(rev1[0],rev1[4],shamt[2],levb2[0]);
	MUX m2(rev1[1],rev1[5],shamt[2],levb2[1]);
	MUX m3(rev1[2],rev1[6],shamt[2],levb2[2]);
	MUX m4(rev1[3],rev1[7],shamt[2],levb2[3]);
	MUX m5(rev1[4],1'b0,shamt[2],levb2[4]);
	MUX m6(rev1[5],1'b0,shamt[2],levb2[5]);
	MUX m7(rev1[6],1'b0,shamt[2],levb2[6]);
	MUX m8(rev1[7],1'b0,shamt[2],levb2[7]);
//apply b1
	MUX m9(levb2[0],levb2[2],shamt[1],levb1[0]);
	MUX m10(levb2[1],levb2[3],shamt[1],levb1[1]);
	MUX m11(levb2[2],levb2[4],shamt[1],levb1[2]);
	MUX m12(levb2[3],levb2[5],shamt[1],levb1[3]);
	MUX m13(levb2[4],levb2[6],shamt[1],levb1[4]);
	MUX m14(levb2[5],levb2[7],shamt[1],levb1[5]);
	MUX m15(levb2[6],1'b0,shamt[1],levb1[6]);
	MUX m16(levb2[7],1'b0,shamt[1],levb1[7]);
//apply b0
	MUX m17(levb1[0],levb1[1],shamt[0],levb0[0]);
	MUX m18(levb1[1],levb1[2],shamt[0],levb0[1]);
	MUX m19(levb1[2],levb1[3],shamt[0],levb0[2]);
	MUX m20(levb1[3],levb1[4],shamt[0],levb0[3]);
	MUX m21(levb1[4],levb1[5],shamt[0],levb0[4]);
	MUX m22(levb1[5],levb1[6],shamt[0],levb0[5]);
	MUX m23(levb1[6],levb1[7],shamt[0],levb0[6]);
	MUX m24(levb1[7],1'b0,shamt[0],levb0[7]);

//reverse the output
	reverser r2(levb0[7:0],dir,rev2[7:0]);
//final output
	assign out[7:0] = rev2[7:0];
endmodule
