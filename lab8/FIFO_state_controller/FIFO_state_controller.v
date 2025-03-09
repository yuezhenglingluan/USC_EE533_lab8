`timescale 1ns / 1ps

module FIFO_state_controller #
(
    parameter FIFO_SIZE = 256,
    parameter FIFO_FULL_THREAD = 240,
    parameter FIFO_EMPTY_THREAD = 16
)
(
    input [7:0] WP,
    input [7:0] RP,
    input clk,
    input rst_FIFO,

    output [7:0] depth,
    output FIFO_EMPTY,
    output FIFO_FULL,
    output reg FIFO_almost_full,
    output reg FIFO_almost_empty
);

    assign FIFO_EMPTY = (WP == RP) && FIFO_almost_empty;
    assign FIFO_FULL = (WP == RP) && FIFO_almost_full;
    assign depth = (WP >= RP) ? (WP - RP) : (WP - RP + FIFO_SIZE);

    always @(posedge clk) begin
        if (rst_FIFO) begin
            FIFO_almost_empty <= 0;
            FIFO_almost_full <= 0;
        end
        else begin
            FIFO_almost_empty <= (depth < FIFO_EMPTY_THREAD) ? 1 : 0;
            FIFO_almost_full <= (depth > FIFO_FULL_THREAD) ? 1 : 0;
        end
    end

endmodule