`timescale 1ns / 1ps

module HELN_Reg
(
    input clk,
    input rst_FIFO,
    input HLEN_Reg_write_en,
    input [63:0] HLEN_in,

    output [63:0] HLEN_out
);

    reg [63:0] HLEN;

    assign HLEN_out = HLEN;

    always @(posedge clk) begin
        if (rst_FIFO) begin
            HLEN <= 0;
        end
        else if (HLEN_Reg_write_en) begin
            HLEN <= HLEN_in;
        end
    end

endmodule