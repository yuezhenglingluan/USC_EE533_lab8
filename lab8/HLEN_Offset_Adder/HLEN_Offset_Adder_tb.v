`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:57 03/08/2025
// Design Name:   HLEN_Offset_Adder
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/HLEN_Offset_Adder_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HLEN_Offset_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HLEN_Offset_Adder_tb;

	// Inputs
	reg [63:0] Offset;
	reg [63:0] HLEN;

	// Outputs
	wire [63:0] result;

	// Instantiate the Unit Under Test (UUT)
	HLEN_Offset_Adder uut (
		.Offset(Offset), 
		.HLEN(HLEN), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		Offset = 0;
		HLEN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		Offset = 64'd1;
		HLEN = 64'd3;

		#100;
		Offset = 64'd7;
		HLEN = 64'd3;

		#100;
		Offset = 64'd9;
		HLEN = 64'd3;

		#100;
		Offset = 64'd23;
		HLEN = 64'd3;

		#100;
		$stop;

	end
      
endmodule

