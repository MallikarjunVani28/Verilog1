/*Design an FSM that acts as a 3bit parity generator. For every 3 bits
observed on the input ′w′ during 3 consecutive cycles, the FSM generates
the parity z=1 if and only if the no. of 1s is odd*/


module fsm(input clk,rst,input w,output x);
  parameter IDLE = 4'b0000;
  parameter S0 = 4'b0001;
  parameter S1 = 4'b0010;
  parameter S00 = 4'b0011;
  parameter S01 = 4'b0100;
  parameter S10 = 4'b0101;
  parameter S11 = 4'b0110;
  parameter S001 = 4'b0111;
  parameter S010 = 4'b1000;
  parameter S100= 4'b1001;
  parameter S111= 4'b1010;
  
  reg [3:0] ps,ns;
  
  always@(posedge clk)
    begin 
      if(rst)
        ps <= IDLE;
      else 
        ps<=ns;
    end
  always@(*)begin
    case(ps)
      4'b0000 : ns = w?S1:S0;
      4'b0001 : ns = w ?S01 :S00;
      4'b0010 : ns = w?S11:S10;
      4'b0011 : ns = w?S001:S00;
      4'b0100 : ns = w?S11:S010;
      4'b0101 : ns = w?S01:S100;
      4'b0110 : ns = w?S111:S10;
      4'b0111 : ns = w?S11 : S010;
      4'b1000 : ns = w?S01:S100;
      4'b1001 : ns = w?S001:S00;
      4'b1010 : ns = w?S111:S10;
      default : ns= IDLE;
    endcase
  end
  
  assign x = (ps == S001 || ps ==S010 || ps == S100 || ps == S111)?1'b1:1'b0;
endmodule

//testbench
module tb;
  reg clk,rst;
  reg w;
  wire x;
  
  fsm dut(clk,rst,w,x);
  always #5 clk = ~clk;
  
 task initialize;
   begin
   {clk,rst,w}=0;
   end
 endtask
  task rst_dut;
    begin
      @(negedge clk)
      rst = 1;
      @(negedge clk)
      rst = 0;
    end
  endtask
  
  task ip(input a);
    begin
      w = a;
      #15;
    end
  endtask
  
  initial begin
    initialize;
    rst_dut;
    ip(1);
    ip(0);
    ip(1);
    ip(1);
   
    ip(0);
    ip(0);
    ip(1);
    ip(1);
    
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    
              
    #300;
    $finish;
  end
  initial 
    $monitor ("w = %b x = %b",w,x);
endmodule
  
    
    
      
  
