`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060)
//
// Create Date:   13:42:17 09/26/2021
// Design Name:   Reg32
// Module Name:   /home/ise/Xilinx_share/assgn5_coaa/coaa_assgn5/Reg32_test.v
// Project Name:  coaa_assgn5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Reg32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Reg32_test;

	// Inputs
	reg [31:0] A;
	reg in;
	reg sel;
	reg clk;
	reg rst;

	// Outputs
	wire op;
	

	// Instantiate the Unit Under Test (UUT)
	Reg32 uut (
		.A(A), 
		.in(in), 
		.op(op), 
		.sel(sel), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		in = 0;
		sel = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2 
		begin
		rst = 1'b1;
		end
		#2
		begin
		rst  = 1'b0;
		A = 32'hfff;
		sel = 1'b1;		
		end
		#2
		begin
		sel = 0;//Now the shifting starts
		end
		# 64 $finish;
		
	end
	always #1 clk = ~clk;//clock
      
endmodule

