`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal)
//
// Create Date:   05:24:02 10/10/2021
// Design Name:   RCAS8
// Module Name:   /home/ise/Xilinx_share/19CS10071_19CS10060_assgn6/ques3/RCAS8_tb.v
// Project Name:  ques3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCAS8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCAS8_tb;

	// Inputs
	reg [7:0] A1;
	reg [7:0] A2;
	
	reg mode;

	// Outputs
	wire [7:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	RCAS8 uut (
		.A1(A1), 
		.A2(A2), 		
		.S(S), 
		.C(C), 
		.mode(mode)
	);

	initial begin
		// Initialize Inputs
		A1 = 0;
		A2 = 0;
		
		mode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#2
		begin
		$monitor("A1: %b, A2: %b, mode : %b, S: %b\n",A1,A2,mode,S);
		A1 = 8'b11;
		A2 = 8'b10;		
		end
		#2
		begin
		A1 = 8'b101;
		A2 = 8'b11;
		mode = 1'b1;
		end
		
	end
      
endmodule

