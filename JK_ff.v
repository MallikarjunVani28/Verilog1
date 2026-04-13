//Jk_ff using parameter
module Jk_ff(input clk,rst,j,k,output reg Q);
  parameter HOLD = 2'b00;
  parameter RESET = 2'b01;
  parameter SET = 2'b10;
  parameter TOGGLE = 2'b11;
  always @(posedge clk)begin
    case({j,k})
      HOLD  : Q <= Q;
      RESET : Q <= 0;
      SET   : Q <= 1;
      TOGGLE : Q <= ~Q;
    endcase 
  end
endmodule
module tb;
  reg clk = 0;
  reg rst;
  reg j,k;
  wire Q;
  Jk_ff dut(clk,rst,j,k,Q);
  always #10 clk = ~clk;
  integer i;
  initial begin
    rst = 1;
    #10;
    rst = 0;
  end
  
  initial begin
    for(i=0;i<4;i=i+1)begin
      {j,k}=i;
    #10;
    end
  end
  initial 
    $monitor("j=%b k=%b q=%b",j,k,Q);
  initial begin
    #100;
    $finish;
  end
endmodule

    
        
