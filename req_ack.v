/*Write a Verilog RTL code for the given specification
• Once the input "req" is detected at posedge of clock, the output
"ack" signal gets high after 5 clock cycles.
• In between 5 cycles, if input "req" is again asserted, then "ack"
signal is ignored*/

module req_ack(input clk ,rst,req,output reg ack);
  reg [2:0] count;
  reg busy;
  always@(posedge clk)begin
    if(rst)
      begin
        ack<=0;
        count<=0;
        busy<=0;
      end
    else begin
      ack<=0;
      if(req & !busy)
        begin
          count<=0;
          busy <=1;
        end
      else if(count == 4)begin
        count<=0;
        ack <= 1;
        busy<=0;
      end
      else if(busy)
        count<=count+1'b1;
    end
  end
endmodule


//testbench 
module tb;
  reg clk =0 ;
  reg rst;
  reg req;
  wire ack;
  
  req_ack dut(clk,rst,req,ack);
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    rst = 1;
    #10;
    rst = 0;
    req = 1;
    #40;
    req= 0;
    #100;
    req=1;
    #300;
    $finish;
  end
endmodule
    
              
  
  
    
