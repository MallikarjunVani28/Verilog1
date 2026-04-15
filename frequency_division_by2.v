// frequency division by 2 with 25% duty cycle
module frequency_division(input clk,rst, output reg clk_out);
  reg toggle;
  always@(posedge clk)begin
    if(rst)
      toggle <= 0;
    else
      toggle <= ~toggle;
  end
  always@(posedge clk or negedge clk)begin
    if(rst)
      clk_out<=0;
    else begin
    if(toggle == 1 && clk == 1)
    clk_out<=1;
    else
      clk_out <=0;
    end
  end
endmodule

module tb;

  reg clk = 0;
  reg rst;
  wire clk_out;

  frequency_division dut(clk, rst, clk_out);

 
  always #5 clk = ~clk;

  initial begin
   
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    
    rst = 1;
    #10;
    rst = 0;

   
    #200;
    $finish;
  end

  
endmodule


