`timescale 1ns / 1ps

module HELN_Reg
(
    input clk,
    input rst,
    input HLEN_Reg_write_en,
    input [63:0] HLEN_in,

    output reg [63:0] HLEN_out
);

    reg [63:0] HLEN;

    always @(posedge clk) begin
        if (rst) begin
            HLEN <= 0;
        end
        else if (HLEN_Reg_write_en) begin
            HLEN <= HLEN_in;
        end
    end

    always @(*) begin
        HLEN_out = HLEN;
    end

endmodule