`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:36 04/21/2026
// Design Name:   RAM
// Module Name:   /home/mallikarjun/Desktop/verilog_lab5/RAM_tb.v
// Project Name:  verilog_lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RAM_tb;

	// Inputs
	reg we;
	reg enable_in;

	// Bidirs
   reg [3:0] addr_in;
	wire [7:0] data;
	reg [7:0] tempd;
	integer l;
	

	// Instantiate the Unit Under Test (UUT)
	RAM uut (
		.we(we), 
		.enable_in(enable_in), 
		.addr_in(addr_in), 
		.data(data)
	);
	assign data = (we && !enable_in)?tempd:8'hzz;

	task initialize();
	begin
	we = 1'b0;
	enable_in = 1'b0;
	addr_in = 4'b0000;
	end
	endtask
	task stimulus(input [3:0] i,input [7:0] j);
	begin
	addr_in = i;
	tempd = j;
	end
	endtask
	
	
	task write();
	begin
	we = 1'b1;
	enable_in = 1'b0;
	end
	endtask
	
	task read();
	begin
	we = 1'b0;
	enable_in = 1'b1;
	end
	endtask
	
	task delay();
	begin
	#10;
	end
	endtask
	
	initial  begin
	initialize;
	delay;
	write;
	for(l=0;l<16;l=l+1)
	begin
	stimulus(l,l);
	delay;
	end
	initialize;
	delay;
	read;
	for(l = 0;l<16;l=l+1)
	begin
	stimulus(l,l);
	delay;
	end
	$finish;
	end
	initial 
	$monitor("values of addr = %b and data = %b",addr_in,data);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
      
endmodule

