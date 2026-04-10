`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:22 04/10/2026
// Design Name:   alu
// Module Name:   /home/mallikarjun/Desktop/verilog_lab2/alu_tb.v
// Project Name:  verilog_lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [3:0] command;
	reg enable;

	// Outputs
	wire [15:0] out;
	integer m,n,o;
	parameter ADD = 4'b0000;
	 parameter INC = 4'b0001;
	 parameter SUB = 4'b0010;
	 parameter DEC = 4'b0011;
	 parameter MUL = 4'b0100;
	 parameter DIV = 4'b0101;
	 parameter SHL = 4'b0110;
	 parameter SHR = 4'b0111;
	 parameter AND = 4'b1000;
	 parameter OR = 4'b1001;
	 parameter INV = 4'b1010;
	 parameter NAND = 4'b1011;
	 parameter NOR = 4'b1100;
	 parameter XOR = 4'b1101;
	 parameter XNOR = 4'b1110;
	 parameter BUFF = 4'b1111;
	 reg [4*8:0] string_cmd;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		a,b,command,enable,out
	);

	task initialize;
	begin
	{a,b,command,enable} = 0;
	end
	endtask
	task en_oe(input i);
	begin
	enable = i;
	end
	endtask
	
	task inputs(input [7:0] j,k);
	begin
	a=j;
	b=k;
	end
	endtask
	
	task cmd(input [3:0] l);
	begin
	command = l;
	end
	endtask
	
	task delay();
	begin
	#10;
	end
	endtask
	always@(command)begin
	case(command)
	ADD : string_cmd = "ADD";
	INC : string_cmd = "INC";
	SUB : string_cmd = "SUB";
	DEC : string_cmd = "DEC";
	MUL : string_cmd = "MUL";
	DIV : string_cmd = "DIV";
	SHL : string_cmd = "SHL";
	SHR : string_cmd = "SHR";
	AND : string_cmd = "AND";
	OR : string_cmd = "OR";
	INV : string_cmd = "INV";
	NAND : string_cmd = "NAND";
	NOR : string_cmd = "NOR";
	XOR : string_cmd = "XOR";
	XNOR : string_cmd = "XNOR";
	BUFF : string_cmd = "BUFF";
	endcase
	end
	initial begin
	initialize;
	en_oe(1'b1);
	for(m=0;m<16;m=m+1)
	begin
	for(n=0;n<16;n=n+1)
	begin
	inputs(m,n);
	for(o=0;o<16;o=o+1)begin
	command = o;
	delay;
	end
	end
	end
	en_oe(0);
	inputs(8'd20,8'd10);
	cmd(ADD);
	delay;
	en_oe(1);
	inputs(8'd25,8'd17);
	cmd(ADD);
	delay;
	$finish;
	end
	initial 
	$monitor("input oe = %b a = %b b =%b command=%s output = %b",enable,a,b,string_cmd,out);
	endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	