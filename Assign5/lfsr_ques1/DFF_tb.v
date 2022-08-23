`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal (19CS10060)
//
// Create Date:   19:10:02 09/26/2021
// Design Name:   DFF
// Module Name:   /home/ise/Desktop/COAA/LFSR/DFF_tb.v
// Project Name:  LFSR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DFF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DFF_tb;

	// Inputs
	reg clock;
	reg reset;
	reg D;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	DFF uut (
		.clock(clock), 
		.reset(reset), 
		.D(D), 
		.Q(Q)
	);

	//simulate clock
	always #1 clock = ~clock;
	
	initial begin
		// Initialize Inputs
		clock = 1;
		reset = 1;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		begin
			reset = 1'b0;
			forever #2 D = ~D;
			//$monitor("clk = %b, D = %b : Q = %b ",clock,D,Q);
		end

	end
      
endmodule

