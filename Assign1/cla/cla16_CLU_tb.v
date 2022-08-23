`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   09:33:21 08/27/2021
// Design Name:   CLA16_CLU
// Module Name:   /home/ise/COAA_Assign1_part2/cla16_CLU_tb.v
// Project Name:  COAA_Assign1_part2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA16_CLU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla16_CLU_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg in;

	// Outputs
	wire [15:0] S;
	wire Cout;
	wire Pout;
	wire Gout;

	// Instantiate the Unit Under Test (UUT)
	CLA16_CLU uut (
		.A(A), 
		.B(B), 
		.in(in), 
		.S(S), 
		.Cout(Cout), 
		.Pout(Pout), 
		.Gout(Gout)
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
			A = 16'b1001100111011110;
			B = 16'b1011100000011011;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b111100100010100;
			B = 16'b1010100000101011;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b100110011010;
			B = 16'b1011001010110111;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b110100100110000;
			B = 16'b100100101000110;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b1010000101100001;
			B = 16'b100000000110110;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b101000101110;
			B = 16'b1000011000101011;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b110100101100110;
			B = 16'b111010000100011;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b100010001100001;
			B = 16'b1000010100111011;
			in = 0;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b10011101110110;
			B = 16'b1110101100101000;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b110001110010101;
			B = 16'b111000010110111;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end
		#2
		begin
			A = 16'b111111111011101;
			B = 16'b111000010110111;
			in = 1;
			$monitor("A = %b, B = %b,in = %b : S = %b,Cout=%b,Gout=%b,Pout=%b",A,B,in,S,Cout,Gout,Pout);
		end




	end
      
endmodule

