`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:15 03/01/2025
// Design Name:   ALU_src_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/ALU_src_MUX_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_src_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_src_MUX_tb;

	// Inputs
	reg [63:0] rt_data;
	reg [63:0] Offset_EX;
	reg ADDI_EX;
	reg LW_EX;
	reg SW_EX;

	// Outputs
	wire [63:0] ALU_B;

	// Instantiate the Unit Under Test (UUT)
	ALU_src_MUX uut (
		.rt_data(rt_data), 
		.Offset_EX(Offset_EX), 
		.ADDI_EX(ADDI_EX), 
		.LW_EX(LW_EX), 
		.SW_EX(SW_EX), 
		.ALU_B(ALU_B)
	);

	initial begin
		// Initialize Inputs
		rt_data = 0;
		Offset_EX = 0;
		ADDI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		rt_data = 64'd1;
		Offset_EX = 64'd2;
		ADDI_EX = 0;
		LW_EX = 0;
		SW_EX = 0;

		#100;
		rt_data = 64'd1;
		Offset_EX = 64'd2;
		ADDI_EX = 1;
		LW_EX = 0;
		SW_EX = 0;

		#100;
		rt_data = 64'd1;
		Offset_EX = 64'd2;
		ADDI_EX = 0;
		LW_EX = 1;
		SW_EX = 0;

		#100;
		rt_data = 64'd1;
		Offset_EX = 64'd2;
		ADDI_EX = 0;
		LW_EX = 0;
		SW_EX = 1;

		#100;
		$stop;

	end
      
endmodule

