//fsm for detecting 101 non overlapping sequence
module fsm_101(input clk,rst,din,output y);
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  reg [1:0]ps,ns;
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else 
      ps <= ns;
  end
  always@(*)begin
    case(ps)
      2'b00 : ns = din?S1:S0;
      2'b01 : ns = din?S1:S2;
      2'b10 : ns = din?S3:S0;
      2'b11 : ns = S0;
    endcase
    end
  
    assign y = (ps == S3)?1'b1:1'b0;
    endmodule
    
    
