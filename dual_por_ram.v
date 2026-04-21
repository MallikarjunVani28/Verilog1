`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:34 04/21/2026 
// Design Name: 
// Module Name:    dual_por_ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dual_por_ram(
    input clk,
    input rst,
    input we,
    input re,
    input [3:0] w_addr_in,
    input [7:0] w_data,
    input [3:0] r_addr_in,
    output reg [7:0] r_data
);

integer i;
reg [7:0] mem [15:0];

always @(posedge clk) begin
    if (rst) begin
        for (i = 0; i < 16; i = i + 1)
            mem[i] <= 8'b0;
    end
    else begin
        if (we)
            mem[w_addr_in] <= w_data;

        if (re)
            r_data <= mem[r_addr_in];
    end
end

endmodule