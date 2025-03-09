`timescale 1ns / 1ps

module ID_EX_Reg
(
    input clk,
    input rst,

    input [3:0] ALU_OP_ID,
    input NOOP_ID,
    input ADDI_ID,
    input MOVI_ID,
    input LW_ID,
    input SW_ID,
    input SUBI_ID,

    input WME_ID,
    input WRE_ID,
    input [63:0] rs_data_ID,
    input [63:0] rt_data_ID,
    input [4:0] rt_ID,
    input [63:0] Offset_ID,

    output reg [3:0] ALU_OP_EX,
    output reg NOOP_EX,
    output reg ADDI_EX,
    output reg MOVI_EX,
    output reg LW_EX,
    output reg SW_EX,
    output reg SUBI_EX,
    
    output reg WME_EX,
    output reg WRE_EX,
    output reg [63:0] rs_data_EX,
    output reg [63:0] rt_data_EX,
    output reg [4:0] rt_EX,
    output reg [63:0] Offset_EX
);

    always @(posedge clk) begin
        if (rst) begin
            ALU_OP_EX <= 0;
            NOOP_EX <= 0;
            ADDI_EX <= 0;
            MOVI_EX <= 0;
            LW_EX <= 0;
            SW_EX <= 0;
            SUBI_EX <= 0;
            WME_EX <= 0;
            WRE_EX <= 0;
            rs_data_EX <= 0;
            rt_data_EX <= 0;
            rt_EX <= 0;
            Offset_EX <= 0;
        end
        else begin
            ALU_OP_EX <= ALU_OP_ID;
            NOOP_EX <= NOOP_ID;
            ADDI_EX <= ADDI_ID;
            MOVI_EX <= MOVI_ID;
            LW_EX <= LW_ID;
            SW_EX <= SW_ID;
            SUBI_EX <= SUBI_ID;
            WME_EX <= WME_ID;
            WRE_EX <= WRE_ID;
            rs_data_EX <= rs_data_ID;
            rt_data_EX <= rt_data_ID;
            rt_EX <= rt_ID;
            Offset_EX <= Offset_ID;
        end
    end

endmodule