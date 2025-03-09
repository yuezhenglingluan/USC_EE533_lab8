`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:31:47 03/08/2025
// Design Name:   FIFO_state_controller
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/FIFO_state_controller_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FIFO_state_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FIFO_state_controller_tb;

	// Inputs
	reg [7:0] WP;
	reg [7:0] RP;
	reg clk;
	reg rst_FIFO;

	// Outputs
	wire [7:0] depth;
	wire FIFO_EMPTY;
	wire FIFO_FULL;
	wire FIFO_almost_full;
	wire FIFO_almost_empty;

	// Instantiate the Unit Under Test (UUT)
	FIFO_state_controller uut (
		.WP(WP), 
		.RP(RP), 
		.clk(clk), 
		.rst_FIFO(rst_FIFO), 
		.depth(depth), 
		.FIFO_EMPTY(FIFO_EMPTY), 
		.FIFO_FULL(FIFO_FULL), 
		.FIFO_almost_full(FIFO_almost_full), 
		.FIFO_almost_empty(FIFO_almost_empty)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		WP = 0;
		RP = 0;
		clk = 1;
		rst_FIFO = 1;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst_FIFO = 0;
        
		// Add stimulus here
		@(posedge clk);
		WP = 8'd6;
		RP = 8'd9;

		@(posedge clk);
		WP = 8'd7;
		RP = 8'd9;

		@(posedge clk);
		WP = 8'd8;
		RP = 8'd9;

		@(posedge clk);
		WP = 8'd9;
		RP = 8'd9;

		@(posedge clk);
		WP = 8'd12;
		RP = 8'd9;

		@(posedge clk);
		WP = 8'd12;
		RP = 8'd10;

		@(posedge clk);
		WP = 8'd12;
		RP = 8'd11;

		@(posedge clk);
		WP = 8'd12;
		RP = 8'd12;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

