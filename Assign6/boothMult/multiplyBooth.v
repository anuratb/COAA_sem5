`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal) 
// 
// Create Date:    17:37:22 10/09/2021 
// Design Name: 
// Module Name:    multiplyBooth 
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
module multiplyBooth(A,B,P,clk,rst,load
    );
	input [7:0] A;//multiplicand
	input [7:0] B;//multiplier
	output reg [15:0] P;
	input clk,rst,load;
	reg Q;//residual bit
	wire [7:0] wireAdd;
	wire [7:0] wireSub;
	RCAS8 U1(.A1(P[15:8]),.A2(A),.S(wireAdd),.C(w1),.mode(1'b0));//Add case	
	RCAS8 U2(.A1(P[15:8]),.A2(A),.S(wireSub),.C(w1),.mode(1'b1));//subtract case
	always @(posedge clk)
	begin
		if(rst)
		begin
			Q<=1'b0;
			P<=16'b0;
		end
		else if (load)
		begin
			Q<=1'b0;
			P<={8'b0,B};
		end
		else
		begin
			if(Q&P[0])  // 1 1
			begin
				P <= {P[15],P[15:1]};
				Q <=P[0];
			end
			else if(!Q & !P[0]) // 0 0
			begin
				P <= {P[15],P[15:1]};
				Q <=P[0];
			end
			else if(!P[0] & Q)//0 1 case
			begin
				P<= {wireAdd[7],wireAdd,P[7:1]};
				Q<=P[0];
			end
			else if(P[0] & !Q) // 1 0 case
			begin
				P<= {wireSub[7],wireSub,P[7:1]};
				Q<=P[0];
			end
		end
	end
	
endmodule
