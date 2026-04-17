//bcd adder 

module four_bit_adder(input [3:0]a,b,output reg [3:0]sum,output reg cout);
  always@(*)begin
    {cout,sum}=a+b;
  end
  
endmodule
module bcd_adder(input [3:0]a,b,output [3:0] sum,output cout);
  wire [3:0] w;
  wire c1,o1,o2,o3;
  wire c2;
  four_bit_adder in1(a,b,w,c1);
  and (o1,w[3],w[2]);
  and (o2,w[3],w[1]);
  or (o3,c1,o1,o2);
  four_bit_adder in2(w,{1'b0,o3,o3,1'b0},sum[3:0],c2);
  assign cout = o3;
endmodule

// testbench 
module tb;
  reg [3:0] a,b;
  wire [3:0] sum;
  wire cout;
  bcd_adder dut(a,b,sum,cout);
  integer i,j;
 initial begin
   for(i=0;i<256;i=i+1)begin
     for(j=0;j<256;j=j+1)begin
       b=j;
       a=i;
   
     #5;
     end
     
   end
   #600;
   $finish;
 end
  initial 
    $monitor("a=%b b=%b sum = %b cout = %b",a,b,sum,cout);
endmodule

  
