`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:32 03/01/2025
// Design Name:   PC
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/PC_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [63:0] PC_next;

	// Outputs
	wire [63:0] PC;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.rst(rst), 
		.PC_next(PC_next), 
		.PC(PC)
	);
	
	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		PC_next = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
        
		// Add stimulus here
        @(posedge clk);
        PC_next = 64'd1;

        @(posedge clk);
        PC_next = 64'd2;

        @(posedge clk);
        PC_next = 64'd3;
        
        @(posedge clk);
        PC_next = 64'd4;

		@(posedge clk);
        $stop;

	end
      
endmodule
