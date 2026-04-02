`timescale 1ms/100ns
module vending_machine_tb;
reg clk ;
reg rst;
reg [1:0] coin;
wire x;
vending_machine dut(clk,rst,coin,x);
task initialize();
begin
clk = 1'b0;
coin  = 2'b00;
end
endtask
always #0.5 clk = ~clk;
task rst_dut();begin
rst = 1;
#5;
rst = 0;
end
endtask
task stimulus(input [1:0]j);
@(negedge clk)
coin = j;
endtask

initial begin
initialize();
rst_dut();
stimulus(2'b10);
stimulus(2'b10);
stimulus(2'b10);
stimulus(2'b10);
stimulus(2'b11);
stimulus(2'b11);
stimulus(2'b10);
stimulus(2'b00);
#6145;
stimulus(2'b10);
stimulus(2'b10);
stimulus(2'b10);
stimulus(2'b10);

$finish;
end
initial
$monitor("Product Delivered = %b", x);
 endmodule



