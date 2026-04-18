`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:21:04 04/17/2026
// Design Name:   mod12_counter
// Module Name:   /home/mallikarjun/Desktop/veriloglab4/mod12_counter_tb.v
// Project Name:  veriloglab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mod12_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mod12_counter_tb;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg [3:0] data_in;

	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	mod12_counter uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.data_in(data_in), 
		.count(count)
	);
	always #5 clk = ~clk;
	

	initial begin
	clk = 0;
	end
	
	task initialize;
	begin
	{clk ,rst,load,data_in} = 0;
	end
	endtask
	task rst_dut;
	begin
	@(negedge clk);
	rst = 1;
	@(negedge clk);
	rst = 0;
	end
	endtask
	
	task load_t(input a,input [3:0] d);
	begin
	@(negedge clk)
	load = a;
	data_in = d;
	end
	endtask
	
	initial begin
	rst_dut;
	load_t(1'b1,4'd13);
	load_t(1'b0,4'd13);
	end
	initial 
	$monitor("load = %b data_in  = %d count = %d",load,data_in,count);
	
	
	
	
	
endmodule

