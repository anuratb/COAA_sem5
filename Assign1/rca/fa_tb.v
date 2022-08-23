`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   11:10:23 08/25/2021
// Design Name:   fullAdder
// Module Name:   /home/ise/COAA_Assign1/fa_tb.v
// Project Name:  COAA_Assign1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fa_tb;

	// Inputs
	reg a;
	reg b;
	reg in;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	fullAdder uut (
		.a(a), 
		.b(b), 
		.in(in), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#2 
		begin
		a = 1;
		in = 0;
		b  =0;
		$monitor("a = %b, b = %b, in = %b : s = %b ,c = %b",a,b,in,s,c);
		end
		#2 
		begin
		a = 1;
		in = 1;
		b  =1;
		$monitor("a = %b, b = %b, in = %b : s = %b ,c = %b",a,b,in,s,c);
		end;
		#2 
		begin
		a = 1;
		in = 0;
		b  =1;
		$monitor("a = %b, b = %b, in = %b : s = %b ,c = %b",a,b,in,s,c);
		end
		#2 
		begin
		a = 1;
		in = 1;
		b  =0;
		$monitor("a = %b, b = %b, in = %b : s = %b ,c = %b",a,b,in,s,c);
		end
		
	end
      
endmodule

