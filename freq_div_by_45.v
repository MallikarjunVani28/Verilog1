//verilog code for  frequency division by 4.5 
module freq_div(input clk,rst,output clk_out);
  reg [3:0] count;
  reg a1,a2;
  always @(posedge clk)
    begin
      if(rst)
        count <= 0;
      else if(count == 8)
        count<=0;
      else
        count <= count+1'b1;
    end
  always@(posedge clk)begin
    if(count==0||count==1)
      a1<=1;
    else 
      a1<=0;
  end
  always@(negedge clk)
    begin
      if(count == 5 || count == 6)
        a2 <= 1;
      else
        a2 <= 0;
    end
  assign clk_out = a1||a2;
endmodule

//test bench
module  tb;
  reg clk,rst;
  wire clk_out;
  freq_div dut(clk,rst,clk_out);
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    
    clk = 0;
    rst = 1;
  end
  initial begin
   rst = 1;
    #10;
    rst = 0 ;
    #200;
    $finish;
  end
endmodule
  

  
      
