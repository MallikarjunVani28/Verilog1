`timescale 1ns / 1ps
module fifo(input clk,rst,
input read_n,
input write_n,
input [7:0] data_in,
output reg [7:0] data_out,
output wire full,
output wire empty,
output wire [4:0] fifo_count
    );
	 parameter DEPTH = 16;
	 parameter ADDR_WIDTH = 4;
	 integer i;
	 reg [7:0] mem [0:DEPTH-1];//memory declaration
	 reg [ADDR_WIDTH-1:0] wr_addr = 0;
	 reg [ADDR_WIDTH-1:0] rd_addr = 0;
	 reg [ADDR_WIDTH:0] fifo_count_reg=0;
	 
	 // write operation
	 always@(posedge clk)begin
	 if(!rst)begin
	 for(i=0;i<16;i=i+1)begin
	 mem[i] <= 0;
	 wr_addr <= 0;
	 end
	 end
	 else if(write_n & !full)begin
	 mem[wr_addr] <= data_in;
	 wr_addr <= wr_addr+1'b1;
	 end
	 end
	 
	 //read operation
	 
	 always@(posedge clk)begin
	 if(!rst)begin
	 rd_addr <= 0;
	 data_out <= 8'd0;
	 end
	 else if(read_n & !empty)begin
	 data_out <= mem[rd_addr];
	 rd_addr <= rd_addr + 1'b1;
	 end
	 end
	 
	 always@(posedge clk)begin
	 if(!rst)begin
	 fifo_count_reg <=0;
	 end
	 else begin
	 case({write_n & !full ,read_n & !empty})
	 2'b10 : fifo_count_reg <= fifo_count_reg +1'b1;//only write operation and no read operation
	 
	 2'b01 : fifo_count_reg <= fifo_count_reg - 1'b1;//only read operation and no write operation
	 default : fifo_count_reg <= fifo_count_reg;
	 endcase
	 end
	 end
	 
	 assign fifo_count = fifo_count_reg;
	 assign full = (fifo_count_reg == DEPTH);
	 assign empty = (fifo_count_reg ==0);
	 
	 endmodule
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 

