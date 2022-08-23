`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    10:51:56 08/25/2021 
// Design Name: 
// Module Name:    rca64 
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
module RCA64(A1,A2,in,S,C);
//Ripple Carry Adder
    //Inputs
    input [63:0] A1;
    input [63:0] A2;
	 input in;
    //Outputs
    output [63:0] S;
    output C;
    
    //Connecting the Full Adder Components
    wire C1;
	 RCA32 U1(A1[31:0],A2[31:0],in,S[31:0],C1);
	 RCA32 U2(A1[63:32],A2[63:32],C1,S[63:32],C);
endmodule
