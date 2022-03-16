module lab1(
	input SMA_CLKIN,
	input [3:0] KEY,
	input CLOCK_50,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2,
	output reg [6:0] HEX3,
	output reg [6:0] HEX4,
	output reg [6:0] HEX5,
	output reg [6:0] HEX6,
	output reg [6:0] HEX7
);
	wire reset = KEY[0];
	
	wire oneHz;
	mod_1sec(CLOCK_50,reset,oneHz);
	
	

endmodule