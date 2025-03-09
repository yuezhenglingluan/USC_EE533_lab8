`timescale 1ns / 1ps

module M_WB_Reg
(
    input clk,
    input rst,

    input NOOP_M,
    input ADDI_M,
    input MOVI_M,
    input LW_M,
    input SW_M,
    input SUBI_M,

    input WRE_M,
    input [63:0] D_out_M,
    input [63:0] rs_data_M,
    input [63:0] rt_data_M,
    input [63:0] ALU_result_M,
    input [63:0] Offset_M,
    input [4:0] rt_M,

    output reg NOOP_WB,
    output reg ADDI_WB,
    output reg MOVI_WB,
    output reg LW_WB,
    output reg SW_WB,
    output reg SUBI_WB,

    output reg WRE_WB,
    output [63:0] D_out_WB,
    output reg [63:0] rs_data_WB,
    output reg [63:0] rt_data_WB,
    output reg [63:0] ALU_result_WB,
    output reg [63:0] Offset_WB,
    output reg [2:0] rt_WB
);

    assign D_out_WB = D_out_M;

    always @(posedge clk) begin
        if (rst) begin
            NOOP_WB <= 0;
            ADDI_WB <= 0;
            MOVI_WB <= 0;
            LW_WB <= 0;
            SW_WB <= 0;
            SUBI_WB <= 0;
            WRE_WB <= 0;
            rs_data_WB <= 0;
            rt_data_WB <= 0;
            ALU_result_WB <= 0;
            Offset_WB <= 0;
            rt_WB <= 0;
        end
        else begin
            NOOP_WB <= NOOP_M;
            ADDI_WB <= ADDI_M;
            MOVI_WB <= MOVI_M;
            LW_WB <= LW_M;
            SW_WB <= SW_M;
            SUBI_WB <= SUBI_M;
            WRE_WB <= WRE_M;
            rs_data_WB <= rs_data_M;
            rt_data_WB <= rt_data_M;
            ALU_result_WB <= ALU_result_M;
            Offset_WB <= Offset_M;
            rt_WB <= rt_M[2:0];
        end
    end

endmodule