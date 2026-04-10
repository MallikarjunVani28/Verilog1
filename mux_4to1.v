`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:40 04/10/2026 
// Design Name: 
// Module Name:    mux_4to1 
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
module mux_4to1(d_in,sel,y
    );
	 input [3:0] d_in;
	 input [1:0] sel;
	 output reg y;
	 always@(*)begin
	 case(sel)
	 2'b00 : y = d_in[0];
	 2'b01 : y = d_in[1];
	 2'b10 : y = d_in[2];
	 2'b11 : y = d_in[3];
	 default : y = 1'bz;
	 endcase
	 end
	 


endmodule
