`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:48:10 03/01/2025
// Design Name:   IF_ID_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/IF_ID_Reg_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_ID_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IF_ID_Reg_tb;

	// Inputs
	reg [31:0] Instruction;

	// Outputs
	wire [5:0] OP_CODE_ID;
	wire [4:0] rs_ID;
	wire [4:0] rt_ID;
	wire [15:0] Offset_ID;

	// Instantiate the Unit Under Test (UUT)
	IF_ID_Reg uut (
		.Instruction(Instruction), 
		.OP_CODE_ID(OP_CODE_ID), 
		.rs_ID(rs_ID), 
		.rt_ID(rt_ID), 
		.Offset_ID(Offset_ID)
	);

	initial begin
		// Initialize Inputs
		Instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		Instruction = 32'b00001000000000010000000000001001;

		#100;
		Instruction = 32'b0;

		#100;
		Instruction = 32'b0;

		#100;
		Instruction = 32'b00010100001000100000000000011000;

		#100;
		Instruction = 32'b0;

		#100;
		Instruction = 32'b00000100010000110000000000000001;

		#100;
		$stop;

	end
      
endmodule

