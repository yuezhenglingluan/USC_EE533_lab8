`timescale 1ns / 1ps

module Offset_MUX
(
    input LW_EX,
    input SW_EX,

    input [63:0] HLEN_Offset_Adder_result,
    input [63:0] Offset_EX,

    output [63:0] ALU_src_MUX_in
);

    wire Offset_MUX_ctrl;

    assign Offset_MUX_ctrl = LW_EX || SW_EX;

    assign ALU_src_MUX_in = Offset_MUX_ctrl ? HLEN_Offset_Adder_result : Offset_EX;

endmodule