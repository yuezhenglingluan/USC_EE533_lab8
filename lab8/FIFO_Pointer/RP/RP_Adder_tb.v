`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:08 03/08/2025
// Design Name:   RP_Adder
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/RP_Adder_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RP_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RP_Adder_tb;

	// Inputs
	reg [7:0] RP;

	// Outputs
	wire [7:0] RP_next;

	// Instantiate the Unit Under Test (UUT)
	RP_Adder uut (
		.RP(RP), 
		.RP_next(RP_next)
	);

	initial begin
		// Initialize Inputs
		RP = 0;

		// Wait 100 ns for global reset to finish
		#100;
		RP = 8'd1;
        
		// Add stimulus here
		#100;
		RP = 8'd2;

		#100;
		RP = 8'd3;

		#100;
		RP = 8'd9;

		#100;
		RP = 8'd1;

		#100;
		$stop;

	end
      
endmodule

