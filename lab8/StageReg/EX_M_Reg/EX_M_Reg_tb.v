`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:34:10 03/01/2025
// Design Name:   EX_M_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/EX_M_Reg_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EX_M_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EX_M_Reg_tb;

	// Inputs
	reg clk;
	reg rst;
	reg NOOP_EX;
	reg ADDI_EX;
	reg MOVI_EX;
	reg LW_EX;
	reg SW_EX;
	reg WME_EX;
	reg WRE_EX;
	reg [63:0] ALU_result_EX;
	reg [63:0] rs_data_EX;
	reg [63:0] rt_data_EX;
	reg [4:0] rt_EX;
	reg [63:0] Offset_EX;

	// Outputs
	wire NOOP_M;
	wire ADDI_M;
	wire MOVI_M;
	wire LW_M;
	wire SW_M;
	wire WME_M;
	wire WRE_M;
	wire [63:0] ALU_result_M;
	wire [63:0] rs_data_M;
	wire [63:0] rt_data_M;
	wire [4:0] rt_M;
	wire [63:0] Offset_M;

	// Instantiate the Unit Under Test (UUT)
	EX_M_Reg uut (
		.clk(clk), 
		.rst(rst), 
		.NOOP_EX(NOOP_EX), 
		.ADDI_EX(ADDI_EX), 
		.MOVI_EX(MOVI_EX), 
		.LW_EX(LW_EX), 
		.SW_EX(SW_EX), 
		.WME_EX(WME_EX), 
		.WRE_EX(WRE_EX), 
		.ALU_result_EX(ALU_result_EX), 
		.rs_data_EX(rs_data_EX), 
		.rt_data_EX(rt_data_EX),
		.rt_EX(rt_EX), 
		.Offset_EX(Offset_EX), 
		.NOOP_M(NOOP_M), 
		.ADDI_M(ADDI_M), 
		.MOVI_M(MOVI_M), 
		.LW_M(LW_M), 
		.SW_M(SW_M),
		.WME_M(WME_M),
		.WRE_M(WRE_M), 
		.ALU_result_M(ALU_result_M), 
		.rs_data_M(rs_data_M), 
		.rt_data_M(rt_data_M),
		.rt_M(rt_M), 
		.Offset_M(Offset_M)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		NOOP_EX = 0;
		ADDI_EX = 0;
		MOVI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 0;
		ALU_result_EX = 0;
		rs_data_EX = 0;
		rt_data_EX = 0;
		rt_EX = 0;
		Offset_EX = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst = 0;
        
		// Add stimulus here
		@(posedge clk);
		NOOP_EX = 0;
		ADDI_EX = 0;
		MOVI_EX = 1;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 1;
		ALU_result_EX = 0;
		rs_data_EX = 0;
		rt_data_EX = 0;
		rt_EX = 5'd1;
		Offset_EX = 16'd9;

		@(posedge clk);
		NOOP_EX = 1;
		ADDI_EX = 0;
		MOVI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 0;
		ALU_result_EX = 0;
		rs_data_EX = 0;
		rt_data_EX = 0;
		rt_EX = 5'd0;
		Offset_EX = 16'd0;

		@(posedge clk);
		NOOP_EX = 1;
		ADDI_EX = 0;
		MOVI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 0;
		ALU_result_EX = 0;
		rs_data_EX = 0;
		rt_data_EX = 0;
		rt_EX = 5'd0;
		Offset_EX = 16'd0;

		@(posedge clk);
		NOOP_EX = 0;
		ADDI_EX = 0;
		MOVI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 0;
		ALU_result_EX = 0;
		rs_data_EX = 0;
		rt_data_EX = 0;
		rt_EX = 5'd2;
		Offset_EX = 16'd24;

		@(posedge clk);
		NOOP_EX = 1;
		ADDI_EX = 0;
		MOVI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 0;
		ALU_result_EX = 0;
		rs_data_EX = 0;
		rt_data_EX = 0;
		rt_EX = 5'd0;
		Offset_EX = 16'd0;

		@(posedge clk);
		NOOP_EX = 0;
		ADDI_EX = 1;
		MOVI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;
		WME_EX = 0;
		WRE_EX = 0;
		ALU_result_EX = 64'd1;
		rs_data_EX = 64'd9;
		rt_data_EX = 0;
		rt_EX = 5'd3;
		Offset_EX = 16'd0;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

