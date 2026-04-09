//verilog code for frequency division by 2.5
module freq_div(input clk,rst,output clk_out);
  reg [2:0] count;
  reg a1,a2;
  always@(posedge clk)begin
    if(rst)
      count<=0;
    else if(count==4)
      count<=0;
    else
      count<=count+1'b1;
  end
  always@(posedge clk)begin
    if(count == 1|| count == 0)
      a1=1;
    else
      a1=0;
  end
  always @(negedge clk)begin
    if(count==3 || count==4)
      a2=1;
    else
      a2=0;
  end
  assign clk_out= a1|a2;
endmodule

    
