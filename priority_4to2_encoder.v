//4 to 2 prority encoder using ternary operator


module priority_4to2_encoder(input [3:0] a,output [1:0] b,output v);
  assign b = a[3]?2'b11:a[2]?2'b10:a[1]?2'b01:a[0]?2'b00:2'b00;
  
  assign v = a[0] | a[1] | a[2] | a[3];
  
endmodule


// testbench

module tb;
  reg [3:0] a;
  wire [1:0] b;
  wire v;
  priority_4to2_encoder dut(a,b,v);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  initial begin
    a = 4'b0000;
    #10;
    a = 4'b0001;
    #10;
    a = 4'b0010;
    #10;
    a = 4'b1010;
    #10;
    a = 4'b1010;
  end
  initial
    $monitor("a = %b b = %b v = %b",a,b,v);
  initial begin
    #100;
    $finish;
  end
endmodule

    
