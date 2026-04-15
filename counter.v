// Write an RTL code for synchronous counter for counting from 11111 to 11100
module counter(input clk,rst,output reg [4:0] dout);
  always@(posedge clk)begin
    if(rst)
      dout<=5'b11111;
    else if(dout < 5'b11100)
      dout <= 5'b11111;
    else
      dout <= dout - 1'b1;
  end
  endmodule

///testbench
module tb;
reg clk = 0;
reg rst;
wire [4:0] dout;
counter dut(clk,rst,dout);
always #5 clk = ~clk;
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);
  
  rst = 1;
  #10;
  rst = 0;
  #500;
  $finish;
end 
endmodule



  
    
