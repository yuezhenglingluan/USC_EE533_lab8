`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:46:54 03/02/2025
// Design Name:   D_MEM
// Module Name:   E:/Documents and Settings/student/EE533_Lab7/D_MEM_tb.v
// Project Name:  EE533_Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_MEM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module D_MEM_tb;

	// Inputs
	reg [7:0] addra;
	reg [7:0] addrb;
	reg clka;
	reg clkb;
	reg [63:0] dina;
	reg wea;

	// Outputs
	wire [63:0] doutb;

	// Instantiate the Unit Under Test (UUT)
	D_MEM uut (
		.addra(addra), 
		.addrb(addrb), 
		.clka(clka), 
		.clkb(clkb), 
		.dina(dina), 
		.doutb(doutb), 
		.wea(wea)
	);

	always #50 clka = ~clka;
	always #50 clkb = ~clkb;

	initial begin
		addra = 8'd255;
		addrb = 8'd255;
		clka = 1;
		clkb = 1;
		dina = 0;
		wea = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clka);
		addra = 8'd0;
		addrb = 8'd0;

		@(posedge clka);
		addra = 8'd1;
		addrb = 8'd1;

		@(posedge clka);
		addra = 8'd2;
		addrb = 8'd2;

		@(posedge clka);
		addra = 8'd3;
		addrb = 8'd3;

		@(posedge clka);
		addra = 8'd4;
		addrb = 8'd4;

		@(posedge clka);
		addra = 8'd5;
		addrb = 8'd5;

		@(posedge clka);
		addra = 8'd6;
		addrb = 8'd6;

		@(posedge clka);
		addra = 8'd7;
		addrb = 8'd7;

		@(posedge clka);
		addra = 8'd8;
		addrb = 8'd8;

		@(posedge clka);
		addra = 8'd9;
		addrb = 8'd9;

		@(posedge clka);

		@(posedge clka);
		$stop;

	end
      
endmodule

