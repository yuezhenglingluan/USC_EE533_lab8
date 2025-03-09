`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:27 03/08/2025
// Design Name:   WME_OR
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/WME_OR_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WME_OR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WME_OR_tb;

	// Inputs
	reg WME_EX;
	reg WP_en;

	// Outputs
	wire WME;

	// Instantiate the Unit Under Test (UUT)
	WME_OR uut (
		.WME_EX(WME_EX), 
		.WP_en(WP_en), 
		.WME(WME)
	);

	initial begin
		// Initialize Inputs
		WME_EX = 0;
		WP_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
		WME_EX = 0;
		WP_en = 0;
        
		// Add stimulus here
		#100;
		WME_EX = 0;
		WP_en = 1;

		#100;
		WME_EX = 1;
		WP_en = 0;

		#100;
		WME_EX = 1;
		WP_en = 1;

		#100;
		$stop;

	end
      
endmodule

