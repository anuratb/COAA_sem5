`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name : Anurat Bhattacharya (19CS10071) Sunanda Mandal (19CS10060)
//
// Create Date:   17:36:43 09/26/2021
// Design Name:   MUX
// Module Name:   /home/ise/Desktop/COAA/LFSR/MUX_tb.v
// Project Name:  LFSR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_tb;

	// Inputs
	reg x;
	reg y;
	reg s;

	// Outputs
	wire p;

	// Instantiate the Unit Under Test (UUT)
	MUX uut (
		.x(x), 
		.y(y), 
		.s(s), 
		.p(p)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		begin
			x = 1'b1;
			y = 1'b0;
			s = 0;
			$monitor("x = %b, y = %b, s = %b : p = %b",x,y,s,p);
		end
		#2
		begin
			x = 1'b0;
			y = 1'b1;
			s = 0;
			$monitor("x = %b, y = %b, s = %b : p = %b",x,y,s,p);
		end
		#2
		begin
			x = 1'b1;
			y = 1'b0;
			s = 1;
			$monitor("x = %b, y = %b, s = %b : p = %b",x,y,s,p);
		end
		#2
		begin
			x = 1'b0;
			y = 1'b1;
			s = 1;
			$monitor("x = %b, y = %b, s = %b : p = %b",x,y,s,p);
		end
	end
      
endmodule

