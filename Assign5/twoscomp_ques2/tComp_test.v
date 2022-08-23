`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060)
//
// Create Date:   17:48:44 09/26/2021
// Design Name:   tComp
// Module Name:   /home/ise/Xilinx_share/assgn5_coaa/twos_complement/tComp_test.v
// Project Name:  twos_complement
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tComp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tComp_test;

	// Inputs
	reg rst;
	reg clk;
	reg a;
	reg [31:0] A ;
	reg [31:0] B;
	reg [31:0] i;
	// Outputs
	wire b;

	// Instantiate the Unit Under Test (UUT)
	tComp uut (
		.rst(rst), 
		.clk(clk), 
		.a(a), 
		.b(b)
	);
	
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		a = 0;
		
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
		end
		#2
		begin
		A = 32'b10110001000100;//input value
		$monitor("A: %b ",A);
		B = 32'b0;
		end
		#2
		for(i=0;i<32;i = i+1)
		begin
			a = A[0];
			#2
			begin
			B = B>>1;			
			B[31] = b;
			A = A>>1;
			end
		end
		$monitor("B : %b",B);	//finsl answer in twos omplement	
		#1 $finish;
	end
   always #1 clk = ~clk;
endmodule

