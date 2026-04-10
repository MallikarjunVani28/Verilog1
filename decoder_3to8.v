`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:51 04/10/2026 
// Design Name: 
// Module Name:    decoder_3to8 
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
module decoder_3to8(a,y
    );
	 input [2:0] a;
	 output reg [7:0] y;
	 always@(*)begin
	 case(a)
	 3'b000 : y = 8'h00;
	 3'b001 : y = 8'h01;
	 3'b010 : y = 8'b00000100;
	 3'b011 : y = 8'b00001000;
	 3'b100 : y = 8'b00010000;
	 3'b101 : y = 8'b00100000;
	 3'b110 : y = 8'b01000000;
	 3'b111 : y = 8'b10000000;
	 default : y = 8'h00;
	 endcase
	 end
	 


endmodule
