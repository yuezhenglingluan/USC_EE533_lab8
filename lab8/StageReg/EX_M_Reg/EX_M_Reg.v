`timescale 1ns / 1ps

module EX_M_Reg
(
    input clk,
    input rst,

    input NOOP_EX,
    input ADDI_EX,
    input MOVI_EX,
    input LW_EX,
    input SW_EX,
    input SUBI_EX,

    input WME_EX,
    input WRE_EX,
    input [63:0] ALU_result_EX,
    input [63:0] rs_data_EX,
    input [63:0] rt_data_EX,
    input [4:0] rt_EX,
    input [63:0] Offset_EX,

    output reg NOOP_M,
    output reg ADDI_M,
    output reg MOVI_M,
    output reg LW_M,
    output reg SW_M,
    output reg SUBI_M,

    output reg WME_M,
    output reg WRE_M,
    output reg [63:0] ALU_result_M,
    output reg [63:0] rs_data_M,
    output reg [63:0] rt_data_M,
    output reg [4:0] rt_M,
    output reg [63:0] Offset_M
);

    always @(posedge clk) begin
        if (rst) begin
            NOOP_M <= 0;
            ADDI_M <= 0;
            MOVI_M <= 0;
            LW_M <= 0;
            SW_M <= 0;
            SUBI_M <= 0;

            WME_M <= 0;
            WRE_M <= 0;
            ALU_result_M <= 0;
            rs_data_M <= 0;
            rt_data_M <= 0;
            rt_M <= 0;
            Offset_M <= 0;
        end
        else begin
            NOOP_M <= NOOP_EX;
            ADDI_M <= ADDI_EX;
            MOVI_M <= MOVI_EX;
            LW_M <= LW_EX;
            SW_M <= SW_EX;
            SUBI_M <= SUBI_EX;

            WME_M <= WME_EX;
            WRE_M <= WRE_EX;
            ALU_result_M <= ALU_result_EX;
            rs_data_M <= rs_data_EX;
            rt_data_M <= rt_data_EX;
            rt_M <= rt_EX;
            Offset_M <= Offset_EX;
        end
    end

endmodule