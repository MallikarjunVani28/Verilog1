`timescale 1ns / 1ps
module fifo_tb;

	// Inputs
	reg clk;
	reg rst;
	reg read_n;
	reg write_n;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;
	wire full;
	wire empty;
	wire [4:0] fifo_count;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk), 
		.rst(rst), 
		.read_n(read_n), 
		.write_n(write_n), 
		.data_in(data_in), 
		.data_out(data_out), 
		.full(full), 
		.empty(empty), 
		.fifo_count(fifo_count)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		read_n = 0;
		write_n = 0;
		data_in = 0;

		
	end
	
	task reset;
	begin
	@(negedge clk);
	rst = 0;
	@(negedge clk);
	rst = 1;
	end
	endtask
	
	task write_data(input [7:0] data);
	begin
	@(negedge clk)
	data_in = data;
	write_n = 1'b1;
	read_n = 1'b0;
	@(posedge clk);
	#1;//small delay
	end
	endtask
	
	always #5 clk = ~clk;
	
	task read_data;
	begin
	@(negedge clk);
	write_n = 0;
	read_n = 1'b1;
	@(posedge clk);
	#1;//small delay
	end
	endtask
	
	task read_write(input [7:0] data);
	begin
	@(negedge clk);
	data_in = data;
	write_n = 1'b1;
	read_n = 1'b1;
	@(posedge clk);
	#1;
	end
	endtask
	
	initial begin
	reset;
	write_data (8'h12);
	write_data (8'h13);
	
	read_data;
	read_write(8'h14);
	end
	
	
	initial 
	$monitor("read_n = %b write_n =%b  data_in = %h data_out=%h full = %b empty = %b fifo_count = %b",
	read_n,write_n,data_in,data_out,empty,full,fifo_count);
	
	initial begin
	#100;
	$finish;
	end
	
	
	
	
	
	
	
      
endmodule

