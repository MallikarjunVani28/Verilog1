// 1 to 8 demux using the shift register
module demux_1to8(input [7:0] in ,input [2:0] sel ,output [7:0] y);
  assign y = in << sel;
endmodule



// testbench
module tb;
  reg [7:0]in;
  reg [2:0] sel;
  wire [7:0] y;
  demux_1to8 dut(in,sel,y);
  initial begin
    in = 8'h01;
    sel = 3'b000;
    
    #10;
    sel = 3'b001;
    #10;
    sel = 3'b010;
    #10;
    sel=3'b011;
    #10;
    sel = 3'b100;
    #10;
    sel = 3'b101;
    #10;
    sel = 3'b110;
    #10;
    sel = 3'b111;
  end
    
  initial  
    $monitor("in = %b sel=%b y = %b",in,sel,y);
  initial begin
    #100;
    $finish;
  end
endmodule
