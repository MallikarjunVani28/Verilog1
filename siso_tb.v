`timescale 1ns / 1ps


module siso_tb;

	// Inputs
	reg clk;
	reg rst;
	reg sin;

	// Outputs
	wire sout;

	// Instantiate the Unit Under Test (UUT)
	siso uut (
		.clk(clk), 
		.rst(rst), 
		.sin(sin), 
		.sout(sout)
	);
	always #5 clk = ~clk;

	task initialize;
	begin
	
	clk = 0;
	rst = 0;
	end
	endtask
	
	task rst_dut;
	begin
	
	rst = 1;
	#10;
	rst = 0;
	end
	endtask
	
	task inputs(input a);
	begin
	
	sin = a;
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
	initial begin
	#100;
	$finish;
	end
	
	initial 
	$monitor("sin = %b sout = %b",sin,sout);
	
	
	
      
endmodule

