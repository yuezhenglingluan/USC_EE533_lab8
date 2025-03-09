`timescale 1ns / 1ps

module WP_addr_MUX
(
    input WP_ctrl,
    
    input [7:0] SRAM_addr,
    input [7:0] WP,

    output [7:0] D_waddr
);

    assign D_waddr = WP_ctrl ? WP : SRAM_addr;

endmodule