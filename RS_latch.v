// RS_latch using the gate levelmodelling
module RS_latch(input S,R,output Q,Qb);
  nand (Q,S,Qb);
  nand (Qb,R,Q);
endmodule
// testbench 
module tb;
  reg S,R;
  wire Q,Qb;
  RS_latch dut (S,R,Q,Qb);
  initial begin
    S = 0;
    R = 1;
    #10;
    S = 1;
    R = 1;
    #10;
    S = 1;
    R = 0;
    #10;
    S = 0;
    R = 0;
  end
  initial 
    $monitor("S = %b R = %b Q=%b Qb = %b",S,R,Q,Qb);
  initial begin
    #100;
    $finish;
  end
endmodule


