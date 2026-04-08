// full_sub using half substractor
module half_sub(input a,b,output diff,borrow);
  assign diff = a^b;
  assign borrow = ~a & b;
endmodule
module full_sub(input a,b,c,output diff,borrow);
  wire w1,w2,w3,w4;
  half_sub in1 (a,b,w1,w2);
  half_sub in2 (w1,c,w3,w4);
  assign borrow = w2 | w4;
  assign diff = w3;
endmodule

//testbench
module tb;
  reg a,b,c;
  wire diff,borrow;
  full_sub in1 (a,b,c,diff,borrow);
  integer i;
  initial begin
    for(i=0;i<8;i=i+1)begin
    {a,b,c}=i;
    #10;
  end
    $finish;
  end
  initial 
    $monitor("a=%b b=%b c=%b diff=%b borrow=%b",a,b,c,diff,borrow);
endmodule

    
    
      
    
