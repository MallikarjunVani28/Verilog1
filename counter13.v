module counter_13(input clk,rst,up_down,output reg [3:0] count);
  always @(posedge clk)begin
    if(rst )
      count <= 4'b0000;
   
    
    else if(up_down)begin
      if(count==4'd13)
      count <= 4'b0000;
      else
      count <= count + 1'b1;
    end
      else if(!up_down)begin
        if(count == 4'd0)
      count <= 4'd13;
        else
      count <= count - 1'b1;
      end
  end
endmodule

  
