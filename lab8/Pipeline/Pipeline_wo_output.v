////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : Pipeline.vf
// /___/   /\     Timestamp : 03/01/2025 22:50:30
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "E:/Documents and Settings/student/EE533_Lab7/Pipeline.sch" Pipeline.vf
//Design Name: Pipeline
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module Pipeline(clk, 
                Instr_IN, 
                Instr_W_en, 
                I_W_Addr, 
                rst);

    input clk;
    input [31:0] Instr_IN;
    input Instr_W_en;
    input [8:0] I_W_Addr;
    input rst;
   
   wire ADDI_EX;
   wire ADDI_ID;
   wire ADDI_M;
   wire ADDI_WB;
   wire [63:0] ALU_B;
   wire [3:0] ALU_OP_EX;
   wire [3:0] ALU_OP_ID;
   wire [63:0] ALU_result_EX;
   wire [63:0] ALU_result_M;
   wire [63:0] ALU_result_WB;
   wire BEQ_ID;
   wire BGT_ID;
   wire BLT_ID;
   wire [63:0] D_out_WB;
   wire [31:0] Instruction;
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
   wire [15:0] Offset;
   wire [63:0] Offset_EX;
   wire [63:0] Offset_ID;
   wire [63:0] Offset_M;
   wire [63:0] Offset_WB;
   wire [63:0] ONE;
   wire [5:0] OP_CODE_ID;
   wire [63:0] PC;
   wire [63:0] PC_next;
   wire [63:0] PC_plus_one;
   wire [63:0] RF_WB_Din;
   wire [63:0] rs_data_EX;
   wire [63:0] rs_data_ID;
   wire [63:0] rs_data_M;
   wire [4:0] rs_ID;
   wire [63:0] rt_data_EX;
   wire [63:0] rt_data_ID;
   wire [63:0] rt_data_M;
   wire [4:0] rt_EX;
   wire [4:0] rt_ID;
   wire SW_EX;
   wire SW_ID;
   wire SW_M;
   wire WME_EX;
   wire WME_ID;
   wire WME_M;
   wire WRE_EX;
   wire WRE_ID;
   wire WRE_M;
   wire WRE_WB;
   wire XLXN_22;
   wire [4:0] XLXN_93;
   wire [7:0] XLXN_96;
   wire [63:0] XLXN_100;
   wire [2:0] XLXN_114;
   
   PC XLXI_1 (.clk(clk), 
              .PC_next(PC_next[63:0]), 
              .rst(rst), 
              .PC(PC[63:0]));
   PC_MUX XLXI_3 (.BTA(Offset_ID[63:0]), 
                  .PC_ctrl(XLXN_22), 
                  .PC_next_in(PC_plus_one[63:0]), 
                  .PC_next_out(PC_next[63:0]));
   I_MEM XLXI_4 (.addra(PC[8:0]), 
                 .addrb(I_W_Addr[8:0]), 
                 .clka(clk), 
                 .clkb(clk), 
                 .dinb(Instr_IN[31:0]), 
                 .web(Instr_W_en), 
                 .douta(Instruction[31:0]));
   IF_ID_Reg XLXI_5 (.Instruction(Instruction[31:0]), 
                     .Offset_ID(Offset[15:0]), 
                     .OP_CODE_ID(OP_CODE_ID[5:0]), 
                     .rs_ID(rs_ID[4:0]), 
                     .rt_ID(rt_ID[4:0]));
   RF XLXI_6 (.clk(clk), 
              .rst(rst), 
              .r0addr(rs_ID[2:0]), 
              .r1addr(rt_ID[2:0]), 
              .waddr(XLXN_114[2:0]), 
              .wdata(RF_WB_Din[63:0]), 
              .wena(WRE_WB), 
              .r0data(rs_data_ID[63:0]), 
              .r1data(rt_data_ID[63:0]));
   Control_Unit XLXI_7 (.OP_CODE(OP_CODE_ID[5:0]), 
                        .ADDI_ID(ADDI_ID), 
                        .ALU_OP_ID(ALU_OP_ID[3:0]), 
                        .BEQ_ID(BEQ_ID), 
                        .BGT_ID(BGT_ID), 
                        .BLT_ID(BLT_ID), 
                        .J_ID(J_ID), 
                        .LW_ID(LW_ID), 
                        .MOVI_ID(MOVI_ID), 
                        .NOOP_ID(NOOP_ID), 
                        .SW_ID(SW_ID), 
                        .WME_ID(WME_ID), 
                        .WRE_ID(WRE_ID));
   Offset_Extend XLXI_9 (.Offset(Offset[15:0]), 
                         .Offset_ID(Offset_ID[63:0]));
   ID_EX_Reg XLXI_10 (.ADDI_ID(ADDI_ID), 
                      .ALU_OP_ID(ALU_OP_ID[3:0]), 
                      .clk(clk), 
                      .LW_ID(LW_ID), 
                      .MOVI_ID(MOVI_ID), 
                      .NOOP_ID(NOOP_ID), 
                      .Offset_ID(Offset_ID[63:0]), 
                      .rst(rst), 
                      .rs_data_ID(rs_data_ID[63:0]), 
                      .rt_data_ID(rt_data_ID[63:0]), 
                      .rt_ID(rt_ID[4:0]), 
                      .SW_ID(SW_ID), 
                      .WME_ID(WME_ID), 
                      .WRE_ID(WRE_ID), 
                      .ADDI_EX(ADDI_EX), 
                      .ALU_OP_EX(ALU_OP_EX[3:0]), 
                      .LW_EX(LW_EX), 
                      .MOVI_EX(MOVI_EX), 
                      .NOOP_EX(NOOP_EX), 
                      .Offset_EX(Offset_EX[63:0]), 
                      .rs_data_EX(rs_data_EX[63:0]), 
                      .rt_data_EX(rt_data_EX[63:0]), 
                      .rt_EX(rt_EX[4:0]), 
                      .SW_EX(SW_EX), 
                      .WME_EX(WME_EX), 
                      .WRE_EX(WRE_EX));
   ALU XLXI_11 (.A(rs_data_EX[63:0]), 
                .ALU_OP(ALU_OP_EX[3:0]), 
                .B(ALU_B[63:0]), 
                .ALU_Out(ALU_result_EX[63:0]), 
                .Overflow(), 
                .Zero_Flag());
   ALU_src_MUX XLXI_12 (.ADDI_EX(ADDI_EX), 
                        .LW_EX(LW_EX), 
                        .Offset_EX(Offset_EX[63:0]), 
                        .rt_data(rt_data_EX[63:0]), 
                        .SW_EX(SW_EX), 
                        .ALU_B(ALU_B[63:0]));
   EX_M_Reg XLXI_13 (.ADDI_EX(ADDI_EX), 
                     .ALU_result_EX(ALU_result_EX[63:0]), 
                     .clk(clk), 
                     .LW_EX(LW_EX), 
                     .MOVI_EX(MOVI_EX), 
                     .NOOP_EX(NOOP_EX), 
                     .Offset_EX(Offset_EX[63:0]), 
                     .rst(rst), 
                     .rs_data_EX(rs_data_EX[63:0]), 
                     .rt_data_EX(rt_data_EX[63:0]), 
                     .rt_EX(rt_EX[4:0]), 
                     .SW_EX(SW_EX), 
                     .WME_EX(WME_EX), 
                     .WRE_EX(WRE_EX), 
                     .ADDI_M(ADDI_M), 
                     .ALU_result_M(ALU_result_M[63:0]), 
                     .LW_M(LW_M), 
                     .MOVI_M(MOVI_M), 
                     .NOOP_M(NOOP_M), 
                     .Offset_M(Offset_M[63:0]), 
                     .rs_data_M(rs_data_M[63:0]), 
                     .rt_data_M(rt_data_M[63:0]), 
                     .rt_M(XLXN_93[4:0]), 
                     .SW_M(SW_M), 
                     .WME_M(WME_M), 
                     .WRE_M(WRE_M));
   D_addr_src_MUX XLXI_14 (.ALU_result_M(ALU_result_M[63:0]), 
                           .rt_M(XLXN_93[4:0]), 
                           .SW_M(SW_M), 
                           .D_addr(XLXN_96[7:0]));
   D_MEM XLXI_15 (.addra(XLXN_96[7:0]), 
                  .addrb(XLXN_96[7:0]), 
                  .clka(clk), 
                  .clkb(clk), 
                  .dina(rt_data_M[63:0]), 
                  .wea(WME_M), 
                  .doutb(XLXN_100[63:0]));
   M_WB_Reg XLXI_16 (.ADDI_M(ADDI_M), 
                     .ALU_result_M(ALU_result_M[63:0]), 
                     .clk(clk), 
                     .D_out_M(XLXN_100[63:0]), 
                     .LW_M(LW_M), 
                     .MOVI_M(MOVI_M), 
                     .NOOP_M(NOOP_M), 
                     .Offset_M(Offset_M[63:0]), 
                     .rst(rst), 
                     .rs_data_M(rs_data_M[63:0]), 
                     .rt_M(XLXN_93[4:0]), 
                     .SW_M(SW_M), 
                     .WRE_M(WRE_M), 
                     .ADDI_WB(ADDI_WB), 
                     .ALU_result_WB(ALU_result_WB[63:0]), 
                     .D_out_WB(D_out_WB[63:0]), 
                     .LW_WB(LW_WB), 
                     .MOVI_WB(MOVI_WB), 
                     .NOOP_WB(), 
                     .Offset_WB(Offset_WB[63:0]), 
                     .rs_data_WB(), 
                     .rt_WB(XLXN_114[2:0]), 
                     .SW_WB(), 
                     .WRE_WB(WRE_WB));
   RF_WB_data_src_MUX XLXI_17 (.ADDI_WB(ADDI_WB), 
                               .ALU_out_WB(ALU_result_WB[63:0]), 
                               .D_out_WB(D_out_WB[63:0]), 
                               .LW_WB(LW_WB), 
                               .MOVI_WB(MOVI_WB), 
                               .Offset_WB(Offset_WB[63:0]), 
                               .RF_WB_Din(RF_WB_Din[63:0]));
   PC_plus_1 XLXI_18 (.ONE(ONE[63:0]), 
                      .PC(PC[63:0]), 
                      .PC_next(PC_plus_one[63:0]));
   VCC XLXI_19 (.P(ONE[0]));
   Branch_Detection_Unit XLXI_21 (.BEQ_ID(BEQ_ID), 
                                  .BGT_ID(BGT_ID), 
                                  .BLT_ID(BLT_ID), 
                                  .J_ID(J_ID), 
                                  .rs_data(rs_data_ID[63:0]), 
                                  .rt_data(rt_data_ID[63:0]), 
                                  .PC_ctrl(XLXN_22));
endmodule
