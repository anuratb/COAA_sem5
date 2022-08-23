`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal(19CS10060) 
// 
// Create Date:    10:32:34 10/09/2021 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
input x,
input y,
input s,
output reg p );

	always @(x or y or s) 
		begin 
		 if(s) 
			p = y;
		 else 
			p = x;
		end

endmodule
