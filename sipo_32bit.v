/*Write RTL code to design a 32bit right shift serial - in-parallel-out register
with the
following features:
Inputs: clock (posedge triggered), clear (active high asynchronous), sin
(serial input)
Output: shift_out[31:0]*/

module sipo_32bit(input clk,clear,sin,output reg[31:0] s_out);
  always@(posedge clk or posedge clear)begin
    if(clear)
      s_out <= 32'b0;
    else
      s_out <= ({sin,s_out[31:1]});
  end
endmodule

//testbench
module tb;
  reg clk = 0;
  reg clear;
  reg sin;
  wire [31:0] s_out;
  sipo_32bit dut(clk,clear,sin,s_out);
  always #5 clk = ~clk;
  
  
  initial begin
    clk =0;
    clear = 0;
    sin= 0;
  end
  initial begin
    clear = 1;
    #10;
    clear = 0;
  end
  integer i;
  
  initial begin
    for (i=31;i>=0;i=i-1)
      begin
        sin  = i;
        #10;
      end
  end
  initial 
    $monitor("sin = %b s_out = %b",sin,s_out);
  initial begin
    #500;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
    
    
        
  
                
