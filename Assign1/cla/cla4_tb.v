`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   18:28:29 08/25/2021
// Design Name:   CLA4
// Module Name:   /home/ise/COAA_Assign1_part2/cla4_tb.v
// Project Name:  COAA_Assign1_part2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla4_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg in;

	// Outputs
	wire C;
	wire [3:0] S;
	wire G;
	wire P;

	// Instantiate the Unit Under Test (UUT)
	CLA4 uut (
		.A(A), 
		.B(B), 
		.in(in), 
		.C(C), 
		.S(S), 
		.G(G), 
		.P(P)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		begin
			A = 4'b11;
			B = 4'b110;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b10;
			B = 4'b11;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b0;
			B = 4'b110;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b0;
			B = 4'b100;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b100;
			B = 4'b1001;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b1010;
			B = 4'b101;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b1010;
			B = 4'b101;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b1000;
			B = 4'b0;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		#2
		begin
			A = 4'b1100;
			B = 4'b101;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,C=%b,G=%b,P=%b",A,B,in,S,C,G,P);
		end
		




	end
      
endmodule

