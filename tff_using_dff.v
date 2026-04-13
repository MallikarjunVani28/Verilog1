//Tff using Dff 
module tff_using_dff(input clk,rst,T,output reg Q);
 
  always@(posedge clk)begin
    if(rst)
      Q<=0;
    else
      Q <= Q ^ T;
  end
endmodule

/testbench
module tb;
  reg clk,rst,T;
  wire Q;
  tff_using_dff dut (clk,rst,T,Q);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
    
    
  initial begin
    rst = 1;
    clk = 0;
    #10;
    rst = 0;
  end
  always #5 clk = ~clk;
  initial begin
    T = 0;
    #10;
    T = 1;
    
    
    
    #100;
    $finish;
  end
endmodule



  
