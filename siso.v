`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:36 04/18/2026 
// Design Name: 
// Module Name:    siso 
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
module siso(clk,rst,s_in,s_out
    );
	 input clk,rst;
	 input s_in;
	 output reg s_out;
	reg [3:0] w;
	always @(posedge clk)begin
	if(rst)
	w <= 4'b0000;
	else begin
	w <= {w[2:0],s_in};
	s_out <= w[3];
	end
	 end


endmodule
