`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    10:50:52 08/25/2021 
// Design Name: 
// Module Name:    rca16 
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
module RCA16(A1,A2,in,S,C);
//Ripple Carry Adder
    //Inputs
    input [15:0] A1;
    input [15:0] A2;
	 input in;
    //Outputs
    output [15:0] S;
    output C;
    
    //Connecting the Full Adder Components
    wire C1;
	 RCA8 U1(A1[7:0],A2[7:0],in,S[7:0],C1);
	 RCA8 U2(A1[15:8],A2[15:8],C1,S[15:8],C);
endmodule

