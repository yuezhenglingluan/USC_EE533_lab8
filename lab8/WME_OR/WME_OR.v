`timescale 1ns / 1ps

module WME_OR
(
    input WME_M,
    input WP_en,

    output WME
);

    assign WME = WME_M || WP_en;

endmodule