`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:13:34 03/08/2025
// Design Name:   RP_addr_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/RP_addr_MUX_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RP_addr_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RP_addr_MUX_tb;

	// Inputs
	reg RP_ctrl;
	reg [7:0] SRAM_addr;
	reg [7:0] RP;

	// Outputs
	wire [7:0] D_raddr;

	// Instantiate the Unit Under Test (UUT)
	RP_addr_MUX uut (
		.RP_ctrl(RP_ctrl), 
		.SRAM_addr(SRAM_addr), 
		.RP(RP), 
		.D_raddr(D_raddr)
	);

	initial begin
		// Initialize Inputs
		RP_ctrl = 0;
		SRAM_addr = 0;
		RP = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		RP_ctrl = 0;
		SRAM_addr = 8'd3;
		RP = 8'd5;

		#100;
		RP_ctrl = 1;
		SRAM_addr = 8'd9;
		RP = 8'd7;

		#100;
		RP_ctrl = 0;
		SRAM_addr = 8'd2;
		RP = 8'd7;

		#100;
		RP_ctrl = 1;
		SRAM_addr = 8'd4;
		RP = 8'd1;

		#100;
		$stop;

	end
      
endmodule

