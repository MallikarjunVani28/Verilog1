// mod-8 johnson counter
module sipo(input clk, rst,input si,output reg [3:0]po);
  always@(posedge clk)begin
    if(rst)
      po<=4'b0000;
    else
      po<= {si,po[3:1]};
  end
endmodule
module johnson_counter(input clk,rst,output [3:0]q);
  wire [3:0] w;
  wire w1;
  sipo in1(clk,rst,w1,w);
  assign w1 = ~w[0];
  assign q = w;
endmodule

//testbench 
module tb;
  reg clk=0;
  reg rst;
  wire [3:0]q;
  johnson_counter dut(clk,rst,q);
  always #5 clk = ~clk;
  initial begin
    rst = 1;
    #10;
    rst = 0;
    #200;
    $finish;
  end
  initial 
    $monitor("time=%t q=%b",$time,q);
  
endmodule

