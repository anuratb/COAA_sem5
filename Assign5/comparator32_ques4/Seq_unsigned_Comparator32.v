`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060) 
// 
// Create Date:    14:09:11 09/26/2021 
// Design Name: 
// Module Name:    Seq_unsigned_Comparator32 
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
module Seq_unsigned_Comparator32(clk,l,e,g,a,b,rst,op
    );
	input clk,rst;
	input a,b;
	input op;// input signal op
	reg state;//current state 
	output reg l,e,g;
	always @(posedge clk or posedge rst)
		begin
			
			if(rst)  //reset clause
				begin
				state <= 1'b0;
				e <= 1'b0;
				l <= 1'b0;
				g <= 1'b0;
				end
			else if(!op)
				begin
				if(!state)				
					begin
					if(a && !b) //a = 1, b = 0
						begin
						g<=1'b1;
						e<=1'b0;
						l<=1'b0;
						state <= 1'b1;
						end
					else if(b && !a) // a = 0, b = 1
						begin
						g<=1'b0;
						l<=1'b1;
						e<=1'b0;
						state<=1'b1;
						end
					else
						begin
						g<=1'b0;
						l<=1'b0;
						e<=1'b1;
						state<=1'b0;
						end
					end
				end
		end
endmodule
