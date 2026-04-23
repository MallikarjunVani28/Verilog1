`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:00:50 04/23/2026
// Design Name:   dual_port_ram_8x16
// Module Name:   /home/mallikarjun/Desktop/verilog_lab5/dual_port_ram_8x16_tb.v
// Project Name:  verilog_lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dual_port_ram_8x16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dual_port_ram_8x16_tb;

	// Inputs
	reg clk;
	reg rst;
	reg we;
	reg [2:0] waddr;
	reg [15:0] wdata;
	reg [2:0] raddr;

	// Outputs
	wire [15:0] rdata;

	// Instantiate the Unit Under Test (UUT)
	dual_port_ram_8x16 uut (
		.clk(clk), 
		.rst(rst), 
		.we(we), 
		.waddr(waddr), 
		.wdata(wdata), 
		.raddr(raddr), 
		.rdata(rdata)
	);

	always #5 clk = ~clk;
	task write_mem (input [2:0] addr,input [15:0] data);
	begin
	@(posedge clk);
	we = 1;
	waddr = addr;
	wdata = data;
	@(posedge clk);
	we = 0;
	end
	endtask
	
	
	task read_mem(input [2:0] addr);
	begin
	
	raddr = addr;
	#1;
	$display("addr = %d data = %h",addr,rdata);
	end
	endtask
	
	
	task write_read_same(input [2:0] addr,input [15:0] data);
	begin
	@(posedge clk);
	we = 1;
	waddr = addr;
	wdata = data;
	raddr = addr;
	#1;
	$display("addr = %d data = %h",addr,data);
	@(posedge clk);
	we = 0;
	end
	endtask
	
	initial begin
	clk = 0;
	waddr = 0;
	wdata = 0;
	raddr = 0;
	
	//write operation
	
	write_mem(3'd0,16'h1A1A);
	write_mem(3'd1,16'hB2B2);
	write_mem(3'd2,16'hC3C3);
	
	//read operation
	
	read_mem(3'd0);
	read_mem(3'd1);
	read_mem(3'd2);
	
	//simulataneous read and write operation
	
	@(posedge clk);
	we = 1;
	waddr = 3'd3;
	wdata = 16'hD4D4;
	raddr = 3'd0;
	#1;
	$display("addr = %d data = %h",raddr,wdata);
	@(posedge clk);
	we = 0;
	
	
	write_read_same(3'd4,16'hE5E5);
	
	read_mem(3'd3);
	read_mem(3'd4);
	
	#20;
	$finish;
	
	

	end
	
	
	
      
endmodule

