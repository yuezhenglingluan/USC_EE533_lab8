`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:20:10 03/08/2025
// Design Name:   SRAM_addr_Adder
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/SRAM_addr_Adder_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SRAM_addr_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SRAM_addr_Adder_tb;

	// Inputs
	reg [7:0] D_addr;
	reg [7:0] RP;

	// Outputs
	wire [7:0] D_addr_in;

	// Instantiate the Unit Under Test (UUT)
	SRAM_addr_Adder uut (
		.D_addr(D_addr), 
		.RP(RP), 
		.D_addr_in(D_addr_in)
	);

	initial begin
		// Initialize Inputs
		D_addr = 0;
		RP = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		D_addr = 8'd1;
		RP = 8'd9;

		#100;
		D_addr = 8'd3;
		RP = 8'd0;

		#100;
		D_addr = 8'd8;
		RP = 8'd2;

		#100;
		$stop;

	end
      
endmodule

