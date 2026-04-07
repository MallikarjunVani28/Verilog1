//verilog code for frequency division by 6.5
module freq_div(input clk, rst,output clk_out);
  reg [4:0] count;
  reg a1,a2;
  always @(posedge clk)begin
    if(rst)begin
      count<=0;
    end
    else if(count == 10)
            count<=0;
    else
      count<=count+1'b1;
  end
  always@(posedge clk)begin
    if(count==0 || count ==1 || count == 2 || count == 3)
      a1 <= 1;
    else
      a1 <= 0;
  end
  always@(negedge clk)begin
    if(count == 5 || count == 6 || count == 7 || count == 8)
      a2 <= 1;
    else
      a2 <= 0;
  end
  assign clk_out = a1|a2;
endmodule

//testbench
module tb;
  reg clk = 0;
  reg rst;
  wire clk_out;
  freq_div dut(clk,rst,ck_out);
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  initial begin
    rst = 1;
    #10;
    rst = 0;
    #200;
    $finish;
  end
endmodule



    
    
  
