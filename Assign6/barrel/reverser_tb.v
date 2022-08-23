`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal(19CS10060)
//
// Create Date:   16:21:08 10/09/2021
// Design Name:   reverser
// Module Name:   /home/ise/barrel/reverser_tb.v
// Project Name:  barrel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reverser
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reverser_tb;

	// Inputs
	reg [7:0] in;
	reg dir;

	// Outputs
	wire [7:0] rev1;

	// Instantiate the Unit Under Test (UUT)
	reverser uut (
		.in(in), 
		.dir(dir), 
		.rev1(rev1)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		dir = 1;
		in = 8'b11110000;
		
		$monitor("out = %b",rev1);

	end
      
endmodule

