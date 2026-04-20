/*Design a FSM with input as a bit stream, and o/p which goes 1 whenever the number
received so far is divisible by 3*/
module divisible_by_3(input clk,rst,in,output  out);
  parameter R0 = 2'b00;
  parameter R1 = 2'b01;
  parameter R2 = 2'b10;
  reg [1:0] ps ,ns;
  
  always@(posedge clk)begin
    if(rst)
      ps<=R0;
    else
      ps<=ns;
  end
  always@(*)begin
    case(ps)
      2'b00 : ns = (in == 1)?R1:R0;
      2'b01 : ns = (in == 1)?R0:R2;
      2'b10 : ns = (in == 1)?R2 : R1;
      default : ns = R0;
    endcase
  end
  assign out = (ps == R0 )?1'b1:1'b0;
endmodule
  
