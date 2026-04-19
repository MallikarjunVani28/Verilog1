/*(Question)Write a Verilog Code for Vending Machine that can take only two types of
coins of denomination 1 and 2 in any order. It delivers only one product
that is priced Rs. 4. On receiving Rs. 4 the product is delivered by asserting
an output X=1 which otherwise remains 0 and extra coin will not be
returned. if no coin is dropped for 6 second then design internally reset
back to initial reset state. There are two sensors to sense the denomination
of the coins that give binary output as shown in the following table. The
clock frequency is 1Khz.
i j coin
0 x No coin
1 0 1Rs
1 1 2Rs
*/


module vending_machine(input clk,rst,input [1:0] coin,output reg x);
parameter IDLE = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;
reg  soft_rst;
reg [1:0] ps,ns;
reg [9:0] count_clk;
reg [2:0] count_sec;
always @(posedge clk or posedge rst)begin
if(rst)
count_clk<=0;
else begin
if ((coin[1]==1'b0)&&((ps==S1)||(ps==S2)||(ps==S3)))begin 
count_clk <= count_clk+1'b1;

end
else 
count_clk <= 0;
end
end
//logic for the counter that countes the secs
always @(posedge clk  or posedge rst)
begin 
if(rst)
begin 
count_sec <= 3'b000;
soft_rst <= 1'b0;
end
else begin 
if(coin[1] != 1'b0)begin
count_sec <= 3'b000;
soft_rst <= 1'b0;
end
else begin
if(count_clk == 1023)
begin
if(count_sec == 5)
soft_rst <= 1'b1;
end
else
begin
soft_rst <= 1'b0;
count_sec <= count_sec +1'b1;

end


end
end
end

//present state logic
always@(posedge clk or posedge rst)begin
if(rst)
ps <= IDLE;
else if(soft_rst)
ps <= IDLE;
else
ps <= ns;

end

//ns logic 
always @(*)begin 
case(ps)
IDLE : if(coin == 2'b10)
ns = S1;
else if(coin == 2'b11)
ns = S2;
else
ns = IDLE;
S1: if(coin == 2'b10) 
ns = S2;
else if(coin == 2'b11)
ns = S3;
else
ns = S1;
S2 : if(coin == 2'b10)
ns = S3;
else if(coin == 2'b11)
ns = IDLE;
else
ns = S2;
S3 : if(coin == 2'b10 || coin == 2'b11)
ns = IDLE;
else
ns = S3;
endcase

end
//output logic 
always @(posedge clk or posedge rst)
begin 
if(rst)
x<=1'b0;
else if(soft_rst)
x<=1'b0;
else
begin 
case(ps)
IDLE,S1 : x<=1'b0;
S2 : if(coin == 2'b11)
x<=1'b1;
else 
x<= 1'b0;
S3 : if((coin == 2'b10)||(coin == 2'b11))
x<=1'b1;
else
x<=1'b0;
endcase

end

end

endmodule












