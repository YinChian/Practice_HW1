`timescale 1ns/1ns

module Clock_Counter(
	input CLOCK_50,
	input reset,
	input oneHz,
	input testSignal,
	output reg [31:0] result
);
	
	wire [31:0] buffer;
	reg add;
	
	always@(posedge CLOCK_50,negedge reset)begin //result
		if(!reset) result <=#1 32'd0;
		else if(oneHz) result <=#1 buffer;
		else result <=#1 result;
	end
	
	wire toBCD;
	edge_detect detect(CLOCK_50,reset,testSignal,toBCD,);
	
	wire [8:0] carry;
	wire [8:0] s_carry;
	
	bcd_counter D0(CLOCK_50,reset,oneHz,toBCD,buffer[3:0],carry[1]);
	bcd_counter D1(CLOCK_50,reset,oneHz,carry[1],buffer[7:4],carry[2]);
	bcd_counter D2(CLOCK_50,reset,oneHz,carry[2],buffer[11:8],carry[3]);
	bcd_counter D3(CLOCK_50,reset,oneHz,carry[3],buffer[15:12],carry[4]);
	bcd_counter D4(CLOCK_50,reset,oneHz,carry[4],buffer[19:16],carry[5]);
	bcd_counter D5(CLOCK_50,reset,oneHz,carry[5],buffer[23:20],carry[6]);
	bcd_counter D6(CLOCK_50,reset,oneHz,carry[6],buffer[27:24],carry[7]);
	bcd_counter D7(CLOCK_50,reset,oneHz,carry[7],buffer[31:28],);
	
endmodule