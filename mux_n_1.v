module mux #(parameter N=3,
            parameter M = 2**N)
  (input [M-1:0] din,
   input [N-1:0] sel,
   output reg y);
  integer i;
  
  always @(*)begin
    for(i = 0;i<2**N;i=i+1)begin
      if(sel==i)
        y = din[sel];
      
        end
        end
endmodule

        
  
