`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    11:45:43 08/27/2021 
// Design Name: 
// Module Name:    RCA4 
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
module RCA4(A1,A2,in,S,C
    );
	//Ripple Carry Adder
    //Inputs
    input [3:0] A1;
    input [3:0] A2;
	 input in;
    //Outputs
    output [3:0] S;
    output C;
    wire C1,C2,C3;
    //Connecting the Full Adder Components
    fullAdder U1(A1[0],A2[0],in,S[0],C1);
    fullAdder U2(A1[1],A2[1],C1,S[1],C2);
    fullAdder U3(A1[2],A2[2],C2,S[2],C3);
    fullAdder U4(A1[3],A2[3],C3,S[3],C);	 
	


endmodule
