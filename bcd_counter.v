`timescale 1ns/1ns

module bcd_counter(
	input gclk,
	input reset,
	input oneHz,
	input add, 
	output reg [3:0] now,
	output reg carry,
	output tick
);
	
	//the real enable signal
	//wire tick; 
	//input signal negative edge detector
	edge_detect falling_edge(gclk,reset,add,,tick);
	
	
	always@(posedge gclk,negedge reset)begin
		//Reset
		if(!reset ) now <= 4'h0;
		//1Sec counter
		else if(oneHz) now <= 4'h0;
		//Signal INPUT
		else if(tick)begin
			if(now == 4'h9) now <= 4'h0;	//Just a classic BCD counter
			else now <= now + 4'h1;
		end 
		else begin
			//Do Nothing
			now <= now;
		end
	end
	
	//Carry Output
	always@(*)begin
		if(now == 4'h9) carry = 1'b1;
		else carry = 1'b0;
	end
	
endmodule