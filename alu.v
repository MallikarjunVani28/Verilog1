`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:05 04/10/2026 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(a_in,b_in,command_in,oe,d_out
    );
	 input [7:0] a_in,b_in;
	 input [3:0] command_in;
	 input oe;
	 output [15:0] d_out;
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
	 
	 reg [15:0] out;
	 
	 always @(*)begin
	 case(command_in)
	 ADD : out = a_in + b_in;
	 INC : out = a_in + 1'b1;
	 SUB : out = a_in - b_in;
	 DEC : out  = a_in -1'b1;
	 MUL : out = a_in * b_in;
	 DIV : out = a_in/b_in;
	 SHL : out = a_in<<1;
	 SHR : out = a_in>>1;
	 AND : out = a_in && b_in;
	 OR : out = a_in || b_in;
	 INV : out = ~a_in;
	 NAND : out = ~(a_in && b_in);
	 NOR : out = ~(a_in || b_in);
	 XOR : out = a_in^b_in;
	 XNOR : out = ~(a_in ^ b_in);
	 BUFF : out = a_in;
	 endcase
	 end
	 assign d_out = (oe)?out:16'hzzzz;
	 
	 


endmodule
