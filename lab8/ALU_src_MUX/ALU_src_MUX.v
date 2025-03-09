`timescale 1ns / 1ps

module ALU_src_MUX
(
    input [63:0] rt_data,
    input [63:0] Offset_EX,
    input ADDI_EX,
    input SUBI_EX,
    input LW_EX,
    input SW_EX,

    output [63:0] ALU_B
);

    wire ALU_src_ctrl;

    assign ALU_src_ctrl = ADDI_EX || SUBI_EX || LW_EX || SW_EX;

    assign ALU_B = (ALU_src_ctrl == 1) ? Offset_EX : rt_data;

endmodule