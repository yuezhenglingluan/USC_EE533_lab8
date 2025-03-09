`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:58 03/01/2025
// Design Name:   Branch_Detection_Unit
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/Branch_Detection_Unit_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Branch_Detection_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Branch_Detection_Unit_tb;

	// Inputs
	reg [63:0] rs_data;
	reg [63:0] rt_data;
	reg BEQ_ID;
	reg BGT_ID;
	reg BLT_ID;
	reg J_ID;

	// Outputs
	wire PC_ctrl;

	// Instantiate the Unit Under Test (UUT)
	Branch_Detection_Unit uut (
		.rs_data(rs_data), 
		.rt_data(rt_data), 
		.BEQ_ID(BEQ_ID), 
		.BGT_ID(BGT_ID), 
		.BLT_ID(BLT_ID), 
		.J_ID(J_ID),
		.PC_ctrl(PC_ctrl)
	);

	initial begin
		// Initialize Inputs
		rt_data = 64'd1;
		rs_data = 64'd0;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		rt_data = 64'd1;
		rs_data = 64'd0;
		BEQ_ID = 1;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd1;
		BEQ_ID = 1;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd2;
		BEQ_ID = 1;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd0;
		BEQ_ID = 0;
		BGT_ID = 1;
		BLT_ID = 0;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd1;
		BEQ_ID = 0;
		BGT_ID = 1;
		BLT_ID = 0;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd2;
		BEQ_ID = 0;
		BGT_ID = 1;
		BLT_ID = 0;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd0;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 1;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd1;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 1;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd2;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 1;
		J_ID = 0;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd0;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 1;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd1;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 1;

		#100;
		rt_data = 64'd1;
		rs_data = 64'd2;
		BEQ_ID = 0;
		BGT_ID = 0;
		BLT_ID = 0;
		J_ID = 1;

		#100;
		$stop;

	end
      
endmodule

