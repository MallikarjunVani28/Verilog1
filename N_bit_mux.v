// verilog code for  N-bit mux
module N_bit_mux #(parameter N = 4)
  (input [N-1:0] a,b,
   input sel ,
   output [N-1:0] y);
  assign y = sel ? b : a;
endmodule

//test bench
module tb;
  parameter N = 4;
  reg [N-1:0] a,b;
  reg sel;
  wire [N-1:0]y;
  N_bit_mux  dut(a,b,sel,y);
  initial begin
    a = 4'b1000;
    b = 4'b1010;
    #10;
    sel = 0;
    #10 ;
    sel = 1;
  end
  initial 
    $monitor("a=%b b = %b sel =%b y = %b",a,b,sel,y);
endmodule
    
