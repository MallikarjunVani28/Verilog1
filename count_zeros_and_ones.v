module count_zeros_and_ones(input [99:0] x,output reg [6:0] ones,output reg [6:0] zeros);
integer i;
always @(*) begin
ones = 0;
zeros = 0;
for(i = 0;i<100;i=i+1)begin

if(x[i] == 1'b1)
begin
ones = ones +1'b1;
end
else 
zeros = zeros +1'b1 ;
end
end
endmodule

