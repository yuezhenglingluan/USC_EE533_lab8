`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:37:55 03/02/2025
// Design Name:   I_MEM
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/I_MEM_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: I_MEM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module I_MEM_tb;

	// Inputs
	reg [8:0] addra;
	reg [8:0] addrb;
	reg clka;
	reg clkb;
	reg [31:0] dinb;
	reg web;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	I_MEM uut (
		.addra(addra), 
		.addrb(addrb), 
		.clka(clka), 
		.clkb(clkb), 
		.dinb(dinb), 
		.douta(douta), 
		.web(web)
	);

	always #50 clka = ~clka;
	always #50 clkb = ~clkb;

	initial begin
		// Initialize Inputs
		addra = 0;
		addrb = 0;
		clka = 1;
		clkb = 1;
		dinb = 0;
		web = 0;

		// Wait 100 ns for global reset to finish
		@(posedge clka);

        
		// Add stimulus here
		@(posedge clka);
		addra = 1;

		@(posedge clka);
		addra = 2;

		@(posedge clka);
		addra = 3;

		@(posedge clka);
		addra = 4;

		@(posedge clka);
		addra = 5;

		@(posedge clka);
		addra = 6;

		@(posedge clka);
		addra = 7;

		@(posedge clka);
		$stop;

	end
      
endmodule

