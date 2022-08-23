`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   18:03:19 08/25/2021
// Design Name:   RCA32
// Module Name:   /home/ise/COAA_Assign1/rca32_tb.v
// Project Name:  COAA_Assign1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca32_tb;

	// Inputs
	reg [31:0] A1;
	reg [31:0] A2;
	reg in;

	// Outputs
	wire [31:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	RCA32 uut (
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
			A1 = 32'b1;
			$monitor("A1 = %b, A2 = %b, in = %b : S = %b ,C = %b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b1011111110100101100100111101100;
			A2 = 32'b1100011101110010000010001001110;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b1000010100101101010010000000110;
			A2 = 32'b1100101010100101011111101100;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b111000111001111111101000010010;
			A2 = 32'b110011101011100000011101010000;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b101100001011000101010010011;
			A2 = 32'b11100011011101110110100111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b1110011010001000100111110;
			A2 = 32'b111011100101100000001100111110;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b110111001000010111011100000000;
			A2 = 32'b110111111111011001000100101111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b1111011000100110000100111101110;
			A2 = 32'b1000010011000100011100000100011;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b10010010001010010011001100000;
			A2 = 32'b1110100010100011000001101101001;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b110010100110011100111000100100;
			A2 = 32'b1011001000100011001100001100001;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 32'b1001010010111111001000100111100;
			A2 = 32'b10000010110110110100101101111;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end


	end
      
endmodule

