// verilog code for multiple frequency divisions 


module multiple_freq_div(input clk,rst,input [1:0] mode,output reg f_2, f_4,f_8, f_16);
  reg [3:0] counter;
  
  always@(posedge clk)
    begin
      if(rst)
        counter<=0;
      else
        counter<=counter+1'b1;
    end
  always@(posedge clk)begin
    case(mode)
      2'b00 : f_2 <= counter[0];
      2'b01 : f_4 <= counter[1];
      2'b10 : f_8 <= counter[2];
      2'b11 : f_16 <= counter[3];
      default : begin
        f_2 <= 0;
        f_4 <=0;
        f_8 <= 0;
        f_16 <= 0;
      end
    endcase
  end
endmodule

//testbench

 module tb;
  reg clk;
  reg rst;
  reg [1:0] mode;
  wire f_2,f_4,f_8,f_16;
  multiple_freq_div dut(clk,rst,mode,f_2,f_4,f_8,f_16);
  always #5  clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    
    clk = 0;
  end
  initial begin
    rst = 1;
    #10;
    rst = 0;
    mode = 00;
    #100;
    mode = 01;
    #100;
    mode = 10;
    #100;
    mode = 11;
    #1000;
    $finish;
  end
  initial 
    $monitor("mode = %b f_2=%b f_4=%b f_8=%b f_16=%b",mode,f_2,f_4,f_8,f_16);
  
endmodule

    
  
