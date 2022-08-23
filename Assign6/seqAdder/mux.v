`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:16 10/09/2021 
// Design Name: 
// Module Name:    mux 
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
module mux(a0,a1,sel,op
    );
	input a0,a1,sel ;
	output reg op;
	always @(*)
	begin
	if(sel)
		begin
			op = a1;
		end
	else
		begin
			op = a0;
		end
	end

endmodule
