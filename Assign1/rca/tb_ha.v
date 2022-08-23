`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
//
// Create Date:   11:21:49 08/25/2021
// Design Name:   halfAdder
// Module Name:   /home/ise/COAA_Assign1/tb_ha.v
// Project Name:  COAA_Assign1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ha;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	halfAdder uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	
		#2 
		begin
		a = 0;
		b  =0;
		$monitor("a = %b, b = %b : s = %b ,c = %b",a,b,s,c);
		end
		#2 
		begin
		a = 0;
		b  =1;
		$monitor("a = %b, b = %b : s = %b ,c = %b",a,b,s,c);
		end
		#2 
		begin
		a = 1;
		b  =0;
		$monitor("a = %b, b = %b : s = %b ,c = %b",a,b,s,c);
		end
		#2 
		begin
		a = 1;
		b  =1;
		$monitor("a = %b, b = %b : s = %b ,c = %b",a,b,s,c);
		end
		
		

	end
	
      
endmodule

