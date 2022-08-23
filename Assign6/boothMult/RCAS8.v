`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal) 
// 
// Create Date:    19:47:31 10/09/2021 
// Design Name: 
// Module Name:    RCAS8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 8 Bit adder subtractor
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RCAS8(A1,A2,S,C,mode);
//Ripple Carry Adder
    //Inputs
    input [7:0] A1;
    input [7:0] A2;
	 
	 input mode;//mode  = 1 for subtraction
    //Outputs
    output [7:0] S;
    output C;
    wire C1,C2,C3,C4,C5,C6,C7;
	 wire w1,w2,w3,w4,w5,w6,w7,w8;
    //Connecting the Full Adder Components
	 xor W1(w1,A2[0],mode);
    fullAdder U1(A1[0],w1,mode,S[0],C1);
	 xor W2(w2,A2[1],mode);
    fullAdder U2(A1[1],w2,C1,S[1],C2);
	  xor W3(w3,A2[2],mode);
    fullAdder U3(A1[2],w3,C2,S[2],C3);
	  xor W4(w4,A2[3],mode);
    fullAdder U4(A1[3],w4,C3,S[3],C4);	 
	  xor W5(w5,A2[4],mode);
	 fullAdder U5(A1[4],w5,C4,S[4],C5);
	  xor W6(w6,A2[5],mode);
    fullAdder U6(A1[5],w6,C5,S[5],C6);
	  xor W7(w7,A2[6],mode);
    fullAdder U7(A1[6],w7,C6,S[6],C7);
	  xor W8(w8,A2[7],mode);
    fullAdder U8(A1[7],w8,C7,S[7],C);

endmodule
