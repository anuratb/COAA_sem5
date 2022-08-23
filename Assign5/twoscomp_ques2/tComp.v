`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060)
// 
// Create Date:    17:38:34 09/26/2021 
// Design Name: 
// Module Name:    tComp 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Verilog code to implement a twos complement generator (input fed from lsb side)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tComp(rst,clk,a,b
    );
	 input rst,clk,a;//reset ,clock and input bit
	 output reg b;//output bit
	 reg state;//0 for in the first phase 100...0 1 for the next phase
	 always @(posedge clk or posedge rst)
	 begin
		if(rst)
		begin
			state <=1'b0;
			b<=1'b0;
		end
		else
		begin
			if(state)
			begin
				b<=(!a);//state remains same
			end
			else
			begin
				if(a)
				begin
					b<=1'b1;
					state<=1'b1;//change state
				end
				else
				begin
					b<=1'b0;//state remains same
				end
			end
		end
	 end
	 


endmodule
