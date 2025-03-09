`timescale 1ns / 1ps

module D_addr_src_MUX
(
    input [63:0] ALU_result_M,
    input [4:0] rt_M,
    input LW_M,
    input SW_M,

    output [7:0] D_addr
);

    assign D_addr[4:0] = ((SW_M == 1) || (LW_M == 1)) ? ALU_result_M[4:0] : rt_M[4:0];
    assign D_addr[7:5] = 0;

endmodule