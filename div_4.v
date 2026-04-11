//Verilog module that checks if a number is divisible by 4 using bitwise operators.

module div_4(input [7:0] num,output div_4);
assign div_4 = ~(num[0]) & ~(num[1]);
endmodule

//testbench 
module tb;
  reg [7:0] num;
  wire div_4;
  div_4 dut(num,div_4);
  initial begin
    num = 8'd20;
    #10;
    num = 8'd22;
    #10;
    num = 8'd24;
    #10;
    num = 8'd16;
  end
  initial 
    $monitor("num = %b div_4 = %b",num,div_4);
  initial begin
    #100;
    $finish;
  end
endmodule
