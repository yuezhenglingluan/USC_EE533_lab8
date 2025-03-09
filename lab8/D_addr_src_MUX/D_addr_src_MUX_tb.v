`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:09:35 03/01/2025
// Design Name:   D_addr_src_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/D_addr_src_MUX_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_addr_src_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module D_addr_src_MUX_tb;

	// Inputs
	reg [63:0] ALU_result_M;
	reg [4:0] rt_M;
	reg SW_M;

	// Outputs
	wire [7:0] D_addr;

	// Instantiate the Unit Under Test (UUT)
	D_addr_src_MUX uut (
		.ALU_result_M(ALU_result_M), 
		.rt_M(rt_M), 
		.SW_M(SW_M), 
		.D_addr(D_addr)
	);

	initial begin
		// Initialize Inputs
		ALU_result_M = 0;
		rt_M = 0;
		SW_M = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		ALU_result_M = 64'd1;
		rt_M = 5'd2;
		SW_M = 0;

		#100;
		ALU_result_M = 64'd3;
		rt_M = 5'd4;
		SW_M = 1;

		#100;
		$stop;

	end
      
endmodule

