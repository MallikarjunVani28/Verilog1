/*There are three sensors attached to a printing device, with three
alarms attached to the sensors. The first sensor, "A," detects if the
device needs ink. The second sensor, "B," detects if the device needs
repair. The third sensor, "C," detects if the device is jammed.
If the device jams or needs repair, alarm A sounds. If the device jams
or is short on ink, alarm B sounds. If two or more problems occur at
once, alarm C sounds.
Write RTL code using behaviour abstraction for the above problem
statement and verify the design using TB*/

module printer(input a,b,c,output reg a1,a2,a3);
  always@(*)begin
    case({a,b,c})
      3'b000 : {a1,a2,a3} = 3'b000;
      3'b001 : {a1,a2,a3} = 3'b110;
      3'b010 : {a1,a2,a3} = 3'b100;
      3'b011 : {a1,a2,a3} = 3'b111;
      3'b100 : {a1,a2,a3} = 3'b010;
      3'b101 : {a1,a2,a3} = 3'b111;
      3'b110 : {a1,a2,a3} = 3'b111;
      3'b111 : {a1,a2,a3} = 3'b111;
    endcase
  end
endmodule

//test bench
module tb;
  reg a,b,c;
  wire a1,a2,a3;
  
  printer dut(a,b,c,a1,a2,a3);
  
  integer i;
  
  initial begin
    for(i=0;i<8;i=i+1)begin
    {a,b,c} = i;
    #10;
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
    
  
  initial 
    $monitor("a=%b b=%b c=%b a1=%b a2=%b a3=%b",a,b,c,a1,a2,a3);
  initial begin
    #300;
    $finish;
  end
  
endmodule


// https://www.edaplayground.com/x/qCL4
