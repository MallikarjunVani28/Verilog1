/*Design an OR gate using only half adders. Write the RTL using
structural modelling and TB for the same.*/
module half_adder(input a,b,output sum,carry);
  assign sum = a^b;
  assign carry = a & b;
endmodule

module or_gate_using_half_adder(input a,b,output y);
  wire w1,w2,w3,w4;
  half_adder in1(a,b,w1,w2);
  half_adder in2(w1,w2,w3,w4);
  
  assign y = w3;
endmodule

//testbench
module tb;
  reg a,b;
  wire y;
  or_gate_using_half_adder dut (a,b,y);
  integer i;
  
  initial begin
    for(i=0;i<4;i=i+1)
    
    begin
      {a,b}= i;
    #10;
    end
  end
    initial begin
      #100;
      $finish;
    end
    
    initial 
      $monitor("a=%b b=%b,y=%b",a,b,y);
    endmodule
    
  
  
