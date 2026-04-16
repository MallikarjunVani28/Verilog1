// universal shift register
module mux_4to1(input [3:0]i,input [1:0] sel,output reg y);
  always @(*)begin
    case(sel)
      2'b00 : y = i[0];
      2'b01 : y = i[1];
      2'b10 : y = i[2];
      2'b11 : y = i[3];
    endcase
  end
endmodule
module d_ff (input clk,rst,din,output reg q);
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        q<=din;
    end
endmodule

module universal_shift_reg(input clk,rst,input [1:0] sel,input [3:0] data_in,input shift_left_in, shift_right_in,
                           output [3:0] q);
  wire [3:0] o;
 mux_4to1 m0({data_in[0],q[1],shift_left_in,q[0]},sel,o[0]);
 mux_4to1 m1({data_in[1],q[2],q[0],q[1]},sel,o[1]);
  mux_4to1 m2({data_in[2],q[3],q[1],q[2]},sel,o[2]);
 mux_4to1 m3({data_in[3],shift_right_in,q[2],q[3]},sel,o[3]);
  
  d_ff d1(clk,rst,o[0],q[0]);
  d_ff d2(clk,rst,o[1],q[1]);
  d_ff d3(clk,rst,o[2],q[2]);
  d_ff d4(clk,rst,o[3],q[3]);
  
  
endmodule

  
  
