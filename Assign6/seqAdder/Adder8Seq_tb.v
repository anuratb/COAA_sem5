`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal)
//
// Create Date:   04:02:21 10/10/2021
// Design Name:   Adder8Seq
// Module Name:   /home/ise/Xilinx_share/19CS10071_19CS10060_assgn6/SeqAdder/Adder8Seq_tb.v
// Project Name:  SeqAdder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder8Seq
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Adder8Seq_tb;

	// Inputs
	reg clk;
	reg load;
	reg rst;
	reg [7:0] A;
	reg [7:0] B;
	reg cin;
	reg in;

	// Outputs
	wire [7:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Adder8Seq uut (
		.clk(clk), 
		.load(load), 
		.rst(rst), 
		.A(A), 
		.B(B), 
		.cin(cin), 
		.S(S), 
		.cout(cout), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		load = 0;
		rst = 0;
		A = 0;
		B = 0;
		cin = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		begin
		rst = 1'b1;
		end
		#2
		begin
		rst = 1'b0;
		A = 8'b1101;
		B = 8'b100110;
		load = 1'b1;
		end
		#2		load = 1'b0;
		#16		
		begin
			$monitor("A: %b, B: %b, S: %b, C: %d\n",A,B,S,cout);	
		end
		#1 $finish;
		
	end
   always #1 clk = ~clk;
	
endmodule

