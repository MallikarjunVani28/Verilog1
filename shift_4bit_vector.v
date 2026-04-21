/*Design a circuit that can shift a 4 bit vector W = w3w2w1w0 1 bit position to right when
a control signal Shift is equal to 1. Let the output of circuit be 4 bit vector Y = y3y2y1y0
and a signal k such that if Shift = 1 then y3 = 0, y2 = w3, y1 = w2, y0 = w1 and k = w0, if
Shift = 0 Y = W and k = 0*/
module mux_2to1(input a,b,sel,output y);
  assign y = (sel == 1)?a:b;
endmodule
module shift_4bit_vector(input [3:0]w ,input shift,output [3:0] y,output k);
 
  mux_2to1 in1 (0,w[3],shift,y[3]);
  mux_2to1 in2(w[3],w[2],shift,y[2]);
  mux_2to1 in3 (w[2],w[1],shift,y[1]);
  mux_2to1 in4 (w[1],w[0],shift,y[0]);
  mux_2to1 in5 (w[0],0,shift,k);
endmodule
