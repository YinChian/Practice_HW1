module lab1(
	input SMA_CLKIN,
	input [3:0] KEY,
	input CLOCK_50,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output oneHz
);
	wire reset = KEY[0];
	
	
	//wire oneHz;
	mod_1sec u1(CLOCK_50,reset,oneHz);
	
	
	wire [31:0] result;
	Clock_Counter u3(CLOCK_50,reset,oneHz,SMA_CLKIN,result);
	
	SEG_HEX digit0(result[3 :0 ],HEX0);
	SEG_HEX digit1(result[7 :4 ],HEX1);
	SEG_HEX digit2(result[11:8 ],HEX2);
	SEG_HEX digit3(result[15:12],HEX3);
	SEG_HEX digit4(result[19:16],HEX4);
	SEG_HEX digit5(result[23:20],HEX5);
	SEG_HEX digit6(result[27:24],HEX6);
	SEG_HEX digit7(result[31:28],HEX7);
	

endmodule