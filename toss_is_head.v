/*Describe a finite state machine using state diagram that will detect three consecutive coin
tosses (of one coin) that results in heads. and write the verilog code for it*/

module toss_is_head(input clk,rst,in,output out);
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  reg [1:0] ps,ns;
  
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else
      ps <= ns;
  end
  
  always@(*)begin
    case(ps)
      2'b00 :ns = (in==1)?S1:S0;
      2'b01 : ns = (in == 1)?S2:S0;
      2'b10 : ns = (in == 1)?S3:S0;
      2'b11 : ns = (in == 1)?S3:S0;
    endcase
  end
  assign out = (ps == S3)?1'b1:1'b0;
endmodule
  
  
