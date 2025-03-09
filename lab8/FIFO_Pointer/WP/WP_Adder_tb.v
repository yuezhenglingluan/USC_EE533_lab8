`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:37 03/08/2025
// Design Name:   WP_Adder
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/WP_Adder_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WP_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WP_Adder_tb;

	// Inputs
	reg [7:0] WP;

	// Outputs
	wire [7:0] WP_next;

	// Instantiate the Unit Under Test (UUT)
	WP_Adder uut (
		.WP(WP), 
		.WP_next(WP_next)
	);

	initial begin
		// Initialize Inputs
		WP = 0;

		// Wait 100 ns for global reset to finish
		#100;
		WP = 8'd1;
        
		// Add stimulus here
		#100;
		WP = 8'd2;

		#100;
		WP = 8'd5;

		#100;
		WP = 8'd9;

		#100;
		$stop;

	end
      
endmodule

