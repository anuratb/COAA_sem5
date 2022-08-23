`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya(19CS10071) Sunanda Mandal(19CS10060)
//
// Create Date:   16:03:34 09/26/2021
// Design Name:   Comparator32
// Module Name:   /home/ise/Xilinx_share/assgn5_coaa/coaa_assgn5/comparator32_test.v
// Project Name:  coaa_assgn5
// Target Device:  
// Tool versions:  
// Description: Implements the main comparator module
//
// Verilog Test Fixture created by ISE for module: Comparator32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comparator32_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg op;
	reg sel;
	reg rst;
	reg clk;

	// Outputs
	wire l;
	wire e;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	Comparator32 uut (
		.A(A), 
		.B(B), 
		.op(op), 
		.sel(sel), 
		.rst(rst), 
		.l(l), 
		.e(e), 
		.g(g), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		op = 0;
		sel = 0;
		rst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//FIRST TEST : A< B Expected output l=1,e=0,g=0
		#2
		begin
		rst = 1'b1;   //first reset
		end
		#2
		begin
		rst = 1'b0;
		op = 1'b0;//set op to 0
		A = 32'h35ffaaaa;
		B = 32'h36345333;
		sel = 1'b1;//load to registers
		end
		#2
		begin
		sel = 1'b0;//start the operations
		end
		#64    op = 1'b1;//terminate after 32 clock cycles
		
		
		
		
		//SECOND TEST : A = B Expected output l=0,e=1,g=0 ,when op = 1
		#2
		begin
		op = 1'b0;
		end
		#2
		begin
		rst = 1'b1;   //first reset
		end
		#2
		begin
		rst = 1'b0;
		op = 1'b0;//set op to 0
		A = 32'h13314135;
		B = 32'h13314135;
		sel = 1'b1;//load to registers
		end
		#2
		begin
		sel = 1'b0;//start the operations
		end
		#64    op = 1'b1;//terminate after 32 clock cycles

		
		//THIRD TEST : A > B Expected output l=0,e=0,g=1 , when op = 1
		#2
		begin
		op = 1'b0;
		end
		#2
		begin
		rst = 1'b1;   //first reset		
		end
		#2
		begin
		rst = 1'b0;
		op = 1'b0;//set op to 0
		B = 32'h35ffaaaa;
		A = 32'h36345333;
		sel = 1'b1;//load to registers
		end
		#2
		begin
		sel = 1'b0;//start the operations
		end
		#64    op = 1'b1;//terminate after 32 clock cycles

		
		
	end
	always #1 clk = ~clk;//clock
	always @(op) $monitor("A: %d, B:%d, l:%b ,e:%b, g:%b, op:%b \n",A,B,l,e,g,op);

	
      
endmodule

