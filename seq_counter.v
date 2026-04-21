/*Design a synchronous counter which counts the sequence 0, 0, 1, 1, 2, 2, 3, 3,
0, 0……………*/
module seq_counter(input clk,rst,output reg [1:0] count);
  reg a;
  always @(posedge clk)begin
    if(rst)begin
      a<=1'b0;
      count <=1'b0;
    end
    else begin
      a<=~a;
      if(a)
        begin
          if(count==3)
            count<=2'b00;
          else
            count<=count+1'b1;
          
        end
    end
  end
 
endmodule

    
    
