`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060 
// 
// Create Date:    10:33:30 08/25/2021 
// Design Name: 
// Module Name:    ha 
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

module halfAdder(a,b,s,c);
    input a;
    input b;
    output s;
    output c;
    xor G1(s,a,b);//Compute the sum
	 and G2(c,a,b);//Compute the carry


endmodule

