//frequency division by 6 with 50% duty cycle
module frequency_div(input clk,rst,output clk_out);
  reg [2:0] count;
  reg a1,a2;
  always@(posedge clk)begin
    if(rst)
      count <= 3'b000;
    else if(count == 3'd5)
      count <= 3'b000;
    else
      count <= count +1'b1;
  end
  
  always@(posedge clk)begin
    if(count == 0 || count == 1 || count == 2)
      a1 <= 1;
    else
      a1 <= 0;
  end
  
  always@(negedge clk)begin
    if(count == 1 || count == 2 )
      a2 <= 1;
    else
      a2 <= 0;
  end
  assign clk_out = a1|a2;
endmodule

  
 
