`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:03 04/17/2026 
// Design Name: 
// Module Name:    mod12_counter 
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
module mod12_counter(clk,rst,load,data_in,count
    );
	 input clk;
	 input rst;
	 input load;
	 input [3:0] data_in;
	 output reg [3:0] count;
	 always@(posedge clk)begin
	 if(rst)
	 count <= 4'b0000;
	 else if(count > 4'd11)
	 count <= 4'b0000;
	 else if(load)
	 count <= data_in;
	 else
	 count <= count +1'b1;
	 end
	 
	 
	 


endmodule
