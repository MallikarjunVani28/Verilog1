/*Design 10:1 mux using minimum number of 4:1 mux only.
a. Write an RTL and task-based test-bench for the same.*/
module mux_4to1(input [3:0] i,input [1:0] sel,output reg y);
  always @(*)begin
    case(sel)
      2'b00 : y = i[0];
      2'b01 : y = i[1];
      2'b10 : y = i[2];
      2'b11 : y = i[3];
    endcase
  end
endmodule
module mux_10to1(input [9:0] i,input [3:0] sel,output y);
  wire w1,w2;
  mux_4to1 in1 (i[3:0],sel[1:0],w1);
  mux_4to1 in2 (i[7:4],sel[1:0],w2);
  assign y = (sel < 4)  ? w1 :
             (sel < 8)  ? w2 :
             (sel == 8) ? i[8] :
             (sel == 9) ? i[9] : 1'bx;
endmodule

//testbench
module tb;
  reg [9:0]i;
  reg [3:0] s;
  wire y;
  mux_10to1 in1(i,s,y);
  task apply_input;
    input [9:0] data;
    input [3:0] sel;
    begin
      i = data;
      s = sel;
      #5;
      $display("i = %b s = %b y = %b",i,s,y);
               
               
    end
  endtask
  integer k;
  initial begin
    i =10'b1010010101;
    s =0;
    for(k=0;k<16;k=k+1)
      apply_input (i,k);
 

    #20;
  $finish;
  end
endmodule

    
