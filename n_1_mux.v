//RTL code for [n:1] Multiplexer
module n_1_mux(din,sel,dout);
  parameter N = 4;
  parameter M = 2**N;
  
  input [M-1:0] din;
  input [N-1:0] sel;
  output reg dout;
  integer i;
  always @(*)begin
    for(i=0;i<=2**N;i=i+1)begin
      if(sel == i)
        dout = din[sel];
      end
  end
endmodule

//testbench
module tb;
  parameter N = 4;
  parameter M = 2**N;
  reg [M-1:0] din;
  reg [N-1:0] sel;
  wire dout;
  
  n_1_mux dut(din,sel,dout);
  initial begin
    {din,sel}= 0;
  end
  initial begin
    sel = 4'b0001;
    din = 16'h1234;
    #10;
    sel = 4'b0010;
    #10;
    sel = 4'b0011;
    #10;
    sel = 4'b0100;
    #10;
    sel = 4'b1001;
    #100;
    $finish;
  end
  initial 
    $monitor("din =%b sel = %d dout = %b ",din,sel,dout);
endmodule

    
