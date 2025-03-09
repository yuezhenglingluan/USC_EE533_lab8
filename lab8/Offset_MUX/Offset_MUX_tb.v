`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:39:47 03/08/2025
// Design Name:   Offset_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/Offset_MUX_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Offset_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Offset_MUX_tb;

	// Inputs
	reg LW_EX;
	reg SW_EX;
	reg [63:0] HLEN_Offset_Adder_result;
	reg [63:0] Offset_EX;

	// Outputs
	wire [63:0] ALU_src_MUX_in;

	// Instantiate the Unit Under Test (UUT)
	Offset_MUX uut (
		.LW_EX(LW_EX), 
		.SW_EX(SW_EX), 
		.HLEN_Offset_Adder_result(HLEN_Offset_Adder_result), 
		.Offset_EX(Offset_EX), 
		.ALU_src_MUX_in(ALU_src_MUX_in)
	);

	initial begin
		// Initialize Inputs
		LW_EX = 0;
		SW_EX = 0;
		HLEN_Offset_Adder_result = 0;
		Offset_EX = 0;

		// Wait 100 ns for global reset to finish
		#100;
		LW_EX = 0;
		SW_EX = 0;
		HLEN_Offset_Adder_result = 64'd2;
		Offset_EX = 64'd7;
        
		// Add stimulus here
		#100;
		LW_EX = 0;
		SW_EX = 1;
		HLEN_Offset_Adder_result = 64'd3;
		Offset_EX = 64'd8;

		#100;
		LW_EX = 1;
		SW_EX = 0;
		HLEN_Offset_Adder_result = 64'd4;
		Offset_EX = 64'd9;

		#100;
		LW_EX = 1;
		SW_EX = 1;
		HLEN_Offset_Adder_result = 64'd5;
		Offset_EX = 64'd10;

		#100;
		$stop;

	end
      
endmodule

