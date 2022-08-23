`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group 2
// Name : Anurat Bhattacharya (19CS10071 ), Sunanda Mandal(19CS10060)
// 
// Create Date:    05:04:22 09/27/2021 
// Design Name: 
// Module Name:    multiple3 
// Project Name: Multiple of 3 detector
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
module multiple3(
	input clk,
	input Bit,
	input reset,
	output reg out );
	
	reg [1:0] state;
	parameter[1:0] P0=2'b0,P1=2'b1,P2=2'b10; //states
	
	always @(posedge clk or posedge reset)
	begin
		if(reset)
		begin   //reset
			state <= P0;
			out <= 1'b1;
		end
		else
		begin			
			case(state)			
				P0:
				begin
					if(Bit)
						begin
						state <= P1;   //0*2+1 = 1 mod 3
						out <= 1'b0;   
						end
					else
						begin
						state <= P0;  //0*2 + 0 = 0 mod 3
						out <= 1'b1;
						end
				end
				P1:
				begin
					if(Bit)
					begin
						state <= P0;  //1*2+1 = 0 mod 3
						out <= 1'b1;
					end
					else
					begin
						state <= P2;  //1*2+0 = 2 mod 3
						out <= 1'b0;
					end
				end
				P2:
				begin
					if(Bit)
					begin
						state<=P2;  //2*2+1 = 5 = 2 mod 3
						out<=1'b0;
					end
					else
					begin
						state<=P1;  //2*2+0 = 4 = 1 mod 3
						out<=1'b0;
					end
				end
				default:
				begin
					state <= P0;   //set to reset state
					out <= 1'b1;
				end
			endcase			
		end
	end

endmodule
