`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:46:24 03/01/2025
// Design Name:   M_WB_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/M_WB_Reg_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: M_WB_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module M_WB_Reg_tb;

	// Inputs
	reg clk;
	reg rst;
	reg NOOP_M;
	reg ADDI_M;
	reg MOVI_M;
	reg LW_M;
	reg SW_M;
	reg WRE_M;
	reg [63:0] D_out_M;
	reg [63:0] rs_data_M;
	reg [63:0] rt_data_M;
	reg [63:0] ALU_result_M;
	reg [63:0] Offset_M;
	reg [4:0] rt_M;

	// Outputs
	wire NOOP_WB;
	wire ADDI_WB;
	wire MOVI_WB;
	wire LW_WB;
	wire SW_WB;
	wire WRE_WB;
	wire [63:0] D_out_WB;
	wire [63:0] rs_data_WB;
	wire [63:0] rt_data_WB;
	wire [63:0] ALU_result_WB;
	wire [63:0] Offset_WB;
	wire [2:0] rt_WB;

	// Instantiate the Unit Under Test (UUT)
	M_WB_Reg uut (
		.clk(clk), 
		.rst(rst), 
		.NOOP_M(NOOP_M), 
		.ADDI_M(ADDI_M), 
		.MOVI_M(MOVI_M), 
		.LW_M(LW_M), 
		.SW_M(SW_M), 
		.WRE_M(WRE_M), 
		.D_out_M(D_out_M), 
		.rs_data_M(rs_data_M), 
		.rt_data_M(rt_data_M),
		.ALU_result_M(ALU_result_M), 
		.Offset_M(Offset_M), 
		.rt_M(rt_M), 
		.NOOP_WB(NOOP_WB), 
		.ADDI_WB(ADDI_WB), 
		.MOVI_WB(MOVI_WB), 
		.LW_WB(LW_WB), 
		.SW_WB(SW_WB), 
		.WRE_WB(WRE_WB), 
		.D_out_WB(D_out_WB), 
		.rs_data_WB(rs_data_WB), 
		.rt_data_WB(rt_data_WB),
		.ALU_result_WB(ALU_result_WB), 
		.Offset_WB(Offset_WB), 
		.rt_WB(rt_WB)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		NOOP_M = 0;
		ADDI_M = 0;
		MOVI_M = 0;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 0;
		D_out_M = 0;
		rs_data_M = 0;
		rt_data_M = 0;
		ALU_result_M = 0;
		Offset_M = 0;
		rt_M = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst = 0;
        
		// Add stimulus here
		@(posedge clk);
		NOOP_M = 0;
		ADDI_M = 0;
		MOVI_M = 1;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 1;
		D_out_M = 64'd123;
		rs_data_M = 64'd0;
		rt_data_M = 64'd0;
		ALU_result_M = 0;
		Offset_M = 64'd9;
		rt_M = 5'd1;

		@(posedge clk);
		NOOP_M = 1;
		ADDI_M = 0;
		MOVI_M = 0;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 0;
		D_out_M = 64'd323;
		rs_data_M = 64'd0;
		rt_data_M = 64'd0;
		ALU_result_M = 0;
		Offset_M = 64'd0;
		rt_M = 5'd0;

		@(posedge clk);
		NOOP_M = 1;
		ADDI_M = 0;
		MOVI_M = 0;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 0;
		D_out_M = 64'd323;
		rs_data_M = 64'd0;
		rt_data_M = 64'd0;
		ALU_result_M = 0;
		Offset_M = 64'd0;
		rt_M = 5'd0;

		@(posedge clk);
		NOOP_M = 0;
		ADDI_M = 0;
		MOVI_M = 0;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 0;
		D_out_M = 64'd323;
		rs_data_M = 64'd0;
		rt_data_M = 64'd0;
		ALU_result_M = 0;
		Offset_M = 64'd0;
		rt_M = 5'd0;

		@(posedge clk);
		NOOP_M = 0;
		ADDI_M = 0;
		MOVI_M = 0;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 0;
		D_out_M = 64'd323;
		rs_data_M = 64'd0;
		rt_data_M = 64'd0;
		ALU_result_M = 0;
		Offset_M = 64'd0;
		rt_M = 5'd0;

		@(posedge clk);
		NOOP_M = 0;
		ADDI_M = 1;
		MOVI_M = 0;
		LW_M = 0;
		SW_M = 0;
		WRE_M = 1;
		D_out_M = 64'd2;
		rs_data_M = 64'd0;
		rt_data_M = 64'd0;
		ALU_result_M = 64'd1;
		Offset_M = 64'd1;
		rt_M = 5'd3;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

