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
	
	
	wire [8:0] carry;
	assign carry[0] = testSignal;
	
	genvar i;
	generate 
		for(i = 0 ; i <= 7 ; i = i + 1)begin :Generate_BCD_Counters
			bcd_counter instances(CLOCK_50,reset,oneHz,carry[i],buffer[4*i+:4],carry[i+1]);
		end
	endgenerate
	
endmodule