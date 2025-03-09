`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:20 03/08/2025
// Design Name:   WP_Data_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/WP_Data_MUX_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WP_Data_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WP_Data_MUX_tb;

	// Inputs
	reg WP_ctrl;
	reg [63:0] SRAM_Din;
	reg [63:0] FIFO_Din;

	// Outputs
	wire [63:0] D_MEM_Din;

	// Instantiate the Unit Under Test (UUT)
	WP_Data_MUX uut (
		.WP_ctrl(WP_ctrl), 
		.SRAM_Din(SRAM_Din), 
		.FIFO_Din(FIFO_Din), 
		.D_MEM_Din(D_MEM_Din)
	);

	initial begin
		// Initialize Inputs
		WP_ctrl = 0;
		SRAM_Din = 0;
		FIFO_Din = 0;

		// Wait 100 ns for global reset to finish
		#100;
		WP_ctrl = 1;
		SRAM_Din = 64'd2;
		FIFO_Din = 64'd9;
        
		// Add stimulus here
		#100;
		WP_ctrl = 0;
		SRAM_Din = 64'd2;
		FIFO_Din = 64'd9;

		#100;
		WP_ctrl = 1;
		SRAM_Din = 64'd7;
		FIFO_Din = 64'd6;

		#100;
		WP_ctrl = 0;
		SRAM_Din = 64'd7;
		FIFO_Din = 64'd6;

		#100;
		WP_ctrl = 1;
		SRAM_Din = 64'd3;
		FIFO_Din = 64'd34;

		#100;
		$stop;

	end
      
endmodule

