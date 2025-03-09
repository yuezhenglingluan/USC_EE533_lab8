`timescale 1ns / 1ps

module HLEN_Offset_Adder
(
    input [63:0] Offset,
    input [63:0] HLEN,

    output [63:0] result
);

    assign result = Offset + HLEN;

endmodule