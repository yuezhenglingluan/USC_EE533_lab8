`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:19:47 03/08/2025
// Design Name:   Pipeline_demo
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/EE533_Lab_8/Pipeline_demo_tb.v
// Project Name:  EE533_Lab_8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline_demo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_demo_tb;

	// Inputs
	reg clk;
	reg [63:0] HLEN;
	reg [31:0] Instr_IN;
	reg [8:0] Instr_IN_addr;
	reg Instr_IN_en;
	reg [1:0] mode_code;
	reg [63:0] ONE;
	reg [63:0] pkt_in;
	reg rst;
	reg rst_FIFO;

	// Outputs
	wire ADDI_EX;
	wire ADDI_ID;
	wire ADDI_M;
	wire ADDI_WB;
	wire [63:0] ALU_B_in;
	wire [3:0] ALU_OP_EX;
	wire [63:0] ALU_result_EX;
	wire [63:0] ALU_result_M;
	wire [63:0] ALU_result_WB;
	wire BEQ_ID;
	wire BGT_ID;
	wire BLT_ID;
	wire [63:0] Dout_WB;
	wire [7:0] D_addr_src_MUX_out;
	wire [7:0] D_raddr;
	wire [7:0] D_waddr;
	wire [63:0] D_wdata;
	wire FIFO_almost_empty;
	wire FIFO_almost_full;
	wire [7:0] FIFO_depth;
	wire FIFO_EMPTY;
	wire FIFO_FULL;
	wire [63:0] HLEN_Offset_sum;
	wire [63:0] HLEN_out;
	wire [31:0] Instruction_IF;
	wire J_ID;
	wire LW_EX;
	wire LW_ID;
	wire LW_M;
	wire LW_WB;
	wire MOVI_EX;
	wire MOVI_ID;
	wire MOVI_M;
	wire MOVI_WB;
	wire NOOP_EX;
	wire NOOP_ID;
	wire NOOP_M;
	wire NOOP_WB;
	wire [63:0] Offset_EX;
	wire [63:0] Offset_ID;
	wire [63:0] Offset_M;
	wire [63:0] Offset_MUX_out;
	wire [63:0] Offset_WB;
	wire [5:0] OP_CODE_ID;
	wire [63:0] PC;
	wire [63:0] PC_next;
	wire [63:0] pkt_out;
	wire [63:0] RF_Din;
	wire RP_en;
	wire [63:0] rs_data_EX;
	wire [63:0] rs_data_ID;
	wire [63:0] rs_data_M;
	wire [63:0] rs_data_WB;
	wire [4:0] rs_ID;
	wire [63:0] rt_data_EX;
	wire [63:0] rt_data_ID;
	wire [63:0] rt_data_M;
	wire [63:0] rt_data_WB;
	wire [4:0] rt_EX;
	wire [4:0] rt_ID;
	wire [4:0] rt_M;
	wire [2:0] rt_WB;
	wire [7:0] SRAM_addr;
	wire SUBI_EX;
	wire SUBI_ID;
	wire SUBI_M;
	wire SUBI_WB;
	wire SW_EX;
	wire SW_ID;
	wire SW_M;
	wire SW_WB;
	wire WME_EX;
	wire WME_M;
	wire WME_M_out;
	wire WP_en;
	wire WRE_EX;
	wire WRE_M;
	wire WRE_WB;

	// Instantiate the Unit Under Test (UUT)
	Pipeline_demo uut (
		.clk(clk), 
		.HLEN(HLEN), 
		.Instr_IN(Instr_IN), 
		.Instr_IN_addr(Instr_IN_addr), 
		.Instr_IN_en(Instr_IN_en), 
		.mode_code(mode_code), 
		.ONE(ONE), 
		.pkt_in(pkt_in), 
		.rst(rst), 
		.rst_FIFO(rst_FIFO), 
		.ADDI_EX(ADDI_EX), 
		.ADDI_ID(ADDI_ID), 
		.ADDI_M(ADDI_M), 
		.ADDI_WB(ADDI_WB), 
		.ALU_B_in(ALU_B_in), 
		.ALU_OP_EX(ALU_OP_EX), 
		.ALU_result_EX(ALU_result_EX), 
		.ALU_result_M(ALU_result_M), 
		.ALU_result_WB(ALU_result_WB), 
		.BEQ_ID(BEQ_ID), 
		.BGT_ID(BGT_ID), 
		.BLT_ID(BLT_ID), 
		.Dout_WB(Dout_WB), 
		.D_addr_src_MUX_out(D_addr_src_MUX_out), 
		.D_raddr(D_raddr), 
		.D_waddr(D_waddr), 
		.D_wdata(D_wdata), 
		.FIFO_almost_empty(FIFO_almost_empty), 
		.FIFO_almost_full(FIFO_almost_full), 
		.FIFO_depth(FIFO_depth), 
		.FIFO_EMPTY(FIFO_EMPTY), 
		.FIFO_FULL(FIFO_FULL), 
		.HLEN_Offset_sum(HLEN_Offset_sum), 
		.HLEN_out(HLEN_out), 
		.Instruction_IF(Instruction_IF), 
		.J_ID(J_ID), 
		.LW_EX(LW_EX), 
		.LW_ID(LW_ID), 
		.LW_M(LW_M), 
		.LW_WB(LW_WB), 
		.MOVI_EX(MOVI_EX), 
		.MOVI_ID(MOVI_ID), 
		.MOVI_M(MOVI_M), 
		.MOVI_WB(MOVI_WB), 
		.NOOP_EX(NOOP_EX), 
		.NOOP_ID(NOOP_ID), 
		.NOOP_M(NOOP_M), 
		.NOOP_WB(NOOP_WB), 
		.Offset_EX(Offset_EX), 
		.Offset_ID(Offset_ID), 
		.Offset_M(Offset_M), 
		.Offset_MUX_out(Offset_MUX_out), 
		.Offset_WB(Offset_WB), 
		.OP_CODE_ID(OP_CODE_ID), 
		.PC(PC), 
		.PC_next(PC_next), 
		.pkt_out(pkt_out), 
		.RF_Din(RF_Din), 
		.RP_en(RP_en), 
		.rs_data_EX(rs_data_EX), 
		.rs_data_ID(rs_data_ID), 
		.rs_data_M(rs_data_M), 
		.rs_data_WB(rs_data_WB), 
		.rs_ID(rs_ID), 
		.rt_data_EX(rt_data_EX), 
		.rt_data_ID(rt_data_ID), 
		.rt_data_M(rt_data_M), 
		.rt_data_WB(rt_data_WB), 
		.rt_EX(rt_EX), 
		.rt_ID(rt_ID), 
		.rt_M(rt_M), 
		.rt_WB(rt_WB), 
		.SRAM_addr(SRAM_addr), 
		.SUBI_EX(SUBI_EX), 
		.SUBI_ID(SUBI_ID), 
		.SUBI_M(SUBI_M), 
		.SUBI_WB(SUBI_WB), 
		.SW_EX(SW_EX), 
		.SW_ID(SW_ID), 
		.SW_M(SW_M), 
		.SW_WB(SW_WB), 
		.WME_EX(WME_EX), 
		.WME_M(WME_M), 
		.WME_M_out(WME_M_out), 
		.WP_en(WP_en), 
		.WRE_EX(WRE_EX), 
		.WRE_M(WRE_M), 
		.WRE_WB(WRE_WB)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		HLEN = 64'd3;
		Instr_IN = 0;
		Instr_IN_addr = 0;
		Instr_IN_en = 0;
		mode_code = 2'b11;
		ONE = 64'd1;
		pkt_in = 0;
		rst = 1;
		rst_FIFO = 1;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst_FIFO = 0;
        
		// Add stimulus here
		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h4600004000001C46;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h4000040600000A00;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h0D030A000E030000;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h0000000000000004;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h0000000000000004;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h0000000000000003;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h0000000000000002;

		@(posedge clk);
		mode_code = 2'b00;
		pkt_in = 64'h0000000000000001;

		@(posedge clk);
		mode_code = 2'b10;
		rst = 0;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		mode_code = 2'b10;

		@(posedge clk);
		rst = 1;
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);
		mode_code = 2'b01;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

