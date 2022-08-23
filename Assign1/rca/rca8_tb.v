`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   18:06:09 08/25/2021
// Design Name:   RCA8
// Module Name:   /home/ise/COAA_Assign1/rca8_tb.v
// Project Name:  COAA_Assign1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca8_tb;

	// Inputs
	reg [7:0] A1;
	reg [7:0] A2;
	reg in;

	// Outputs
	wire [7:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	RCA8 uut (
		.A1(A1), 
		.A2(A2), 
		.in(in), 
		.S(S), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A1 = 0;
		A2 = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		begin
			A1 = 8'b1;
			$monitor("A1 = %b, A2 = %b, in = %b : S = %b ,C = %b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b1011001;
			A2 = 8'b10011110;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b11011110;
			A2 = 8'b1111001;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b11101001;
			A2 = 8'b10010100;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b11010;
			A2 = 8'b11111011;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b11101111;
			A2 = 8'b11110111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b1100111;
			A2 = 8'b1110111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b10001000;
			A2 = 8'b1011110;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b10100101;
			A2 = 8'b1100101;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b11001110;
			A2 = 8'b111010;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 8'b10010010;
			A2 = 8'b0;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end

	end
      
endmodule

