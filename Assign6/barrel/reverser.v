`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal(19CS10060)
// 
// Create Date:    10:59:26 10/09/2021 
// Design Name: 
// Module Name:    reverser 
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
module reverser(
input[7:0] in,
input dir,
output[7:0] rev1
    );
	MUX m1(in[0],in[7],dir,rev1[0]);
	MUX m2(in[1],in[6],dir,rev1[1]);
	MUX m3(in[2],in[5],dir,rev1[2]);
	MUX m4(in[3],in[4],dir,rev1[3]);
	MUX m5(in[4],in[3],dir,rev1[4]);
	MUX m6(in[5],in[2],dir,rev1[5]);
	MUX m7(in[6],in[1],dir,rev1[6]);
	MUX m8(in[7],in[0],dir,rev1[7]);

endmodule
