//Design a counter that will count at every alternative posedge of the clk
module counter(input clk,rst,output reg [3:0] count);
  reg a;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        a<=1'b0;
      else
        a<=~a;
    end
  always@(posedge clk or posedge rst)begin
    if(rst)
      count<=0;
    else if(a)
      count<=count+1'b1;
  end
endmodule

  //testbench    
module tb;
  reg clk = 0;
  reg rst;
  wire [3:0] count;
  
  counter dut(clk,rst,count);
  
  always #5 clk = ~clk;
  
  
  task rst_dut;
    begin
    @(negedge clk)
    rst = 1;
    @(negedge clk)
    rst = 0;
    end
  endtask
  initial begin
    rst_dut;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  
  initial begin
    #200;
    $finish;
  end
  
  initial
    $monitor("count = %d",count);
endmodule
