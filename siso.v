`timescale 1ns / 1ps
module siso(clk,rst,sin,sout
    );
	 input clk,rst;
	 input sin;
	 output reg sout;
	 
	 reg [3:0] shift_reg;
	 
	 always@(posedge clk)begin
	 if(rst)
	 begin
	 shift_reg <= 0;
	 sout <= 0;
	 end
	 
	 else begin
	 shift_reg <= {shift_reg[2:0],sin};
	 sout <= shift_reg[3];
	 end
	 end
endmodule
