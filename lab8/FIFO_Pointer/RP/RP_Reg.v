`timescale 1ns / 1ps

module RP_Reg
(
    input clk,
    input rst,
    input RP_en,
    input FIFO_EMPTY,
    input [7:0] RP_next,

    output reg [7:0] RP
);

    always @(posedge clk) begin
        if (rst) begin
            RP <= 0;
        end
        else if(RP_en && !FIFO_EMPTY) begin
            RP <= RP_next;
        end
    end

endmodule