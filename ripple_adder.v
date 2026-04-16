//RTL code to design a 32bit Ripple carry adder using Full adders

module full_adder(input a,b,cin,output sum,carry);
  assign sum = a^b^cin;
  assign carry = a&b |  b&cin | cin&a ;
endmodule

module ripple_adder(input [31:0] a,b,input cin,output [31:0] sum,output carry);
  wire [32:0] c;
  genvar i;
  generate
    for(i=0;i<32;i=i+1)
      begin:cc1
        full_adder in1(a[i],b[i],c[i],sum[i],c[i+1]);
      end
  endgenerate
  assign c[0] = cin;
  assign carry = c[31];
endmodule


//testbench

module tb;
  reg [31:0] a,b;
  reg cin;
  wire [31:0] sum;
  wire carry;
  
  ripplle_adder in1(a,b,cin,sum,carry);
  
  task inputs(input [31:0] x,y,input z);
    begin
    a = x;
    b = y;
    cin = z;
    #10;
    end
  endtask
    
    initial begin
      inputs(32'd100,32'd121,0);
      inputs(32'd123,32'd150,1);
      inputs(32'd125,32'd104,0);
      inputs (32'd400,32'd500,0);
      inputs(32'hffffffff,32'h1,0);
    end
    initial 
      $monitor("a = %b b=%b cin = %b sum = %b carry = %b",a,b,cin,sum,carry);
    
    endmodule
    
  
  
 
  
    
