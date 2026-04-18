// verilog code for  frequency division by 6 with 25% dutycycle

module frequency_div(input clk,rst,output clk_out);
  reg [2:0] count;
  reg a1,a2;
  always@(posedge clk)begin
    if(rst)
      count <= 3'b000;
    else if(count == 3'd5)
      count <= 3'b000;
    else
      count <= count +1'b1;
  end
  
  always@(posedge clk)begin
    if(count == 0)
      a1 <= 1;
    else
      a1 <= 0;
  end
  
  always@(negedge clk)begin
    if(count == 1)
      a2 <= 1;
    else
      a2 <= 0;
  end
  assign clk_out = a1|a2;
endmodule


//testbench

module tb;

  reg clk, rst;
  wire clk_out;


  frequency_div dut (.clk(clk), .rst(rst), .clk_out(clk_out));

 
  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    
    
    
    clk = 0;
    rst = 1;

  
    #10 rst = 0;

   
    #100;

    $finish;
  end
  
