// frequency division by 2 with 50%duty cycle
module frequency_division(input clk ,rst,output reg clk_out);
 reg a;
  always@(posedge clk)begin
    if(rst)
      a <= 0;
      else 
        a<= ~a;
  end
  always@(posedge clk )begin
    if(clk & a)
      clk_out <=1;
    else
      clk_out <= 0;
  end
endmodule
