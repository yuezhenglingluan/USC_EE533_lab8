`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:24:15 03/01/2025
// Design Name:   RF_WB_data_src_MUX
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/RF_WB_data_src_MUX_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RF_WB_data_src_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RF_WB_data_src_MUX_tb;

	// Inputs
	reg [63:0] D_out_WB;
	reg [63:0] ALU_out_WB;
	reg [63:0] Offset_WB;
	reg LW_WB;
	reg ADDI_WB;
	reg MOVI_WB;

	// Outputs
	wire [63:0] RF_WB_Din;

	// Instantiate the Unit Under Test (UUT)
	RF_WB_data_src_MUX uut (
		.D_out_WB(D_out_WB), 
		.ALU_out_WB(ALU_out_WB), 
		.Offset_WB(Offset_WB), 
		.LW_WB(LW_WB), 
		.ADDI_WB(ADDI_WB), 
		.MOVI_WB(MOVI_WB), 
		.RF_WB_Din(RF_WB_Din)
	);

	initial begin
		// Initialize Inputs
		D_out_WB = 0;
		ALU_out_WB = 0;
		Offset_WB = 0;
		LW_WB = 0;
		ADDI_WB = 0;
		MOVI_WB = 0;

		// Wait 100 ns for global reset to finish
        #100;

		// Add stimulus here
		#100;
		D_out_WB = 64'd1;
		ALU_out_WB = 64'd2;
		Offset_WB = 64'd3;
		LW_WB = 0;
		ADDI_WB = 0;
		MOVI_WB = 0;

		#100;
		D_out_WB = 64'd1;
		ALU_out_WB = 64'd2;
		Offset_WB = 64'd3;
		LW_WB = 1;
		ADDI_WB = 0;
		MOVI_WB = 0;

		#100;
		D_out_WB = 64'd1;
		ALU_out_WB = 64'd2;
		Offset_WB = 64'd3;
		LW_WB = 0;
		ADDI_WB = 1;
		MOVI_WB = 0;

		#100;
		D_out_WB = 64'd1;
		ALU_out_WB = 64'd2;
		Offset_WB = 64'd3;
		LW_WB = 0;
		ADDI_WB = 0;
		MOVI_WB = 1;

		#100;
		D_out_WB = 64'd1;
		ALU_out_WB = 64'd2;
		Offset_WB = 64'd3;
		LW_WB = 0;
		ADDI_WB = 0;
		MOVI_WB = 0;

		#100;
		$stop;

	end
      
endmodule

