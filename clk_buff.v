`timescale 1ns / 1ps

module clk_buff(input mclk,output bclk
    );
	 buf buff(bclk,mclk);


endmodule
