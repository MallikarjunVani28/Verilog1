`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:52:42 04/18/2026
// Design Name:   s_r_latch
// Module Name:   /home/mallikarjun/Desktop/veriloglab4/sr_latch_tb.v
// Project Name:  veriloglab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: s_r_latch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sr_latch_tb;

	// Inputs
	reg s;
	reg r;

	// Outputs
	wire q;
	wire q_bar;

	// Instantiate the Unit Under Test (UUT)
	s_r_latch uut (
		.s(s), 
		.r(r), 
		.q(q), 
		.q_bar(q_bar)
	);
	task initialize;
	begin
	{s,r}=0;
	end
	endtask
	
	task inputs(input a,b);
	begin
	s = a;
	r = b;
	#10;
	end
	endtask
	
	initial begin
	initialize;
	inputs(0,0);
	inputs(0,1);
	inputs(1,0);
	inputs(0,0);
	inputs(1,1);
	end
	
	initial 
	$monitor("s = %b r = %b q =%b q_bar = %b",s,r,q,q_bar);
	
	

	
	
      
endmodule

