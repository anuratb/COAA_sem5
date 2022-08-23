`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    10:51:24 08/25/2021 
// Design Name: 
// Module Name:    rca32 
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
module RCA32(A1,A2,in,S,C);
//Ripple Carry Adder
    //Inputs
    input [31:0] A1;
    input [31:0] A2;
	 input in;
    //Outputs
    output [31:0] S;
    output C;
    
    //Connecting the Full Adder Components
    wire C1;
	 RCA16 U1(A1[15:0],A2[15:0],in,S[15:0],C1);
	 RCA16 U2(A1[31:16],A2[31:16],C1,S[31:16],C);
endmodule
