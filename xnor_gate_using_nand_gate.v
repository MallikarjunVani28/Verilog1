module nand_gate(input a,b,output y);
  assign y = ~(a & b);
endmodule

module xnor_gate_using_nand_gate(input a,b,output y);
  wire w1,w2,w3,w4,w5;
  
  nand_gate in1(a,b,w2);
  nand_gate in2(a,w2,w1);
  nand_gate in3(w2,b,w3);
  nand_gate in4(w1,w3,w4);
  nand_gate in5(w4,w4,w5);
  
  assign y = w5;
endmodule

//testbench
module tb;
  reg a,b;
  wire y;
  xnor_gate_using_nand_gate dut (a,b,y);
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
    
  
