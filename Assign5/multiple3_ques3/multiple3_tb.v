`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group 2
// Name : Anurat Bhattacharya (19CS10071 ), Sunanda Mandal(19CS10060)
//
// Create Date:   08:24:12 09/27/2021
// Design Name:   multiple3
// Module Name:   /home/ise/Desktop/COAA/MULTIPLE3/multiple3_tb.v
// Project Name:  MULTIPLE3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiple3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module multiple3_tb;

	// Inputs
	reg Bit;
	reg reset;
	reg clk;
	// Outputs
	wire out;
	
	// Instantiate the Unit Under Test (UUT)
	multiple3 uut (
		.clk(clk),
		.Bit(Bit), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		Bit = 0;
		reset = 0;
		clk = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		reset = 1;
		#2
		reset=0;
		
		#2
		Bit = 0;$monitor("Current Bit: %b,  out : %b\n",Bit,out);
		#2
		Bit = 1;$monitor("Current Bit: %b,  out : %b\n",Bit,out);;
		#2
		Bit = 1;$monitor("Current Bit: %b,  out : %b\n",Bit,out);
		#2
		Bit = 0;$monitor("Current Bit: %b,  out : %b\n",Bit,out);
		#2
		Bit = 0;$monitor("Current Bit: %b,  out : %b\n",Bit,out);
		#2
		Bit = 1;$monitor("Current Bit: %b,  out : %b\n",Bit,out);
		#2
		$finish;
	end
	always #1 clk = ~clk;
	
      
endmodule

