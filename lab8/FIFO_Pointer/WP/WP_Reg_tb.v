`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:15 03/08/2025
// Design Name:   WP_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/WP_Reg_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WP_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WP_Reg_tb;

	// Inputs
	reg clk;
	reg rst;
	reg WP_en;
	reg [7:0] WP_next;

	// Outputs
	wire [7:0] WP;

	// Instantiate the Unit Under Test (UUT)
	WP_Reg uut (
		.clk(clk), 
		.rst(rst), 
		.WP_en(WP_en), 
		.WP_next(WP_next), 
		.WP(WP)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		WP_en = 0;
		WP_next = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst = 0;
        
		// Add stimulus here
		@(posedge clk);
		WP_en = 1;
		WP_next = 8'd1;

		@(posedge clk);
		WP_en = 1;
		WP_next = 8'd2;

		@(posedge clk);
		WP_en = 1;
		WP_next = 8'd8;

		@(posedge clk);
		WP_en = 0;
		WP_next = 8'd3;

		@(posedge clk);
		WP_en = 0;
		WP_next = 8'd2;

		@(posedge clk);
		WP_en = 1;
		WP_next = 8'd9;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

