`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    10:36:18 08/25/2021 
// Design Name: 
// Module Name:    fa 
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
module fullAdder(a,b,in,s,c);
	//Inputs and outputs
    input a;
    input b;
	 input in;
    output s;
    output c;
	 wire w1,w2,w3,w4;
    xor G1(w4,a,b);//a^b
	 xor G6(s,w4,in);//a^b^in that is the sum
	 and G2(w1,a,b);//a&b
	 and G3(w2,a,in);//a&in
	 and G4(w3,b,in);//b&in
	 or G5(c,w1,w2,w3);//c = a.b+b.in+a.in


endmodule
