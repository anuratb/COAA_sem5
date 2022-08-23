`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal (19CS10060)
// 
// Create Date:    19:08:45 09/26/2021 
// Design Name: 
// Module Name:    LFSR 
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
module LFSR( sel,seed, clkslow,rst,wint );
	
	input sel,clkslow,rst;
	input [3:0] seed;
	output [3:0] wint;
	
	wire w1,w2,w3,w4;
	//output reg wint;
	//always @( * )
	//begin
		DFF d1(clkslow,rst,wint[0],w2);
		DFF d2(clkslow,rst,wint[1],w3);
		DFF d3(clkslow,rst,wint[2],w4);
		DFF d4(clkslow,rst,wint[3],w5);
		
		xor X1(w1,w4,w5);
		//w1 = w4^w5;
		
		MUX m1(w1,seed[3],sel,wint[0]);
		MUX m2(w2,seed[2],sel,wint[1]);
		MUX m3(w3,seed[1],sel,wint[2]);
		MUX m4(w4,seed[0],sel,wint[3]);
		
		//assign NS = wint[3:0]
	//end	
	
endmodule
