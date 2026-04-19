

module ring_counter_using_2bit_counter_decoder_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	ring_counter_using_2bit_counter_decoder uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);
always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
	end
	initial begin
	rst = 1;
	#10;
	rst = 0;
	#200;
	$finish;
	end
	initial 
	$monitor("out = %b",out);
	
      
endmodule

