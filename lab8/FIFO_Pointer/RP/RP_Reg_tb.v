`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:59:37 03/08/2025
// Design Name:   RP_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/RP_Reg_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RP_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RP_Reg_tb;

	// Inputs
	reg clk;
	reg rst;
	reg RP_en;
	reg FIFO_EMPTY;
	reg [7:0] RP_next;

	// Outputs
	wire [7:0] RP;

	// Instantiate the Unit Under Test (UUT)
	RP_Reg uut (
		.clk(clk), 
		.rst(rst), 
		.RP_en(RP_en), 
		.FIFO_EMPTY(FIFO_EMPTY),
		.RP_next(RP_next), 
		.RP(RP)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		RP_en = 0;
		FIFO_EMPTY = 0;
		RP_next = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst = 0;
        
		// Add stimulus here
		@(posedge clk);
		RP_en = 1;
		FIFO_EMPTY = 0;
		RP_next = 8'd0;

		@(posedge clk);
		RP_en = 1;
		FIFO_EMPTY = 0;
		RP_next = 8'd1;

		@(posedge clk);
		RP_en = 1;
		FIFO_EMPTY = 1;
		RP_next = 8'd2;

		@(posedge clk);
		RP_en = 1;
		FIFO_EMPTY = 0;
		RP_next = 8'd3;

		@(posedge clk);
		RP_en = 0;
		FIFO_EMPTY = 1;
		RP_next = 8'd4;

		@(posedge clk);
		RP_en = 0;
		FIFO_EMPTY = 0;
		RP_next = 8'd4;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

