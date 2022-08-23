`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   18:04:41 08/25/2021
// Design Name:   RCA16
// Module Name:   /home/ise/COAA_Assign1/rca16_tb.v
// Project Name:  COAA_Assign1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca16_tb;

	// Inputs
	reg [15:0] A1;
	reg [15:0] A2;
	reg in;

	// Outputs
	wire [15:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	RCA16 uut (
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
			A1 = 16'b1;
			$monitor("A1 = %b, A2 = %b, in = %b : S = %b ,C = %b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b1010010100011110;
			A2 = 16'b1110100111110111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b1001001100010110;
			A2 = 16'b1100111111111111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b11110100101010;
			A2 = 16'b1101000010001001;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b100110111011111;
			A2 = 16'b11010110110110;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b111111000011101;
			A2 = 16'b10110100010011;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b1000001000010111;
			A2 = 16'b1100011101101001;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b1110110010000110;
			A2 = 16'b1000011011110;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b1101110100100100;
			A2 = 16'b111110110101000;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b1110011111101;
			A2 = 16'b100010110100100;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 16'b111110010111010;
			A2 = 16'b11100111110100;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end

	end
      
endmodule

