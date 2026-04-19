`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:39 04/19/2026 
// Design Name: 
// Module Name:    ring_counter_using_2bit_counter_decoder 
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
module ring_counter_using_2bit_counter_decoder(clk,rst,out
    );
	 input clk,rst;
	 output [3:0] out ;
	 
	 wire [1:0]q;
	 counter_2bit in1(clk,rst,q);
	 decoder_2to4 in2(q,out);
	 


endmodule
module counter_2bit(input clk,rst,output reg  [1:0] count);
always@(posedge clk or posedge rst)begin
if(rst)
count <= 0;
else
count <= count +1'b1;
end
endmodule

module decoder_2to4(input [1:0] in,output reg[3:0] out);
always@(*)begin
case(in)
2'b00 : out = 4'b0001;
2'b01 : out = 4'b0010;
2'b10 : out = 4'b0100;
2'b11 : out = 4'b1000;
endcase
end
endmodule




