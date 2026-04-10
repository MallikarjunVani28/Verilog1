`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:29 04/10/2026
// Design Name:   mux_4to1
// Module Name:   /home/mallikarjun/Desktop/verilog_lab3/mux_2to1_tb.v
// Project Name:  verilog_lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_4to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_2to1_tb;

	// Inputs
	reg [3:0] d_in;
	reg [1:0] sel;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mux_4to1 uut (
		.d_in(d_in), 
		.sel(sel), 
		.y(y)
	);

	task initialize;
	begin
	{d_in,sel}=0;
	end
	endtask
	
	task stimulus(input [3:0] i,input [1:0]j);
	begin
	#10;
	d_in = i;
	sel = j;
	end
	endtask
	
	initial begin
	initialize;
	stimulus(4'd5,2'd2);
	stimulus(4'd15,2'd3);
	stimulus(4'd6,2'd1);
	end
	
	
	
endmodule

