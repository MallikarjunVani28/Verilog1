//write a verilog code for piso 
module piso #(parameter N = 8)
  (input clk,rst,load,input [N-1:0] parallel_in,output reg s_out);
  reg [N-1:0] shift_reg;
  always@(posedge clk)begin
    if(rst)
      begin
        shift_reg <=0;
        s_out <=0;
      end
    else if(load)
      shift_reg <= parallel_in;
    else
      begin
        s_out <= shift_reg[N-1];
        shift_reg <= {shift_reg[N-2:0],1'b0};
      end
  end
endmodule

//testbench
module tb;
  parameter N =8;
  reg clk = 0;
  reg rst ;
  reg load;
  reg [N-1:0] parallel_in;
  wire s_out;
  
  piso #(N) dut (clk,rst,load,parallel_in,s_out);
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  initial begin
    rst = 1;
    load = 0;
    #10;
    rst = 0;
    parallel_in = 8'b10101010;
    #10
    load = 1;
    #10;
  
    load = 0;
    
    #500;
   $finish;
  end
  initial 
    $monitor("parallel_in = %b s_out = %b",parallel_in,s_out);
endmodule

  

  
