// Write an RTL code for mod13 up/down counter 
module up_down_counter(input clk,rst,input up_down ,output reg [3:0]count);
  always@(posedge clk)
    begin 
      if(rst)
        count <= 4'b0000;
      else if (up_down) begin
        if(count == 13)
          count <= 0;
        else
        count <= count +1'b1;
      end
      else begin
        if(count == 4'd0)
          count<= 4'd13;
        else
        count <= count - 1'b1;
      end
    end
endmodule

  // testbench
module tb;
  reg clk = 0;
  reg rst;
  reg up_down;
  wire [3:0] count;
  up_down_counter dut(clk,rst,up_down,count);
  always #5 clk = ~clk;
  initial begin
    
    rst = 1;
    #10;
    up_down = 1'b1;
    rst = 0;
    #200;
    up_down = 1'b0;
    #500;
    $finish;
  end
  initial
    $monitor ("up_down = %d count = %d",up_down,count);
endmodule  
