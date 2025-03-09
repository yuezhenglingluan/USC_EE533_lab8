`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:45 03/01/2025
// Design Name:   Control_Unit
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/Control_Unit_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_tb;

	// Inputs
	reg [5:0] OP_CODE;

	// Outputs
	wire NOOP_ID;
	wire ADDI_ID;
	wire MOVI_ID;
	wire LW_ID;
	wire SW_ID;
	wire BEQ_ID;
	wire BGT_ID;
	wire BLT_ID;
	wire J_ID;
	wire [3:0] ALU_OP_ID;
	wire WME_ID;
	wire WRE_ID;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.OP_CODE(OP_CODE), 
		.NOOP_ID(NOOP_ID), 
		.ADDI_ID(ADDI_ID), 
		.MOVI_ID(MOVI_ID), 
		.LW_ID(LW_ID), 
		.SW_ID(SW_ID), 
		.BEQ_ID(BEQ_ID), 
		.BGT_ID(BGT_ID), 
		.BLT_ID(BLT_ID), 
		.J_ID(J_ID), 
		.ALU_OP_ID(ALU_OP_ID), 
		.WME_ID(WME_ID), 
		.WRE_ID(WRE_ID)
	);

	initial begin
		// Initialize Inputs
		OP_CODE = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		OP_CODE = 0;
		
		#100;
		OP_CODE = 1;
		
		#100;
		OP_CODE = 2;

		#100;
		OP_CODE = 3;

		#100;
		OP_CODE = 4;

		#100;
		OP_CODE = 5;

		#100;
		OP_CODE = 6;

		#100;
		OP_CODE = 7;

		#100;
		OP_CODE = 8;

		#100;
		$stop;

	end
      
endmodule

