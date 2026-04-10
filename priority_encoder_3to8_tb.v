`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:56:15 04/10/2026
// Design Name:   priority_encoder_8to3
// Module Name:   /home/mallikarjun/Desktop/verilog_lab3/priority_encoder_3to8_tb.v
// Project Name:  verilog_lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priority_encoder_8to3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module priority_encoder_3to8_tb;

	// Inputs
	reg [7:0] din;

	// Outputs
	wire [2:0] y;

	// Instantiate the Unit Under Test (UUT)
	priority_encoder_8to3 uut (
		.din(din), 
		.y(y)
	);

	task initialize;
	begin
	din = 0;
	end
	endtask
	
	task stimulus(input [7:0] i);
	begin
	#10;
	din = i;
	end
	endtask
	
	initial begin
	initialize;
	stimulus(8'b00000001);
	stimulus(8'b00000011);
	stimulus(8'b00000101);
	stimulus(8'b00001010);
	stimulus(8'b00010101);
	stimulus(8'b00101010);
	stimulus(8'b01001111);
	stimulus(8'b10101011);
	end
	initial 
	$monitor("din = %b y = %b",din,y);
	initial begin
	#200;
	$finish;
	end
	
endmodule

