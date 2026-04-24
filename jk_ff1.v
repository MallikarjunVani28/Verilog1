/*Write RTL code for designing a JK flip-flop with active high synchronous
reset. The actual output logic “q” should be delayed by 2 clock cycles?*/

module jk_ff(input clk,rst,j,k,output reg q,output q1);

  reg t1,t2;
  always@(posedge clk)begin
    if(rst)
      t1<=0;
    else
      begin
        case({j,k})
          2'b00 : t1 <= t1;
          2'b01 : t1 <= 0;
          2'b10  : t1 <= 1;
          2'b11 : t1 <= ~t1;
        endcase
      end
  end
  always @(posedge clk)begin
    if(rst)begin
      t2<=0;
      q<=0;
    end
    else begin
      t2<=t1;
      q <= t2;
    end
  end
  
    assign q1 =~q;
endmodule


//testbench
module tb;
  reg clk =0;
  reg rst;
  reg j,k;
  wire q,q1;
  
  jk_ff dut(clk,rst,j,k,q,q1);
  
  always#5 clk = ~clk;
  
  initial begin
    rst = 1;
    #10;
    rst = 0;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  integer i;
  initial begin
    for(i=0;i<4;i=i+1)begin
      {j,k} = i;
      #30;
    end
  end
  initial begin
    #300;
    $finish;
  end
  initial
    $monitor("j = %b k =%b q = %b q1 = %b",j,k,q,q1);
endmodule

     
    
    
           
           
           
           
           
           
           
           
           
    
    
