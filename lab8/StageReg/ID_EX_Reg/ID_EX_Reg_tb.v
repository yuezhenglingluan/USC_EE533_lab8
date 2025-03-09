`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:13:54 03/01/2025
// Design Name:   ID_EX_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/ID_EX_Reg_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EX_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ID_EX_Reg_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] ALU_OP_ID;
	reg NOOP_ID;
	reg ADDI_ID;
	reg MOVI_ID;
	reg LW_ID;
	reg SW_ID;
	reg WME_ID;
	reg WRE_ID;
	reg [63:0] rs_data_ID;
	reg [63:0] rt_data_ID;
	reg [4:0] rt_ID;
	reg [63:0] Offset_ID;

	// Outputs
	wire [3:0] ALU_OP_EX;
	wire NOOP_EX;
	wire ADDI_EX;
	wire MOVI_EX;
	wire LW_EX;
	wire SW_EX;
	wire WME_EX;
	wire WRE_EX;
	wire [63:0] rs_data_EX;
	wire [63:0] rt_data_EX;
	wire [4:0] rt_EX;
	wire [63:0] Offset_EX;

	// Instantiate the Unit Under Test (UUT)
	ID_EX_Reg uut (
		.clk(clk), 
		.rst(rst), 
		.ALU_OP_ID(ALU_OP_ID), 
		.NOOP_ID(NOOP_ID), 
		.ADDI_ID(ADDI_ID), 
		.MOVI_ID(MOVI_ID), 
		.LW_ID(LW_ID), 
		.SW_ID(SW_ID), 
		.WME_ID(WME_ID), 
		.WRE_ID(WRE_ID), 
		.rs_data_ID(rs_data_ID), 
		.rt_data_ID(rt_data_ID), 
		.rt_ID(rt_ID), 
		.Offset_ID(Offset_ID), 
		.ALU_OP_EX(ALU_OP_EX), 
		.NOOP_EX(NOOP_EX), 
		.ADDI_EX(ADDI_EX), 
		.MOVI_EX(MOVI_EX), 
		.LW_EX(LW_EX), 
		.SW_EX(SW_EX), 
		.WME_EX(WME_EX), 
		.WRE_EX(WRE_EX), 
		.rs_data_EX(rs_data_EX), 
		.rt_data_EX(rt_data_EX), 
		.rt_EX(rt_EX), 
		.Offset_EX(Offset_EX)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		ALU_OP_ID = 0;
		NOOP_ID = 0;
		ADDI_ID = 0;
		MOVI_ID = 0;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 0;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 0;
		Offset_ID = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
        
		// Add stimulus here
		@(posedge clk);
		ALU_OP_ID = 4'd0;
		NOOP_ID = 0;
		ADDI_ID = 0;
		MOVI_ID = 1;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 1;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 5'd1;
		Offset_ID = 16'd9;

		@(posedge clk);
		ALU_OP_ID = 4'd0;
		NOOP_ID = 1;
		ADDI_ID = 0;
		MOVI_ID = 0;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 0;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 5'd0;
		Offset_ID = 16'd0;

		@(posedge clk);
		ALU_OP_ID = 4'd0;
		NOOP_ID = 1;
		ADDI_ID = 0;
		MOVI_ID = 0;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 0;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 5'd0;
		Offset_ID = 16'd0;

		@(posedge clk);
		ALU_OP_ID = 4'd1;
		NOOP_ID = 0;
		ADDI_ID = 0;
		MOVI_ID = 0;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 0;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 5'd0;
		Offset_ID = 16'd0;

		@(posedge clk);
		ALU_OP_ID = 4'd0;
		NOOP_ID = 1;
		ADDI_ID = 0;
		MOVI_ID = 0;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 0;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 5'd0;
		Offset_ID = 16'd0;

		@(posedge clk);
		ALU_OP_ID = 4'd0;
		NOOP_ID = 0;
		ADDI_ID = 1;
		MOVI_ID = 0;
		LW_ID = 0;
		SW_ID = 0;
		WME_ID = 0;
		WRE_ID = 1;
		rs_data_ID = 0;
		rt_data_ID = 0;
		rt_ID = 5'd3;
		Offset_ID = 16'd1;

		@(posedge clk);
		$stop;

	end
      
endmodule

