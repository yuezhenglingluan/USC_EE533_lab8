`timescale 1ns / 1ps

module WP_Adder
(
    input [7:0] WP,

    output [7:0] WP_next
);

    assign WP_next = WP + 1;

endmodule