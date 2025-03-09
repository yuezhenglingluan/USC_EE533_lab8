`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:40:50 03/01/2025
// Design Name:   Offset_Extend
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/Offset_Extend_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Offset_Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Offset_Extend_tb;

	// Inputs
	reg [15:0] Offset;

	// Outputs
	wire [63:0] Offset_ID;

	// Instantiate the Unit Under Test (UUT)
	Offset_Extend uut (
		.Offset(Offset), 
		.Offset_ID(Offset_ID)
	);

	initial begin
		// Initialize Inputs
		Offset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		Offset = 16'd0;

		#100;
		Offset = 16'd1;

		#100;
		Offset = 16'd2;

		#100;
		Offset = 16'd3;

		#100;
		$stop;

	end
      
endmodule

