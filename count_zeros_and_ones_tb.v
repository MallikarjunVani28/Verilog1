module count_zeros_and_ones_tb;
reg [99:0]x;
wire [6:0] ones;
wire [6:0] zeros;
count_zeros_and_ones dut(x,ones,zeros);
initial begin
x = 100'b101010101010101010101011011011;
#10;
x = 100'hfffffffffff;
#100;
$finish;
end
initial 
$monitor("x = %b ones = %d zeros = %d",x,ones,zeros);
endmodule
