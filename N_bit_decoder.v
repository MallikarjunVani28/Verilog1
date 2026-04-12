// verilog code for N-bit decoder 
module decoder #(parameter N=3)(input [N-1:0] a,output reg [2**N-1:0]y);
  always@(*)begin
    y=0;
    y[a]=1'b1;
  end
endmodule

//testbench
module tb;
  parameter N = 3;
  reg [N-1:0] a;
  wire [2**N-1:0] y;
  decoder dut(a,y);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  initial begin
     a = 3'b000; #10;
    a = 3'b001; #10;
    a = 3'b010; #10;
    a = 3'b011; #10;
    a = 3'b100; #10;
    a = 3'b101; #10;
    a = 3'b110; #10;
    a = 3'b111; #10;
  end
  initial  
    $monitor("a = %b y=%b",a,y);
  initial begin
    #100;
    $finish;
  end
endmodule
