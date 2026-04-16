/*RTL for a BCD to Excess 3 code converter using 4 to 10
decoder with active high outputs and a minimum number of basic
gate primitive*/
module decoder_4to10(input [3:0] i,output reg [9:0] y);
  always@(*)begin
    case(i)
      4'b0000 : y = 10'b0000000001;
      4'b0001 : y = 10'b0000000010;
      4'b0010 : y = 10'b0000000100;
      4'b0011 : y = 10'b0000001000;
      4'b0100 : y = 10'b0000010000;
      4'b0101 : y = 10'b0000100000;
      4'b0110 : y = 10'b0001000000;
      4'b0111 : y = 10'b0010000000;
      4'b1000 : y = 10'b0100000000;
      4'b1001 : y = 10'b1000000000;
      default : y = 10'b0000000000;
    endcase
  end
endmodule

module ex_3(input [3:0] B,output [3:0] y);
  wire [9:0] w;
  decoder_4to10 d1(B,w);
  or (y[0],w[0],w[2],w[4],w[6],w[8]);
  or (y[1],w[0],w[3],w[4],w[7],w[8]);
  or (y[2],w[1],w[2],w[3],w[4],w[9]);
  or (y[3],w[5],w[6],w[7],w[8],w[9]);
endmodule

//testbench
module tb;
  reg [3:0]B;
  wire [3:0] y;
  ex_3 dut(B,y);
  integer i;
  initial begin
    for(i=0;i<10;i=i+1)begin
      B = i;
    #10;
    end
  end
  initial
    $monitor("B = %b Y = %b",B,y);
endmodule

  
  
  
