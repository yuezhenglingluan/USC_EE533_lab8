`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:30 03/08/2025
// Design Name:   WP_Controller
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/WP_Controller_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WP_Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WP_Controller_tb;

	// Inputs
	reg [1:0] mode_code;

	// Outputs
	wire WP_en;

	// Instantiate the Unit Under Test (UUT)
	WP_Controller uut (
		.mode_code(mode_code), 
		.WP_en(WP_en)
	);

	initial begin
		// Initialize Inputs
		mode_code = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
		mode_code = 2'b01;
        
		// Add stimulus here
		#100;
		mode_code = 2'b10;

		#100;
		mode_code = 2'b11;

		#100;
		$stop;

	end
      
endmodule

