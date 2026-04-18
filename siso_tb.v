`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:45:49 04/18/2026
// Design Name:   siso
// Module Name:   /home/mallikarjun/Desktop/veriloglab4/siso_tb.v
// Project Name:  veriloglab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: siso
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module siso_tb;

	// Inputs
	reg clk;
	reg rst;
	reg s_in;

	// Outputs
	wire s_out;

	// Instantiate the Unit Under Test (UUT)
	siso uut (
		.clk(clk), 
		.rst(rst), 
		.s_in(s_in), 
		.s_out(s_out)
	);
	always #5 clk = ~clk;
	task initialize;
	begin
	{clk,rst,s_in} = 0;
	end
	endtask
	
	task rst_dut;
	begin
	@(negedge clk)
	rst = 1;
	@(negedge clk);
	rst = 0;
	end
	endtask
	
	task inputs(input a);
	begin
	s_in = a;
	#10;
	end
	endtask
	
	initial begin
	initialize;
	rst_dut;
	inputs(1);
	inputs(1);
	inputs(0);
	inputs(1);
	end
	
	initial  
	$monitor("s_in = %b s_out = %b",s_in,s_out);
	
	

	


      
endmodule

