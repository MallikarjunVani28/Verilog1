//write a verilog code for pipo 
module pipo #(parameter N=8)
  (input clk,rst,load,input [N-1:0] paralell_in,output reg [N-1:0] paralell_out);
  always@(posedge clk)begin
    if(rst)
      paralell_out <= 0;
    else if(load)
      paralell_out <= paralell_in;
  end
endmodule
//testbench
module tb;
  parameter N=8;
  reg clk = 0;
  reg rst;
  reg load;
  reg [N-1:0] paralell_in;
  wire [N-1:0] paralell_out;
  
  pipo #(N) dut(clk,rst,load,paralell_in,paralell_out);
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  initial begin
    rst = 1;
    #10;
    rst = 0;
    paralell_in = 8'b10101010;
    load = 1;
    
    #10;
    load = 0;
    #100;
    $finish;
  end
  
  initial 
    $monitor("paralell_in = %b paralell_out = %b",paralell_in,paralell_out);
endmodule
