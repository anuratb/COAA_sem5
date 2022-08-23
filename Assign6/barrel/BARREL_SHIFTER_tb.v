`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal(19CS10060)
//
// Create Date:   16:35:51 10/09/2021
// Design Name:   BARREL_SHIFTER
// Module Name:   /home/ise/barrel/BARREL_SHIFTER_tb.v
// Project Name:  barrel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BARREL_SHIFTER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BARREL_SHIFTER_tb;

	// Inputs
	reg [7:0] in;
	reg [2:0] shamt;
	reg dir;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	BARREL_SHIFTER uut (
		.in(in), 
		.shamt(shamt), 
		.dir(dir), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shamt = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		begin
			in = 8'b11111111;
			shamt = 3'b101;
			$monitor("in = %b, shamt = %b , dir = %b,  out = %b",in,shamt,dir,out);
		end
		#2
		begin
			in = 8'b11111111;
			shamt = 3'b111;
			$monitor("in = %b, shamt = %b , dir = %b,  out = %b",in,shamt,dir,out);
		end
		#2
		begin
			in = 8'b11111111;
			shamt = 3'b011;
			dir = 1;
			$monitor("in = %b, shamt = %b , dir = %b,  out = %b",in,shamt,dir,out);
		end
		#2
		begin
			in = 8'b11111111;
			shamt = 3'b001;
			dir = 1;
			$monitor("in = %b, shamt = %b , dir = %b,  out = %b",in,shamt,dir,out);
		end

	end
      
endmodule

