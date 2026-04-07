/// RTL code for a BCD counter that displays time in a 24hr format
as shown here HH:MM:SS with the following specification details:
I. Input Clock Frequency is 1Hz
II. Inputs: clock (posedge ), reset(Active high synchronous)
III. Outputs: ms_hr<3:0>, ls_hr<3:0>, ms_min<3:0>, ls_min<3:0>,
ms_sec<3:0>, ls_sec<3:0>

// Code your design here
module time_count(input clk,rst,output reg[3:0] ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
  always@(posedge clk)begin
    if(rst)
    {ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec} <= 0;
    else
      begin
        ls_sec <= ls_sec +1'b1;
        if(ls_sec == 4'd9)begin
          ls_sec <= 0;
          ms_sec <= ms_sec +1'b1;
          if(ms_sec == 4'd5)begin
            if(ls_sec == 4'd9)begin
            ms_sec<=0;
            ls_sec<=0;
              ls_min <= ls_min +1'b1;
              if(ls_min == 4'd9)begin
                ls_min <=0;
                ms_min<=ms_min+1'b1;
                if(ms_min == 4'd5)begin
                  if(ls_min == 4'd9)begin
                    ls_min <= 0;
                    ms_min<=0;
                    ms_sec<=0;
                    ls_sec<=0;
                    ls_hr<=ls_hr+1'b1;
                    if(ls_hr == 4'd9)begin
                      ls_hr<=0;
                      ms_hr <= ms_hr+1'b1;
                    end
                    if(ms_hr == 4'd2 && ls_hr==4'd4)begin
                      {ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec} <= 0;
                    end
                  end
                  
                    
                end
              end
            end
          end
        end
        
      end
  end
endmodule


module tb;
  reg clk = 0;
  reg rst;
  wire [3:0] ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec;
  time_count dut(clk,rst, ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
  always #5 clk = ~clk;
  initial begin
    rst = 1;
    #10;
    rst = 0;
    #(25*60*60);
    $finish;
  end
  initial 
    $monitor("%d %d : %d %d : %d %d", ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
endmodule

    
