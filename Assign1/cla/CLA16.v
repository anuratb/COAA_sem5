`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    18:34:30 08/25/2021 
// Design Name: 
// Module Name:    CLA16 
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
module CLA16(A,B,in,S,Cout,Pout,Gout);
//Wih ripling
	input [15:0] A,B;
	input in;
	output[15:0] S;
	output Pout,Gout,Cout;
	wire C0,C1,C2;
	wire w1,w2,w3,w4,w5,w6,w7;
	wire G0,G1,G2,G3,P0,P1,P2,P3;
	
	CLA4 U1(A[3:0],B[3:0],in,S[3:0],C0,G0,P0);
	
	CLA4 U2(A[7:4],B[7:4],C0,S[7:4],C1,G1,P1);	

	CLA4 U3(A[11:8],B[11:8],C1,S[11:8],C2,G2,P2);	
	
	CLA4 U4(A[15:12],B[15:12],C2,S[15:12],Cout,G3,P3);	
	and U14(w6,G2,P3);
	and U15(w7,G1,P3,P2);
	and U16(w8,G0,P3,P2,P1);
	and U5(Pout,P3,P2,P1,P0);
	or U6(Gout,G3,w6,w7,w8);
	
endmodule
