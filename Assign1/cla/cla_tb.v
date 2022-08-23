`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   11:12:15 08/27/2021
// Design Name:   CLA
// Module Name:   /home/ise/COAA_Assign1_part2/cla_tb.v
// Project Name:  COAA_Assign1_part2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_tb;

	// Inputs
	reg a;
	reg b;
	reg in;

	// Outputs
	wire S;
	wire G;
	wire P;

	// Instantiate the Unit Under Test (UUT)
	CLA uut (
		.a(a), 
		.b(b), 
		.in(in), 
		.S(S), 
		.G(G), 
		.P(P)
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
			a = 1'b1;
			b = 1'b0;
			in = 0;
			$monitor("a = %b, b = %b,in = %b : S = %b,G=%b,P=%b",a,b,in,S,G,P);
		end
		#2
		begin
			a = 1'b1;
			b = 1'b1;
			in = 1;
			$monitor("a = %b, b = %b,in = %b : S = %b,G=%b,P=%b",a,b,in,S,G,P);
		end
		#2
		begin
			a = 1'b0;
			b = 1'b0;
			in = 0;
			$monitor("a = %b, b = %b,in = %b : S = %b,G=%b,P=%b",a,b,in,S,G,P);
		end
		#2
		begin
			a = 1'b0;
			b = 1'b1;
			in = 0;
			$monitor("a = %b, b = %b,in = %b : S = %b,G=%b,P=%b",a,b,in,S,G,P);
		end
		#2
		begin
			a = 1'b0;
			b = 1'b1;
			in = 1;
			$monitor("a = %b, b = %b,in = %b : S = %b,G=%b,P=%b",a,b,in,S,G,P);
		end
	end
      
endmodule

