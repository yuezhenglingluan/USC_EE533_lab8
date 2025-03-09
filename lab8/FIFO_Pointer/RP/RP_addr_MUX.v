`timescale 1ns / 1ps

module RP_addr_MUX
(
    input RP_ctrl,
    
    input [7:0] SRAM_addr,
    input [7:0] RP,

    output [7:0] D_raddr
);

    assign D_raddr = RP_ctrl ? RP : SRAM_addr;

endmodule