//verilog code for generating the random odd numbers between 0 - 10 
module tb;
  integer a;
  initial begin
    repeat(5)
      begin
        a = (2*({$random}%5))+1'b1;
        $display ("odd number = %d",a);
      end
  end
  
  
    endmodule
    
    
