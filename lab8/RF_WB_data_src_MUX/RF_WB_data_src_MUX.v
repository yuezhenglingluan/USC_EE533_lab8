`timescale 1ns / 1ps

module RF_WB_data_src_MUX
(
    input [63:0] D_out_WB,
    input [63:0] ALU_out_WB,
    input [63:0] Offset_WB,

    input LW_WB,
    input ADDI_WB,
    input SUBI_WB,
    input MOVI_WB,

    output [63:0] RF_WB_Din
);

    wire MUX_1_ctrl;
    wire MUX_2_ctrl;
    wire [63:0] temp;

    assign MUX_1_ctrl = ((ADDI_WB || SUBI_WB) && (!LW_WB)) ? 1 : 0;
    assign MUX_2_ctrl = (MOVI_WB && !LW_WB) ? 1 : 0;

    assign temp = MUX_1_ctrl ? ALU_out_WB : D_out_WB;
    assign RF_WB_Din = MUX_2_ctrl ? Offset_WB : temp;

endmodule