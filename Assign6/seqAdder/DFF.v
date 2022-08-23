`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:14 10/09/2021 
// Design Name: 
// Module Name:    DFF 
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
module DFF(d,q,clk,rst
    );
	 input d,clk,rst;
	 output reg q;
	always @(posedge clk)
	begin
		if(rst)
			begin
			q<=1'b0;
			end
		else
			begin
			q<=d;
			end
	end

endmodule
