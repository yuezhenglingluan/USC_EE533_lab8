`timescale 1ns / 1ps

module IF_ID_Reg
(
    input [31:0] Instruction,

    output [5:0] OP_CODE_ID,
    output [4:0] rs_ID,
    output [4:0] rt_ID,
    output [15:0] Offset_ID
);

    assign OP_CODE_ID = Instruction[31:26];
    assign rs_ID = Instruction[25:21];
    assign rt_ID = Instruction[20:16];
    assign Offset_ID = Instruction[15:0];

endmodule