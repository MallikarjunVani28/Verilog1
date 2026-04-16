//RTL code For a sequential Circuit to toggle 4 bit output for every 30 clk cycle
module toggle(input clk,rst,output reg Q);
  reg [4:0] count;
  always@(posedge clk)begin
    if(rst)begin
      Q<=0;
      count<=4'b0000;
    end
    else if(count == 5'd29)
      begin
        count<=5'b00000;
        Q = ~ Q;
      end
    else
      count <= count +1'b1;
  end
endmodule

//testbench
module tb;
  reg clk =0;
  reg rst;
  wire Q;
  toggle dut(clk,rst,Q);
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    
    rst = 1;
    #10;
    rst = 0;
    #800;
    $finish;
  end
endmodule
