`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal (19CS10060)
//
// Create Date:   23:32:55 09/26/2021
// Design Name:   LFSR
// Module Name:   /home/ise/Desktop/COAA/LFSR/LFSR_tb.v
// Project Name:  LFSR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LFSR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LFSR_tb;

	// Inputs
	reg sel;
	reg [3:0] seed;
	reg clkslow;
	reg rst;
	wire [3:0] wint;
	reg [31:0] i;

	// Instantiate the Unit Under Test (UUT)
	LFSR uut (
		.sel(sel), 
		.seed(seed), 
		.clkslow(clkslow), 
		.rst(rst), 
		.wint(wint)
	);
	
	//simulate clock
	//always #10 clkslow = ~clkslow;

	initial begin
		// Initialize Inputs
		sel = 0;
		seed = 4'b0;
		clkslow = 0;
		rst = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		rst = 1'b1;
		#2
		begin
		seed = 4'b1111;
		sel = 1'b1;
		rst = 1'b0;
		end
		
		#2
		sel = 1'b0;//start the shifting
		#28 $finish;
		
		//for( i=0; i<15;i=i+1)
		//begin		
			//#2
			//$monitor("number: %b",wint);
		//end

	end
	always #1 clkslow = ~clkslow;
	always @(wint)
	begin
	$monitor("number: %b%b%b%b",wint[0],wint[1],wint[2],wint[3]);
	end
      
endmodule

