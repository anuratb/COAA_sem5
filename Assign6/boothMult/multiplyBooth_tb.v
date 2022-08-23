`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//19CS10071 (Anurat Bhattacharya)  19CS10060 (Sunanda Mandal)
//
// Create Date:   04:54:59 10/10/2021
// Design Name:   multiplyBooth
// Module Name:   /home/ise/Xilinx_share/19CS10071_19CS10060_assgn6/ques3/multiplyBooth_tb.v
// Project Name:  ques3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplyBooth
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module multiplyBooth_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg clk;
	reg rst;
	reg load;

	// Outputs
	wire [15:0] P;

	// Instantiate the Unit Under Test (UUT)
	multiplyBooth uut (
		.A(A), 
		.B(B), 
		.P(P), 
		.clk(clk), 
		.rst(rst), 
		.load(load)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		clk = 1;
		rst = 0;
		load = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#2 rst = 1;
		#2
		begin
		rst = 0;
		end
		#2
		begin
		load = 1;
		//A = 8'b11111101;
		A = 8'b11;     //Multiplicand
		B = 8'b101;	   //Multiplier
		//B = 8'b11111011;
		$monitor("Multiplicand : %b,Multiplier: %b, Product: %b \n",A,B,P);		
		end
		#2
		begin
		 load = 0;
		 
		end
		#16 $finish;

	end
	always #1 clk = ~clk;
      
endmodule

