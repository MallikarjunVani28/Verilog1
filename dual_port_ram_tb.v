`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:35 04/21/2026
// Design Name:   dual_por_ram
// Module Name:   /home/mallikarjun/Desktop/verilog_lab5/dual_port_ram_tb.v
// Project Name:  verilog_lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dual_por_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dual_port_ram_tb;

	// Inputs
	reg clk;
	reg rst;
	reg we;
	reg re;
	reg [3:0] w_addr_in;
	reg [7:0] w_data;
	reg [3:0] r_addr_in;

	// Outputs
	wire [7:0] r_data;

	// Instantiate the Unit Under Test (UUT)
	dual_por_ram uut (
		.clk(clk), 
		.rst(rst), 
		.we(we), 
		.re(re), 
		.w_addr_in(w_addr_in), 
		.w_data(w_data), 
		.r_addr_in(r_addr_in), 
		.r_data(r_data)
	);
	always #5 clk = ~clk;
	
	task initialize;
	{clk,rst,we,re,w_addr_in,r_addr_in,w_data} = 0;
	endtask
	
	task rst_dut;
	begin
	@(negedge clk)
	rst = 1;
	@(negedge clk )
	rst = 0;
	end
	endtask
	
	task write_mem( input [3:0] addr,input [7:0] data);
	begin
	@(negedge clk)
	we = 1;
	w_addr_in = addr;
	w_data = data;
	@(posedge clk)
	we = 0;
	end
	endtask
	
	task read_mem(input [3:0] addr);
	begin
	@(negedge clk)
	re = 1;
	r_addr_in = addr;
	@(posedge clk)
	re = 0;
	@(posedge clk)
	$display("read addr = %b data = %b ",addr,r_data);
	
	end
	endtask
	
	initial begin
	
	initialize;
	rst_dut;
	write_mem(4'd5,8'hAA);
	write_mem(4'd3,8'h55);
	
	
	read_mem(4'd5);
	read_mem(4'd3);
	#20;
	$finish;
	end
	
	
	
	

	
endmodule

