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
	mod_1sec u1(CLOCK_50,reset,oneHz);
	
	
	wire [31:0] result;
	Clock_Counter u3(CLOCK_50,reset,oneHz,SMA_CLKIN,result);
	
	wire [55:0] out = {HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0};
	
	genvar i;
	generate
		for(i = 0 ; i < 8 ; i = i + 1)begin : digits
			SEG_HEX digit(result[i*4+:4],out[i*7+:7]);
		end
	endgenerate

endmodule