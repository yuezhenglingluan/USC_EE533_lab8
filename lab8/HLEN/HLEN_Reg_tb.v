`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:29:22 03/08/2025
// Design Name:   HELN_Reg
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/HLEN_Reg_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HELN_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HLEN_Reg_tb;

	// Inputs
	reg clk;
	reg rst_FIFO;
	reg HLEN_Reg_write_en;
	reg [63:0] HLEN_in;

	// Outputs
	wire [63:0] HLEN;

	// Instantiate the Unit Under Test (UUT)
	HELN_Reg uut (
		.clk(clk), 
		.rst_FIFO(rst_FIFO), 
		.HLEN_Reg_write_en(HLEN_Reg_write_en), 
		.HLEN_in(HLEN_in), 
		.HLEN_out(HLEN_out)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst_FIFO = 1;
		HLEN_Reg_write_en = 0;
		HLEN_in = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clk);
		rst_FIFO = 0;
        
		// Add stimulus here
		@(posedge clk);
		HLEN_Reg_write_en = 1;
		HLEN_in = 64'd24;

		@(posedge clk);
		HLEN_Reg_write_en = 0;
		HLEN_in = 64'd2;

		@(posedge clk);
		HLEN_Reg_write_en = 1;
		HLEN_in = 64'd3;

		@(posedge clk);
		HLEN_Reg_write_en = 0;
		HLEN_in = 64'd31;

		@(posedge clk);

		@(posedge clk);
		$stop;

	end
      
endmodule

