/*Design a counter that has following specifications
Specifications:
Count Sequence : 75,98,75,98
Constraint: Only one flip flop allowed*/


module count_75_98(input clk,rst,output reg [7:0] out);
  reg a;
  always@(posedge clk)
    begin
      if(rst)
        a<= 0;
      else
       
          a <=~a;
    end
  always@(*)begin
    case(a)
      1'b0:out = 8'd75;
      1'b1:out = 8'd98;
    endcase
  end
endmodule

          
