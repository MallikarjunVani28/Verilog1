/*Write an RTL code to generate 40 MHz with a 40% duty cycle, 20 MHz
with a 20% duty cycle and 20 MHz with a 40% duty cycle from the
100Mhz input clock signal. Verify the design by driving a 100MHz clock
signal*/
module clk_divider(input clk,rst,output clk_40_40,clk_20_20,clk_20_40);
  reg [2:0] count;
  reg a1,a2,a3;
  always@(posedge clk)begin
    if(rst)
      count<=0;
    else if(count == 4)
      count <= 0;
    else
      count <= count + 1'b1;
  end
  
  always@(posedge clk)begin
    if(count == 0)
      a1 <= 1;
    else
      a1 <= 0;
  end
  
  always@(posedge clk)begin
    if(count == 0 || count == 1)
      a2 <= 1;
  else 
    a2<=0;
  end
  
  always @(negedge clk )begin
    if(count == 3)
      a3 = 1;
    else
      a3 = 0;
  end
  
  assign clk_40_40 = a1 | a3;
  assign clk_20_40 = a2;
  assign clk_20_20 = a1;
endmodule
//testbench
module tb;
  reg clk,rst;
  wire clk_40_40,clk_20_20,clk_20_40;
  
  clk_divider dut(clk,rst,clk_40_40,clk_20_20,clk_20_40);
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    
  end
  initial begin
    rst = 1;
    #10;
    rst = 0;
  end
  initial begin
    #300;
    $finish;
  end
  
endmodule


  
    
  
