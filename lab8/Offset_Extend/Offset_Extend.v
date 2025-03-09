`timescale 1ns / 1ps

module Offset_Extend
(
    input [15:0] Offset,

    output [63:0] Offset_ID
);

    assign Offset_ID[15:0] = Offset;
    assign Offset_ID[63:16] = 48'b0;

endmodule