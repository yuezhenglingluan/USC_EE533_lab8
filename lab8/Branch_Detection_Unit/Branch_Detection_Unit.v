`timescale 1ns / 1ps

module Branch_Detection_Unit
(
    input [63:0] rs_data,
    input [63:0] rt_data,

    input BEQ_ID,
    input BGT_ID,
    input BLT_ID,
    input J_ID,

    output PC_ctrl
);

    assign PC_ctrl =
        ((BEQ_ID == 1) && (rt_data == rs_data)) ||
        ((BGT_ID == 1) && ($signed(rt_data) > $signed(rs_data))) ||
        ((BLT_ID == 1) && ($signed(rt_data) < $signed(rs_data))) ||
        (J_ID == 1)
        ? 1 : 0;

endmodule