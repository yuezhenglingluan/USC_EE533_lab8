////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : Pipeline_demo.vf
// /___/   /\     Timestamp : 03/08/2025 20:13:31
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "E:/Documents and Settings/student/EE533_Lab8/Pipeline_demo.sch" Pipeline_demo.vf
//Design Name: Pipeline_demo
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module Pipeline_demo(clk, 
                     HLEN, 
                     Instr_IN, 
                     Instr_IN_addr, 
                     Instr_IN_en, 
                     mode_code, 
                     ONE, 
                     pkt_in, 
                     rst, 
                     rst_FIFO, 
                     ADDI_EX, 
                     ADDI_ID, 
                     ADDI_M, 
                     ADDI_WB, 
                     ALU_B_in, 
                     ALU_OP_EX, 
                     ALU_result_EX, 
                     ALU_result_M, 
                     ALU_result_WB, 
                     BEQ_ID, 
                     BGT_ID, 
                     BLT_ID, 
                     Dout_WB, 
                     D_addr_src_MUX_out, 
                     D_raddr, 
                     D_waddr, 
                     D_wdata, 
                     FIFO_almost_empty, 
                     FIFO_almost_full, 
                     FIFO_depth, 
                     FIFO_EMPTY, 
                     FIFO_FULL, 
                     HLEN_Offset_sum, 
                     HLEN_out, 
                     Instruction_IF, 
                     J_ID, 
                     LW_EX, 
                     LW_ID, 
                     LW_M, 
                     LW_WB, 
                     MOVI_EX, 
                     MOVI_ID, 
                     MOVI_M, 
                     MOVI_WB, 
                     NOOP_EX, 
                     NOOP_ID, 
                     NOOP_M, 
                     NOOP_WB, 
                     Offset_EX, 
                     Offset_ID, 
                     Offset_M, 
                     Offset_MUX_out, 
                     Offset_WB, 
                     OP_CODE_ID, 
                     PC, 
                     PC_next, 
                     pkt_out, 
                     RF_Din, 
                     RP_en, 
                     rs_data_EX, 
                     rs_data_ID, 
                     rs_data_M, 
                     rs_data_WB, 
                     rs_ID, 
                     rt_data_EX, 
                     rt_data_ID, 
                     rt_data_M, 
                     rt_data_WB, 
                     rt_EX, 
                     rt_ID, 
                     rt_M, 
                     rt_WB, 
                     SRAM_addr, 
                     SUBI_EX, 
                     SUBI_ID, 
                     SUBI_M, 
                     SUBI_WB, 
                     SW_EX, 
                     SW_ID, 
                     SW_M, 
                     SW_WB, 
                     WME_EX, 
                     WME_M, 
                     WME_M_out, 
                     WP_en, 
                     WRE_EX, 
                     WRE_M, 
                     WRE_WB);

    input clk;
    input [63:0] HLEN;
    input [31:0] Instr_IN;
    input [8:0] Instr_IN_addr;
    input Instr_IN_en;
    input [1:0] mode_code;
    input [63:0] ONE;
    input [63:0] pkt_in;
    input rst;
    input rst_FIFO;
   output ADDI_EX;
   output ADDI_ID;
   output ADDI_M;
   output ADDI_WB;
   output [63:0] ALU_B_in;
   output [3:0] ALU_OP_EX;
   output [63:0] ALU_result_EX;
   output [63:0] ALU_result_M;
   output [63:0] ALU_result_WB;
   output BEQ_ID;
   output BGT_ID;
   output BLT_ID;
   output [63:0] Dout_WB;
   output [7:0] D_addr_src_MUX_out;
   output [7:0] D_raddr;
   output [7:0] D_waddr;
   output [63:0] D_wdata;
   output FIFO_almost_empty;
   output FIFO_almost_full;
   output [7:0] FIFO_depth;
   output FIFO_EMPTY;
   output FIFO_FULL;
   output [63:0] HLEN_Offset_sum;
   output [63:0] HLEN_out;
   output [31:0] Instruction_IF;
   output J_ID;
   output LW_EX;
   output LW_ID;
   output LW_M;
   output LW_WB;
   output MOVI_EX;
   output MOVI_ID;
   output MOVI_M;
   output MOVI_WB;
   output NOOP_EX;
   output NOOP_ID;
   output NOOP_M;
   output NOOP_WB;
   output [63:0] Offset_EX;
   output [63:0] Offset_ID;
   output [63:0] Offset_M;
   output [63:0] Offset_MUX_out;
   output [63:0] Offset_WB;
   output [5:0] OP_CODE_ID;
   output [63:0] PC;
   output [63:0] PC_next;
   output [63:0] pkt_out;
   output [63:0] RF_Din;
   output RP_en;
   output [63:0] rs_data_EX;
   output [63:0] rs_data_ID;
   output [63:0] rs_data_M;
   output [63:0] rs_data_WB;
   output [4:0] rs_ID;
   output [63:0] rt_data_EX;
   output [63:0] rt_data_ID;
   output [63:0] rt_data_M;
   output [63:0] rt_data_WB;
   output [4:0] rt_EX;
   output [4:0] rt_ID;
   output [4:0] rt_M;
   output [2:0] rt_WB;
   output [7:0] SRAM_addr;
   output SUBI_EX;
   output SUBI_ID;
   output SUBI_M;
   output SUBI_WB;
   output SW_EX;
   output SW_ID;
   output SW_M;
   output SW_WB;
   output WME_EX;
   output WME_M;
   output WME_M_out;
   output WP_en;
   output WRE_EX;
   output WRE_M;
   output WRE_WB;
   
   wire [3:0] ALU_OP_ID;
   wire [15:0] Offset_ID_before_Extend;
   wire PC_ctrl;
   wire [63:0] PC_reg;
   wire [7:0] RP;
   wire [7:0] RP_next;
   wire WME_ID;
   wire [7:0] WP;
   wire [7:0] WP_next;
   wire WRE_ID;
   wire NOOP_ID_DUMMY;
   wire [7:0] D_waddr_DUMMY;
   wire [63:0] ALU_result_WB_DUMMY;
   wire [63:0] ALU_result_EX_DUMMY;
   wire SUBI_ID_DUMMY;
   wire [63:0] rs_data_ID_DUMMY;
   wire [63:0] Offset_WB_DUMMY;
   wire RP_en_DUMMY;
   wire [63:0] Offset_EX_DUMMY;
   wire [2:0] rt_WB_DUMMY;
   wire [7:0] SRAM_addr_DUMMY;
   wire [63:0] rt_data_EX_DUMMY;
   wire SW_ID_DUMMY;
   wire FIFO_FULL_DUMMY;
   wire [63:0] HLEN_Offset_sum_DUMMY;
   wire [4:0] rt_EX_DUMMY;
   wire [63:0] RF_Din_DUMMY;
   wire [63:0] PC_DUMMY;
   wire FIFO_EMPTY_DUMMY;
   wire [4:0] rt_M_DUMMY;
   wire WRE_WB_DUMMY;
   wire [31:0] Instruction_IF_DUMMY;
   wire [63:0] Offset_MUX_out_DUMMY;
   wire [63:0] rs_data_M_DUMMY;
   wire [63:0] ALU_result_M_DUMMY;
   wire MOVI_WB_DUMMY;
   wire WRE_EX_DUMMY;
   wire [63:0] D_wdata_DUMMY;
   wire MOVI_EX_DUMMY;
   wire SW_M_DUMMY;
   wire BGT_ID_DUMMY;
   wire ADDI_ID_DUMMY;
   wire [7:0] D_addr_src_MUX_out_DUMMY;
   wire NOOP_EX_DUMMY;
   wire MOVI_M_DUMMY;
   wire BEQ_ID_DUMMY;
   wire [63:0] Offset_M_DUMMY;
   wire WP_en_DUMMY;
   wire SUBI_WB_DUMMY;
   wire [3:0] ALU_OP_EX_DUMMY;
   wire SUBI_EX_DUMMY;
   wire [63:0] rs_data_EX_DUMMY;
   wire LW_ID_DUMMY;
   wire [4:0] rs_ID_DUMMY;
   wire NOOP_M_DUMMY;
   wire SW_EX_DUMMY;
   wire WME_M_out_DUMMY;
   wire [63:0] HLEN_out_DUMMY;
   wire [7:0] D_raddr_DUMMY;
   wire [63:0] Offset_ID_DUMMY;
   wire BLT_ID_DUMMY;
   wire [63:0] Dout_WB_DUMMY;
   wire SUBI_M_DUMMY;
   wire [63:0] pkt_out_DUMMY;
   wire [63:0] rt_data_ID_DUMMY;
   wire ADDI_M_DUMMY;
   wire [4:0] rt_ID_DUMMY;
   wire ADDI_WB_DUMMY;
   wire [63:0] rt_data_M_DUMMY;
   wire ADDI_EX_DUMMY;
   wire [63:0] ALU_B_in_DUMMY;
   wire J_ID_DUMMY;
   wire LW_WB_DUMMY;
   wire LW_EX_DUMMY;
   wire MOVI_ID_DUMMY;
   wire WME_M_DUMMY;
   wire [5:0] OP_CODE_ID_DUMMY;
   wire WRE_M_DUMMY;
   wire LW_M_DUMMY;
   wire [63:0] PC_next_DUMMY;
   wire WME_EX_DUMMY;
   
   assign ADDI_EX = ADDI_EX_DUMMY;
   assign ADDI_ID = ADDI_ID_DUMMY;
   assign ADDI_M = ADDI_M_DUMMY;
   assign ADDI_WB = ADDI_WB_DUMMY;
   assign ALU_B_in[63:0] = ALU_B_in_DUMMY[63:0];
   assign ALU_OP_EX[3:0] = ALU_OP_EX_DUMMY[3:0];
   assign ALU_result_EX[63:0] = ALU_result_EX_DUMMY[63:0];
   assign ALU_result_M[63:0] = ALU_result_M_DUMMY[63:0];
   assign ALU_result_WB[63:0] = ALU_result_WB_DUMMY[63:0];
   assign BEQ_ID = BEQ_ID_DUMMY;
   assign BGT_ID = BGT_ID_DUMMY;
   assign BLT_ID = BLT_ID_DUMMY;
   assign Dout_WB[63:0] = Dout_WB_DUMMY[63:0];
   assign D_addr_src_MUX_out[7:0] = D_addr_src_MUX_out_DUMMY[7:0];
   assign D_raddr[7:0] = D_raddr_DUMMY[7:0];
   assign D_waddr[7:0] = D_waddr_DUMMY[7:0];
   assign D_wdata[63:0] = D_wdata_DUMMY[63:0];
   assign FIFO_EMPTY = FIFO_EMPTY_DUMMY;
   assign FIFO_FULL = FIFO_FULL_DUMMY;
   assign HLEN_Offset_sum[63:0] = HLEN_Offset_sum_DUMMY[63:0];
   assign HLEN_out[63:0] = HLEN_out_DUMMY[63:0];
   assign Instruction_IF[31:0] = Instruction_IF_DUMMY[31:0];
   assign J_ID = J_ID_DUMMY;
   assign LW_EX = LW_EX_DUMMY;
   assign LW_ID = LW_ID_DUMMY;
   assign LW_M = LW_M_DUMMY;
   assign LW_WB = LW_WB_DUMMY;
   assign MOVI_EX = MOVI_EX_DUMMY;
   assign MOVI_ID = MOVI_ID_DUMMY;
   assign MOVI_M = MOVI_M_DUMMY;
   assign MOVI_WB = MOVI_WB_DUMMY;
   assign NOOP_EX = NOOP_EX_DUMMY;
   assign NOOP_ID = NOOP_ID_DUMMY;
   assign NOOP_M = NOOP_M_DUMMY;
   assign Offset_EX[63:0] = Offset_EX_DUMMY[63:0];
   assign Offset_ID[63:0] = Offset_ID_DUMMY[63:0];
   assign Offset_M[63:0] = Offset_M_DUMMY[63:0];
   assign Offset_MUX_out[63:0] = Offset_MUX_out_DUMMY[63:0];
   assign Offset_WB[63:0] = Offset_WB_DUMMY[63:0];
   assign OP_CODE_ID[5:0] = OP_CODE_ID_DUMMY[5:0];
   assign PC[63:0] = PC_DUMMY[63:0];
   assign PC_next[63:0] = PC_next_DUMMY[63:0];
   assign pkt_out[63:0] = pkt_out_DUMMY[63:0];
   assign RF_Din[63:0] = RF_Din_DUMMY[63:0];
   assign RP_en = RP_en_DUMMY;
   assign rs_data_EX[63:0] = rs_data_EX_DUMMY[63:0];
   assign rs_data_ID[63:0] = rs_data_ID_DUMMY[63:0];
   assign rs_data_M[63:0] = rs_data_M_DUMMY[63:0];
   assign rs_ID[4:0] = rs_ID_DUMMY[4:0];
   assign rt_data_EX[63:0] = rt_data_EX_DUMMY[63:0];
   assign rt_data_ID[63:0] = rt_data_ID_DUMMY[63:0];
   assign rt_data_M[63:0] = rt_data_M_DUMMY[63:0];
   assign rt_EX[4:0] = rt_EX_DUMMY[4:0];
   assign rt_ID[4:0] = rt_ID_DUMMY[4:0];
   assign rt_M[4:0] = rt_M_DUMMY[4:0];
   assign rt_WB[2:0] = rt_WB_DUMMY[2:0];
   assign SRAM_addr[7:0] = SRAM_addr_DUMMY[7:0];
   assign SUBI_EX = SUBI_EX_DUMMY;
   assign SUBI_ID = SUBI_ID_DUMMY;
   assign SUBI_M = SUBI_M_DUMMY;
   assign SUBI_WB = SUBI_WB_DUMMY;
   assign SW_EX = SW_EX_DUMMY;
   assign SW_ID = SW_ID_DUMMY;
   assign SW_M = SW_M_DUMMY;
   assign WME_EX = WME_EX_DUMMY;
   assign WME_M = WME_M_DUMMY;
   assign WME_M_out = WME_M_out_DUMMY;
   assign WP_en = WP_en_DUMMY;
   assign WRE_EX = WRE_EX_DUMMY;
   assign WRE_M = WRE_M_DUMMY;
   assign WRE_WB = WRE_WB_DUMMY;
   PC XLXI_1 (.clk(clk), 
              .PC_next(PC_next_DUMMY[63:0]), 
              .rst(rst), 
              .PC(PC_reg[63:0]));
   PC_plus_1 XLXI_2 (.ONE(ONE[63:0]), 
                     .PC(PC_DUMMY[63:0]), 
                     .PC_next(PC_next_DUMMY[63:0]));
   PC_MUX XLXI_3 (.BTA(Offset_ID_DUMMY[63:0]), 
                  .PC_ctrl(PC_ctrl), 
                  .PC_next_in(PC_reg[63:0]), 
                  .PC_next_out(PC_DUMMY[63:0]));
   I_MEM XLXI_7 (.addra(PC_DUMMY[8:0]), 
                 .addrb(Instr_IN_addr[8:0]), 
                 .clka(clk), 
                 .clkb(clk), 
                 .dinb(Instr_IN[31:0]), 
                 .web(Instr_IN_en), 
                 .douta(Instruction_IF_DUMMY[31:0]));
   IF_ID_Reg XLXI_8 (.Instruction(Instruction_IF_DUMMY[31:0]), 
                     .Offset_ID(Offset_ID_before_Extend[15:0]), 
                     .OP_CODE_ID(OP_CODE_ID_DUMMY[5:0]), 
                     .rs_ID(rs_ID_DUMMY[4:0]), 
                     .rt_ID(rt_ID_DUMMY[4:0]));
   Offset_Extend XLXI_9 (.Offset(Offset_ID_before_Extend[15:0]), 
                         .Offset_ID(Offset_ID_DUMMY[63:0]));
   Control_Unit XLXI_10 (.OP_CODE(OP_CODE_ID_DUMMY[5:0]), 
                         .ADDI_ID(ADDI_ID_DUMMY), 
                         .ALU_OP_ID(ALU_OP_ID[3:0]), 
                         .BEQ_ID(BEQ_ID_DUMMY), 
                         .BGT_ID(BGT_ID_DUMMY), 
                         .BLT_ID(BLT_ID_DUMMY), 
                         .J_ID(J_ID_DUMMY), 
                         .LW_ID(LW_ID_DUMMY), 
                         .MOVI_ID(MOVI_ID_DUMMY), 
                         .NOOP_ID(NOOP_ID_DUMMY), 
                         .SUBI_ID(SUBI_ID_DUMMY), 
                         .SW_ID(SW_ID_DUMMY), 
                         .WME_ID(WME_ID), 
                         .WRE_ID(WRE_ID));
   Branch_Detection_Unit XLXI_11 (.BEQ_ID(BEQ_ID_DUMMY), 
                                  .BGT_ID(BGT_ID_DUMMY), 
                                  .BLT_ID(BLT_ID_DUMMY), 
                                  .J_ID(J_ID_DUMMY), 
                                  .rs_data(rs_data_ID_DUMMY[63:0]), 
                                  .rt_data(rt_data_ID_DUMMY[63:0]), 
                                  .PC_ctrl(PC_ctrl));
   ID_EX_Reg XLXI_12 (.ADDI_ID(ADDI_ID_DUMMY), 
                      .ALU_OP_ID(ALU_OP_ID[3:0]), 
                      .clk(clk), 
                      .LW_ID(LW_ID_DUMMY), 
                      .MOVI_ID(MOVI_ID_DUMMY), 
                      .NOOP_ID(NOOP_ID_DUMMY), 
                      .Offset_ID(Offset_ID_DUMMY[63:0]), 
                      .rst(rst), 
                      .rs_data_ID(rs_data_ID_DUMMY[63:0]), 
                      .rt_data_ID(rt_data_ID_DUMMY[63:0]), 
                      .rt_ID(rt_ID_DUMMY[4:0]), 
                      .SUBI_ID(SUBI_ID_DUMMY), 
                      .SW_ID(SW_ID_DUMMY), 
                      .WME_ID(WME_ID), 
                      .WRE_ID(WRE_ID), 
                      .ADDI_EX(ADDI_EX_DUMMY), 
                      .ALU_OP_EX(ALU_OP_EX_DUMMY[3:0]), 
                      .LW_EX(LW_EX_DUMMY), 
                      .MOVI_EX(MOVI_EX_DUMMY), 
                      .NOOP_EX(NOOP_EX_DUMMY), 
                      .Offset_EX(Offset_EX_DUMMY[63:0]), 
                      .rs_data_EX(rs_data_EX_DUMMY[63:0]), 
                      .rt_data_EX(rt_data_EX_DUMMY[63:0]), 
                      .rt_EX(rt_EX_DUMMY[4:0]), 
                      .SUBI_EX(SUBI_EX_DUMMY), 
                      .SW_EX(SW_EX_DUMMY), 
                      .WME_EX(WME_EX_DUMMY), 
                      .WRE_EX(WRE_EX_DUMMY));
   RF XLXI_15 (.clk(clk), 
               .rst(rst), 
               .r0addr(rs_ID_DUMMY[2:0]), 
               .r1addr(rt_ID_DUMMY[2:0]), 
               .waddr(rt_WB_DUMMY[2:0]), 
               .wdata(RF_Din_DUMMY[63:0]), 
               .wena(WRE_WB_DUMMY), 
               .r0data(rs_data_ID_DUMMY[63:0]), 
               .r1data(rt_data_ID_DUMMY[63:0]));
   ALU_src_MUX XLXI_16 (.ADDI_EX(ADDI_EX_DUMMY), 
                        .LW_EX(LW_EX_DUMMY), 
                        .Offset_EX(Offset_MUX_out_DUMMY[63:0]), 
                        .rt_data(rt_data_EX_DUMMY[63:0]), 
                        .SUBI_EX(SUBI_EX_DUMMY), 
                        .SW_EX(SW_EX_DUMMY), 
                        .ALU_B(ALU_B_in_DUMMY[63:0]));
   ALU XLXI_17 (.A(rs_data_EX_DUMMY[63:0]), 
                .ALU_OP(ALU_OP_EX_DUMMY[3:0]), 
                .B(ALU_B_in_DUMMY[63:0]), 
                .ALU_Out(ALU_result_EX_DUMMY[63:0]), 
                .Overflow(), 
                .Zero_Flag());
   EX_M_Reg XLXI_18 (.ADDI_EX(ADDI_EX_DUMMY), 
                     .ALU_result_EX(ALU_result_EX_DUMMY[63:0]), 
                     .clk(clk), 
                     .LW_EX(LW_EX_DUMMY), 
                     .MOVI_EX(MOVI_EX_DUMMY), 
                     .NOOP_EX(NOOP_EX_DUMMY), 
                     .Offset_EX(Offset_EX_DUMMY[63:0]), 
                     .rst(rst), 
                     .rs_data_EX(rs_data_EX_DUMMY[63:0]), 
                     .rt_data_EX(rt_data_EX_DUMMY[63:0]), 
                     .rt_EX(rt_EX_DUMMY[4:0]), 
                     .SUBI_EX(SUBI_EX_DUMMY), 
                     .SW_EX(SW_EX_DUMMY), 
                     .WME_EX(WME_EX_DUMMY), 
                     .WRE_EX(WRE_EX_DUMMY), 
                     .ADDI_M(ADDI_M_DUMMY), 
                     .ALU_result_M(ALU_result_M_DUMMY[63:0]), 
                     .LW_M(LW_M_DUMMY), 
                     .MOVI_M(MOVI_M_DUMMY), 
                     .NOOP_M(NOOP_M_DUMMY), 
                     .Offset_M(Offset_M_DUMMY[63:0]), 
                     .rs_data_M(rs_data_M_DUMMY[63:0]), 
                     .rt_data_M(rt_data_M_DUMMY[63:0]), 
                     .rt_M(rt_M_DUMMY[4:0]), 
                     .SUBI_M(SUBI_M_DUMMY), 
                     .SW_M(SW_M_DUMMY), 
                     .WME_M(WME_M_DUMMY), 
                     .WRE_M(WRE_M_DUMMY));
   HELN_Reg XLXI_19 (.clk(clk), 
                     .HLEN_in(HLEN[63:0]), 
                     .HLEN_Reg_write_en(WP_en_DUMMY), 
                     .rst(rst), 
                     .HLEN_out(HLEN_out_DUMMY[63:0]));
   HLEN_Offset_Adder XLXI_21 (.HLEN(HLEN_out_DUMMY[63:0]), 
                              .Offset(Offset_EX_DUMMY[63:0]), 
                              .result(HLEN_Offset_sum_DUMMY[63:0]));
   Offset_MUX XLXI_22 (.HLEN_Offset_Adder_result(HLEN_Offset_sum_DUMMY[63:0]), 
                       .LW_EX(LW_EX_DUMMY), 
                       .Offset_EX(Offset_EX_DUMMY[63:0]), 
                       .SW_EX(SW_EX_DUMMY), 
                       .ALU_src_MUX_in(Offset_MUX_out_DUMMY[63:0]));
   D_MEM XLXI_24 (.addra(D_waddr_DUMMY[7:0]), 
                  .addrb(D_raddr_DUMMY[7:0]), 
                  .clka(clk), 
                  .clkb(clk), 
                  .dina(D_wdata_DUMMY[63:0]), 
                  .wea(WME_M_out_DUMMY), 
                  .doutb(pkt_out_DUMMY[63:0]));
   D_addr_src_MUX XLXI_25 (.ALU_result_M(ALU_result_M_DUMMY[63:0]), 
                           .LW_M(LW_M_DUMMY), 
                           .rt_M(rt_M_DUMMY[4:0]), 
                           .SW_M(SW_M_DUMMY), 
                           .D_addr(D_addr_src_MUX_out_DUMMY[7:0]));
   WP_Reg XLXI_26 (.clk(clk), 
                   .FIFO_FULL(FIFO_FULL_DUMMY), 
                   .rst(rst_FIFO), 
                   .WP_en(WP_en_DUMMY), 
                   .WP_next(WP_next[7:0]), 
                   .WP(WP[7:0]));
   WP_Adder XLXI_27 (.WP(WP[7:0]), 
                     .WP_next(WP_next[7:0]));
   WP_addr_MUX XLXI_28 (.SRAM_addr(SRAM_addr_DUMMY[7:0]), 
                        .WP(WP[7:0]), 
                        .WP_ctrl(WP_en_DUMMY), 
                        .D_waddr(D_waddr_DUMMY[7:0]));
   WP_Controller XLXI_29 (.mode_code(mode_code[1:0]), 
                          .WP_en(WP_en_DUMMY));
   RP_Reg XLXI_30 (.clk(clk), 
                   .FIFO_EMPTY(FIFO_EMPTY_DUMMY), 
                   .RP_en(RP_en_DUMMY), 
                   .RP_next(RP_next[7:0]), 
                   .rst(rst_FIFO), 
                   .RP(RP[7:0]));
   RP_addr_MUX XLXI_31 (.RP(RP[7:0]), 
                        .RP_ctrl(RP_en_DUMMY), 
                        .SRAM_addr(SRAM_addr_DUMMY[7:0]), 
                        .D_raddr(D_raddr_DUMMY[7:0]));
   RP_Controller XLXI_32 (.mode_code(mode_code[1:0]), 
                          .RP_en(RP_en_DUMMY));
   RP_Adder XLXI_33 (.RP(RP[7:0]), 
                     .RP_next(RP_next[7:0]));
   WME_OR XLXI_34 (.WME_M(WME_M_DUMMY), 
                   .WP_en(WP_en_DUMMY), 
                   .WME(WME_M_out_DUMMY));
   M_WB_Reg XLXI_37 (.ADDI_M(ADDI_M_DUMMY), 
                     .ALU_result_M(ALU_result_M_DUMMY[63:0]), 
                     .clk(clk), 
                     .D_out_M(pkt_out_DUMMY[63:0]), 
                     .LW_M(LW_M_DUMMY), 
                     .MOVI_M(MOVI_M_DUMMY), 
                     .NOOP_M(NOOP_M_DUMMY), 
                     .Offset_M(Offset_M_DUMMY[63:0]), 
                     .rst(rst), 
                     .rs_data_M(rs_data_M_DUMMY[63:0]), 
                     .rt_data_M(rt_data_M_DUMMY[63:0]), 
                     .rt_M(rt_M_DUMMY[4:0]), 
                     .SUBI_M(SUBI_M_DUMMY), 
                     .SW_M(SW_M_DUMMY), 
                     .WRE_M(WRE_M_DUMMY), 
                     .ADDI_WB(ADDI_WB_DUMMY), 
                     .ALU_result_WB(ALU_result_WB_DUMMY[63:0]), 
                     .D_out_WB(Dout_WB_DUMMY[63:0]), 
                     .LW_WB(LW_WB_DUMMY), 
                     .MOVI_WB(MOVI_WB_DUMMY), 
                     .NOOP_WB(NOOP_WB), 
                     .Offset_WB(Offset_WB_DUMMY[63:0]), 
                     .rs_data_WB(rs_data_WB[63:0]), 
                     .rt_data_WB(rt_data_WB[63:0]), 
                     .rt_WB(rt_WB_DUMMY[2:0]), 
                     .SUBI_WB(SUBI_WB_DUMMY), 
                     .SW_WB(SW_WB), 
                     .WRE_WB(WRE_WB_DUMMY));
   SRAM_addr_Adder XLXI_38 (.D_addr(D_addr_src_MUX_out_DUMMY[7:0]), 
                            .RP(RP[7:0]), 
                            .D_addr_in(SRAM_addr_DUMMY[7:0]));
   WP_Data_MUX XLXI_39 (.FIFO_Din(pkt_in[63:0]), 
                        .SRAM_Din(rt_data_M_DUMMY[63:0]), 
                        .WP_ctrl(WP_en_DUMMY), 
                        .D_MEM_Din(D_wdata_DUMMY[63:0]));
   RF_WB_data_src_MUX XLXI_40 (.ADDI_WB(ADDI_WB_DUMMY), 
                               .ALU_out_WB(ALU_result_WB_DUMMY[63:0]), 
                               .D_out_WB(Dout_WB_DUMMY[63:0]), 
                               .LW_WB(LW_WB_DUMMY), 
                               .MOVI_WB(MOVI_WB_DUMMY), 
                               .Offset_WB(Offset_WB_DUMMY[63:0]), 
                               .SUBI_WB(SUBI_WB_DUMMY), 
                               .RF_WB_Din(RF_Din_DUMMY[63:0]));
   FIFO_state_controller XLXI_41 (.clk(clk), 
                                  .RP(RP[7:0]), 
                                  .rst_FIFO(rst_FIFO), 
                                  .WP(WP[7:0]), 
                                  .depth(FIFO_depth[7:0]), 
                                  .FIFO_almost_empty(FIFO_almost_empty), 
                                  .FIFO_almost_full(FIFO_almost_full), 
                                  .FIFO_EMPTY(FIFO_EMPTY_DUMMY), 
                                  .FIFO_FULL(FIFO_FULL_DUMMY));
endmodule
