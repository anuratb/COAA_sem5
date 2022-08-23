`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   11:47:12 08/27/2021
// Design Name:   RCA4
// Module Name:   /home/ise/COAA_Assign1/rca4_tb.v
// Project Name:  COAA_Assign1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca4_tb;

	// Inputs
	reg [3:0] A1;
	reg [3:0] A2;
	reg in;

	// Outputs
	wire [3:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	RCA4 uut (
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
			A1 = 4'b110;
			A2 = 4'b111;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b111;
			A2 = 4'b1001;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b10;
			A2 = 4'b1001;
			in = 0;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b1001;
			A2 = 4'b101;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b1111;
			A2 = 4'b1011;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b11;
			A2 = 4'b1111;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b1110;
			A2 = 4'b1111;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b1011;
			A2 = 4'b1100;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b1101;
			A2 = 4'b1;
			in = 1;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
		#2
		begin
			A1 = 4'b0;
			A2 = 4'b111;
			in = 0;
			$monitor("A1 = %b, A2 = %b,in = %b : S = %b,C=%b",A1,A2,in,S,C);
		end
	end
      
endmodule

