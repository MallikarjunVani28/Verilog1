// random fsm 
module fsm(input clk,rst,i,output  q);
  parameter S0 = 1'b0;
  parameter S1 = 1'b1;
  reg ps,ns;
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else
      ps<=ns;
  end
  always@(*)begin
    ns = S0;
    case(ps)
      1'b0 : ns = (i == 1)?S1:S0;
      1'b1 : ns = (i == 1)?S0:S1;
    endcase
  end
  assign q = (ps == S1)?1'b1:1'b0;
endmodule
