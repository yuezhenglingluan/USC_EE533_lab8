`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:22:37 03/01/2025
// Design Name:   PC_plus_1
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/PC_plus_1_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_plus_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_plus_1_tb;

	// Inputs
	reg [63:0] PC;
	reg [63:0] ONE;

	// Outputs
	wire [63:0] PC_next;

	// Instantiate the Unit Under Test (UUT)
	PC_plus_1 uut (
		.PC(PC), 
		.ONE(ONE), 
		.PC_next(PC_next)
	);

	initial begin
		// Initialize Inputs
		PC = 0;
		ONE = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		PC = 1;

		#100;
		PC = 2;

		#100;
		PC = 3;

		#100;
		$stop;

	end
      
endmodule

