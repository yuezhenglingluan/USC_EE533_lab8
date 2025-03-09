`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:36 03/01/2025
// Design Name:   PC_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/PC_MUX_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_MUX_tb;

	// Inputs
	reg [63:0] PC_next_in;
	reg [63:0] BTA;
	reg PC_ctrl;

	// Outputs
	wire [63:0] PC_next_out;

	// Instantiate the Unit Under Test (UUT)
	PC_MUX uut (
		.PC_next_in(PC_next_in), 
		.BTA(BTA), 
		.PC_ctrl(PC_ctrl), 
		.PC_next_out(PC_next_out)
	);

	initial begin
		// Initialize Inputs
		PC_next_in = 0;
		BTA = 0;
		PC_ctrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		PC_next_in = 1;
		BTA = 3;
		PC_ctrl = 0;

		#100;
		PC_next_in = 1;
		BTA = 3;
		PC_ctrl = 1;

		#100;
		PC_next_in = 6;
		BTA = 9;
		PC_ctrl = 0;

		#100;
		PC_next_in = 2;
		BTA = 3;
		PC_ctrl = 1;

		#100;
		$stop;

	end
      
endmodule

