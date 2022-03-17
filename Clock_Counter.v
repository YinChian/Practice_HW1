`timescale 1ns/1ns

module Clock_Counter(
	input CLOCK_50,
	input reset,
	input oneHz,
	input testSignal,
	output reg [31:0] result,
	output tick
);
	
	wire [31:0] buffer;
	reg add;
	
	//Send out the Data from buffer[31:0]
	always@(posedge CLOCK_50,negedge reset)begin
		if(!reset) result <=#1 32'd0;
		else if(oneHz) result <=#1 buffer;
		else result <=#1 result;
	end
	
	
	//BCD_Counter Generate
	wire [8:0] carry;
	assign carry[0] = testSignal;	//Set the first carryin as signal input
	wire [8:0] returns;
	
	genvar i;
	generate 
		for(i = 0 ; i <= 7 ; i = i + 1)begin :Generate_BCD_Counters
			bcd_counter instances(CLOCK_50,reset,oneHz,carry[i],buffer[4*i+:4],carry[i+1],returns[i]);
		end
	endgenerate
	
	assign tick = result[0];
	
endmodule