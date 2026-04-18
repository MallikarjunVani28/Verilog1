//write Verilog code to generate any 5 real number between 1.000 to 2.000

module tb;
  real num;
  integer i;
  initial begin
    for(i= 0;i<5;i=i+1)begin
      num = 1.0+($urandom_range(0,999)/1000.0);
      $display("random real number %0d= %0.3f",i,num);
    end
  end
endmodule
        
