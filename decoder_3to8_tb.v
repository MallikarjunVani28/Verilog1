`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:38:30 04/10/2026
// Design Name:   decoder_3to8
// Module Name:   /home/mallikarjun/Desktop/verilog_lab3/decoder_3to8_tb.v
// Project Name:  verilog_lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder_3to8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_3to8_tb;

	// Inputs
	reg [2:0] a;

	// Outputs
	wire [7:0] y;

	// Instantiate the Unit Under Test (UUT)
	decoder_3to8 uut (
		.a(a), 
		.y(y)
	);
	task initialize;
	begin
	a = 0;
	end
	endtask
	task stimulus(input [2:0]i);
	begin
	#10;
	a = i;
	end
	endtask
	initial begin
	initialize;
	stimulus(3'd0);
	stimulus(3'd1);
	stimulus(3'd2);
	stimulus(3'd3);
	stimulus(3'd4);
	stimulus(3'd5);
	stimulus(3'd6);
	end
	initial
	$monitor("a = %d y = %b",a,y);
	initial begin
	#200;
	$finish;
	end
	
	

      
endmodule

