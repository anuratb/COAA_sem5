`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal)
// 
// Create Date:    17:42:02 10/09/2021 
// Design Name: 
// Module Name:    seqAdder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Submodule containing sequentiall addtion logic
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seqAdder(a,b,cin,s,c,clk,rst,load
    );
	input a,b,cin,load,clk,rst;
	output  s;
	output  c;
	wire cout,w1,w2,w3,c1;
	// c1 : input to DFF
	mux U1(.a0(c),.a1(cin),.sel(load),.op(c1));
	DFF U2(.d(c1),.q(cout),.rst(rst),.clk(clk));
	xor U3(s,a,b,cout);
	and U4(w1,a,b);
	and U5(w2,b,cout);
	and U6(w3,a,cout);
	or U7(c,w1,w2,w3);
	
endmodule
