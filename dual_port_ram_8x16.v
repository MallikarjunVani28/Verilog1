`timescale 1ns / 1ps

module dual_port_ram_8x16(input clk,rst,input we,input [2:0] waddr,
input [15:0] wdata,
input [2:0] raddr,output [15:0] rdata
    );
	 
	 
	 reg [15:0] mem [7:0];
	 integer i;
	 
	 always@(posedge clk)begin
	 if(rst)begin
	 for(i=0;i<8;i=i+1)
	 mem[i]<= 0;
	 end
	 else
	 if(we)
	 mem[waddr] <= wdata;
	 end
	 
	 assign rdata = mem[raddr];
	 


endmodule
