////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : Pipeline_demo.vf
// /___/   /\     Timestamp : 03/08/2025 16:58:33
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
                     pkt_out);

    input clk;
    input [63:0] HLEN;
    input [31:0] Instr_IN;
    input [8:0] Instr_IN_addr;
    input Instr_IN_en;
    input [1:0] mode_code;
    input [63:0] ONE;
    input [63:0] pkt_in;
    input rst;
   output [63:0] pkt_out;
   
   wire ADDI_EX;
   wire ADDI_ID;
   wire ADDI_M;
   wire ADDI_WB;
   wire [63:0] ALU_B_in;
   wire [3:0] ALU_OP_EX;
   wire [3:0] ALU_OP_ID;
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
   wire [63:0] Offset_EX;
   wire [63:0] Offset_ID;
   wire [15:0] Offset_ID_before_Extend;
   wire [63:0] Offset_M;
   wire [63:0] Offset_MUX_out;
   wire [63:0] Offset_WB;
   wire [5:0] OP_CODE_ID;
   wire [63:0] PC;
   wire PC_ctrl;
   wire [63:0] PC_next;
   wire [63:0] PC_reg;
   wire [63:0] RF_Din;
   wire [7:0] RP;
   wire RP_en;
   wire [7:0] RP_next;
   wire [63:0] rs_data_EX;
   wire [63:0] rs_data_ID;
   wire [63:0] rs_data_M;
   wire [4:0] rs_ID;
   wire [63:0] rt_data_EX;
   wire [63:0] rt_data_ID;
   wire [63:0] rt_data_M;
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
   wire WME_EX;
   wire WME_ID;
   wire WME_M;
   wire WME_M_out;
   wire [7:0] WP;
   wire WP_en;
   wire [7:0] WP_next;
   wire WRE_EX;
   wire WRE_ID;
   wire WRE_M;
   wire WRE_WB;
   wire [63:0] pkt_out_DUMMY;
   
   assign pkt_out[63:0] = pkt_out_DUMMY[63:0];
   PC XLXI_1 (.clk(clk), 
              .PC_next(PC_next[63:0]), 
              .rst(rst), 
              .PC(PC_reg[63:0]));
   PC_plus_1 XLXI_2 (.ONE(ONE[63:0]), 
                     .PC(PC[63:0]), 
                     .PC_next(PC_next[63:0]));
   PC_MUX XLXI_3 (.BTA(Offset_ID[63:0]), 
                  .PC_ctrl(PC_ctrl), 
                  .PC_next_in(PC_reg[63:0]), 
                  .PC_next_out(PC[63:0]));
   I_MEM XLXI_7 (.addra(PC[8:0]), 
                 .addrb(Instr_IN_addr[8:0]), 
                 .clka(clk), 
                 .clkb(clk), 
                 .dinb(Instr_IN[31:0]), 
                 .web(Instr_IN_en), 
                 .douta(Instruction_IF[31:0]));
   IF_ID_Reg XLXI_8 (.Instruction(Instruction_IF[31:0]), 
                     .Offset_ID(Offset_ID_before_Extend[15:0]), 
                     .OP_CODE_ID(OP_CODE_ID[5:0]), 
                     .rs_ID(rs_ID[4:0]), 
                     .rt_ID(rt_ID[4:0]));
   Offset_Extend XLXI_9 (.Offset(Offset_ID_before_Extend[15:0]), 
                         .Offset_ID(Offset_ID[63:0]));
   Control_Unit XLXI_10 (.OP_CODE(OP_CODE_ID[5:0]), 
                         .ADDI_ID(ADDI_ID), 
                         .ALU_OP_ID(ALU_OP_ID[3:0]), 
                         .BEQ_ID(BEQ_ID), 
                         .BGT_ID(BGT_ID), 
                         .BLT_ID(BLT_ID), 
                         .J_ID(J_ID), 
                         .LW_ID(LW_ID), 
                         .MOVI_ID(MOVI_ID), 
                         .NOOP_ID(NOOP_ID), 
                         .SUBI_ID(SUBI_ID), 
                         .SW_ID(SW_ID), 
                         .WME_ID(WME_ID), 
                         .WRE_ID(WRE_ID));
   Branch_Detection_Unit XLXI_11 (.BEQ_ID(BEQ_ID), 
                                  .BGT_ID(BGT_ID), 
                                  .BLT_ID(BLT_ID), 
                                  .J_ID(J_ID), 
                                  .rs_data(rs_data_ID[63:0]), 
                                  .rt_data(rt_data_ID[63:0]), 
                                  .PC_ctrl(PC_ctrl));
   ID_EX_Reg XLXI_12 (.ADDI_ID(ADDI_ID), 
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
                      .SUBI_ID(SUBI_ID), 
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
                      .SUBI_EX(SUBI_EX), 
                      .SW_EX(SW_EX), 
                      .WME_EX(WME_EX), 
                      .WRE_EX(WRE_EX));
   RF XLXI_15 (.clk(clk), 
               .rst(rst), 
               .r0addr(rs_ID[2:0]), 
               .r1addr(rt_ID[2:0]), 
               .waddr(rt_WB[2:0]), 
               .wdata(RF_Din[63:0]), 
               .wena(WRE_WB), 
               .r0data(rs_data_ID[63:0]), 
               .r1data(rt_data_ID[63:0]));
   ALU_src_MUX XLXI_16 (.ADDI_EX(ADDI_EX), 
                        .LW_EX(LW_EX), 
                        .Offset_EX(Offset_MUX_out[63:0]), 
                        .rt_data(rt_data_EX[63:0]), 
                        .SUBI_EX(SUBI_EX), 
                        .SW_EX(SW_EX), 
                        .ALU_B(ALU_B_in[63:0]));
   ALU XLXI_17 (.A(rs_data_EX[63:0]), 
                .ALU_OP(ALU_OP_EX[3:0]), 
                .B(ALU_B_in[63:0]), 
                .ALU_Out(ALU_result_EX[63:0]), 
                .Overflow(), 
                .Zero_Flag());
   EX_M_Reg XLXI_18 (.ADDI_EX(ADDI_EX), 
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
                     .SUBI_EX(SUBI_EX), 
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
                     .rt_M(rt_M[4:0]), 
                     .SUBI_M(SUBI_M), 
                     .SW_M(SW_M), 
                     .WME_M(WME_M), 
                     .WRE_M(WRE_M));
   HELN_Reg XLXI_19 (.clk(clk), 
                     .HLEN_in(HLEN[63:0]), 
                     .HLEN_Reg_write_en(WP_en), 
                     .rst(rst), 
                     .HLEN_out(HLEN_out[63:0]));
   HLEN_Offset_Adder XLXI_21 (.HLEN(HLEN_out[63:0]), 
                              .Offset(Offset_EX[63:0]), 
                              .result(HLEN_Offset_sum[63:0]));
   Offset_MUX XLXI_22 (.HLEN_Offset_Adder_result(HLEN_Offset_sum[63:0]), 
                       .LW_EX(LW_EX), 
                       .Offset_EX(Offset_EX[63:0]), 
                       .SW_EX(SW_EX), 
                       .ALU_src_MUX_in(Offset_MUX_out[63:0]));
   D_MEM XLXI_24 (.addra(D_waddr[7:0]), 
                  .addrb(D_raddr[7:0]), 
                  .clka(clk), 
                  .clkb(clk), 
                  .dina(D_wdata[63:0]), 
                  .wea(WME_M_out), 
                  .doutb(pkt_out_DUMMY[63:0]));
   D_addr_src_MUX XLXI_25 (.ALU_result_M(ALU_result_M[63:0]), 
                           .LW_M(LW_M), 
                           .rt_M(rt_M[4:0]), 
                           .SW_M(SW_M), 
                           .D_addr(D_addr_src_MUX_out[7:0]));
   WP_Reg XLXI_26 (.clk(clk), 
                   .rst(rst), 
                   .WP_en(WP_en), 
                   .WP_next(WP_next[7:0]), 
                   .WP(WP[7:0]));
   WP_Adder XLXI_27 (.WP(WP[7:0]), 
                     .WP_next(WP_next[7:0]));
   WP_addr_MUX XLXI_28 (.SRAM_addr(SRAM_addr[7:0]), 
                        .WP(WP[7:0]), 
                        .WP_ctrl(WP_en), 
                        .D_waddr(D_waddr[7:0]));
   WP_Controller XLXI_29 (.mode_code(mode_code[1:0]), 
                          .WP_en(WP_en));
   RP_Reg XLXI_30 (.clk(clk), 
                   .RP_en(RP_en), 
                   .RP_next(RP_next[7:0]), 
                   .rst(rst), 
                   .RP(RP[7:0]));
   RP_addr_MUX XLXI_31 (.RP(RP[7:0]), 
                        .RP_ctrl(RP_en), 
                        .SRAM_addr(SRAM_addr[7:0]), 
                        .D_raddr(D_raddr[7:0]));
   RP_Controller XLXI_32 (.mode_code(mode_code[1:0]), 
                          .RP_en(RP_en));
   RP_Adder XLXI_33 (.RP(RP[7:0]), 
                     .RP_next(RP_next[7:0]));
   WME_OR XLXI_34 (.WME_M(WME_M), 
                   .WP_en(WP_en), 
                   .WME(WME_M_out));
   M_WB_Reg XLXI_37 (.ADDI_M(ADDI_M), 
                     .ALU_result_M(ALU_result_M[63:0]), 
                     .clk(clk), 
                     .D_out_M(pkt_out_DUMMY[63:0]), 
                     .LW_M(LW_M), 
                     .MOVI_M(MOVI_M), 
                     .NOOP_M(NOOP_M), 
                     .Offset_M(Offset_M[63:0]), 
                     .rst(rst), 
                     .rs_data_M(rs_data_M[63:0]), 
                     .rt_data_M(rt_data_M[63:0]), 
                     .rt_M(rt_M[4:0]), 
                     .SUBI_M(SUBI_M), 
                     .SW_M(SW_M), 
                     .WRE_M(WRE_M), 
                     .ADDI_WB(ADDI_WB), 
                     .ALU_result_WB(ALU_result_WB[63:0]), 
                     .D_out_WB(Dout_WB[63:0]), 
                     .LW_WB(LW_WB), 
                     .MOVI_WB(MOVI_WB), 
                     .NOOP_WB(), 
                     .Offset_WB(Offset_WB[63:0]), 
                     .rs_data_WB(), 
                     .rt_data_WB(), 
                     .rt_WB(rt_WB[2:0]), 
                     .SUBI_WB(SUBI_WB), 
                     .SW_WB(), 
                     .WRE_WB(WRE_WB));
   SRAM_addr_Adder XLXI_38 (.D_addr(D_addr_src_MUX_out[7:0]), 
                            .RP(RP[7:0]), 
                            .D_addr_in(SRAM_addr[7:0]));
   WP_Data_MUX XLXI_39 (.FIFO_Din(pkt_in[63:0]), 
                        .SRAM_Din(rt_data_M[63:0]), 
                        .WP_ctrl(WP_en), 
                        .D_MEM_Din(D_wdata[63:0]));
   RF_WB_data_src_MUX XLXI_40 (.ADDI_WB(ADDI_WB), 
                               .ALU_out_WB(ALU_result_WB[63:0]), 
                               .D_out_WB(Dout_WB[63:0]), 
                               .LW_WB(LW_WB), 
                               .MOVI_WB(MOVI_WB), 
                               .Offset_WB(Offset_WB[63:0]), 
                               .SUBI_WB(SUBI_WB), 
                               .RF_WB_Din(RF_Din[63:0]));
endmodule
