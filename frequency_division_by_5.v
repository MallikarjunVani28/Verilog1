//verilog code for frequency division by 5 with 50% duty cycle
module frequency_div_5(input clk,rst,output clkout);
  reg [3:0] counter1;
  reg [3:0] counter2;
  always@(posedge clk)begin
    if(rst)
      counter1<=0;
    else if(counter1==4)
      counter1<=0;
    else
      counter1 <= counter1+1'b1;
  end
  always@(negedge clk)begin
    if(rst)
      counter2<=0;
    else if(counter2==4)
      counter2<=0;
    else
      counter2<=counter2+1'b1;
  end
  assign clkout = counter1[1] | counter2[1];
endmodule
  
