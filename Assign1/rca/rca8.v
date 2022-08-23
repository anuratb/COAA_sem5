`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    10:49:36 08/25/2021 
// Design Name: 
// Module Name:    rca8 
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
module RCA8(A1,A2,in,S,C);
//Ripple Carry Adder
    //Inputs
    input [7:0] A1;
    input [7:0] A2;
	 input in;
    //Outputs
    output [7:0] S;
    output C;
    wire C1,C2,C3,C4,C5,C6,C7;
    //Connecting the Full Adder Components
    fullAdder U1(A1[0],A2[0],in,S[0],C1);
    fullAdder U2(A1[1],A2[1],C1,S[1],C2);
    fullAdder U3(A1[2],A2[2],C2,S[2],C3);
    fullAdder U4(A1[3],A2[3],C3,S[3],C4);	 
	 fullAdder U5(A1[4],A2[4],C4,S[4],C5);
    fullAdder U6(A1[5],A2[5],C5,S[5],C6);
    fullAdder U7(A1[6],A2[6],C6,S[6],C7);
    fullAdder U8(A1[7],A2[7],C7,S[7],C);

endmodule