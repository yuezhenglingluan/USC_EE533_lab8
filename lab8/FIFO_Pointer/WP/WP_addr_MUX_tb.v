`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:27:52 03/08/2025
// Design Name:   WP_addr_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab8/WP_addr_MUX_tb.v
// Project Name:  EE533_Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WP_addr_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WP_addr_MUX_tb;

	// Inputs
	reg WP_ctrl;
	reg [7:0] SRAM_addr;
	reg [7:0] WP;

	// Outputs
	wire [7:0] D_waddr;

	// Instantiate the Unit Under Test (UUT)
	WP_addr_MUX uut (
		.WP_ctrl(WP_ctrl), 
		.SRAM_addr(SRAM_addr), 
		.WP(WP), 
		.D_waddr(D_waddr)
	);

	initial begin
		// Initialize Inputs
		WP_ctrl = 0;
		SRAM_addr = 0;
		WP = 0;

		// Wait 100 ns for global reset to finish
		#100;
		WP_ctrl = 0;
		SRAM_addr = 8'd1;
		WP = 8'd2;
        
		// Add stimulus here
		#100;
		WP_ctrl = 1;
		SRAM_addr = 8'd6;
		WP = 8'd4;

		#100;
		WP_ctrl = 0;
		SRAM_addr = 8'd9;
		WP = 8'd5;

		#100;
		WP_ctrl = 1;
		SRAM_addr = 8'd4;
		WP = 8'd1;

		#100;
		$stop;

	end
      
endmodule

