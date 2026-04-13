//Create a Verilog module that swaps the two bytes of a 16-bit word. The upper byte (bits 15 down to 8) exchanges positions with the lower byte (bits 7 down to 0). 
module swap_bytes(
    input [15:0] in,
    output [15:0] out
);
    
    assign out = {in[7:0],in[15:8]};
   
endmodule
