// RTL code to check the two 4bit numbers are equal or not using 1 bit comparator
module comparator(input a,b,output e);
  assign e = ~(a ^ b);
endmodule
module comparator_4bit(input [3:0] a,b,output e);
  wire [3:0] w;
  comparator c1(a[0],b[0],w[0]);
  comparator c2(a[1],b[1],w[1]);
  comparator c3(a[2],b[2],w[2]);
  comparator c4(a[3],b[3],w[3]);
  and (e,w[0],w[1],w[2],w[3]);
endmodule


//testbench 
module tb;
  reg [3:0]a,b;
  wire e;
  comparator_4bit dut (a,b,e);
  initial begin
    a = 4'b1000;
    b = 4'b1010;
    #10;
    a = 4'b1010;
    b = 4'b1010;
    #100;
    $finish;
  end
  initial 
    $monitor("a = %b b = %b e = %b",a,b,e);
endmodule
