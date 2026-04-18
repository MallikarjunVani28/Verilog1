//write a verilog code to generate the sequence 0,2,3,1,0
module fsm (input clk, rst, output reg [1:0] y);

  reg [1:0] state, ns;

  // state register
  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= 2'd0;
    else
      state <= ns;
  end

  // next state logic
  always @(*) begin
    case(state)
      2'd0: ns = 2'd1;
      2'd1: ns = 2'd2;
      2'd2: ns = 2'd3;
      2'd3: ns = 2'd0;
      default: ns = 2'd0;
    endcase
  end

  // output logic
  always @(*) begin
    case(state)
      2'd0: y = 2'd0;
      2'd1: y = 2'd2;
      2'd2: y = 2'd3;
      2'd3: y = 2'd1;
    endcase
  end

endmodule

//testbench logic
module tb;

  reg clk, rst;
  wire [1:0] y;


  fsm dut (.clk(clk), .rst(rst), .y(y));

 
  always #5 clk = ~clk;

  initial begin
    
    
    clk = 0;
    rst = 1;

  
    #10 rst = 0;

   
    #100;

    $finish;
  end
  initial
     $monitor("time=%0t clk=%b rst=%b y=%0d", $time, clk, rst, y);

endmodule
