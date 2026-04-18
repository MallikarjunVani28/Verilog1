`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:12 04/18/2026 
// Design Name: 
// Module Name:    s_r_latch 
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
module s_r_latch(s,r,q,q_bar
    );
	 input s,r;
	 output q,q_bar;
	 
	 nor n1(q,r,q_bar);
	 nor n2(q_bar,s,q);
	 


endmodule
