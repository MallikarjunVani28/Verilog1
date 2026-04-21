`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:48 04/21/2026 
// Design Name: 
// Module Name:    RAM 
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
module RAM(we,enable_in,addr_in,data
    );
	 input we,enable_in;
	 input [3:0]addr_in;
	 inout [7:0] data;
	 
	 reg [7:0] mem [15:0];
	 
	 always @(we,enable_in,addr_in,data)
	 if(we && !enable_in)
	 mem[addr_in] = data;
	 
	 assign data = (enable_in && !we)?mem[addr_in]:8'hzz;
	
	 


endmodule
