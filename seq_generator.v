//Write an RTL code that generates the following sequence: 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9.
module seq_generator(input clk,rst,output reg [3:0] out);
  reg [3:0] val;
  reg [3:0] cnt;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      val <= 1;
      cnt <= 0;
      out <= 1;
    end
    else begin
      out <= val;
      if(cnt == val-1)begin
        cnt <= 0;
        if(val == 9)
          val<=1;
        else
           val <= val+1;
       
      
      end
      else begin
        cnt <= cnt+1'b1;
      end
    end
  end
    endmodule
      //test bench

module tb;
  reg clk = 0;
  reg rst;
  wire [3:0] out;
  
 seq_generator dut(clk,rst,out);
  
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
    #600;
    $finish;
  end
  
  initial
    $monitor("%0t\t%b\t%b\t%0d", $time, clk, rst, out);
endmodule
    
