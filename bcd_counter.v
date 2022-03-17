`timescale 1ns/1ns

module bcd_counter(
	input gclk,
	input reset,
	input oneHz,
	input add, 
	output reg [3:0] now,
	output reg carry
);
	
	
	wire tick; //real enable
	edge_detect falling_edge(gclk,reset,add,,tick);
	
	always@(posedge gclk,negedge reset)begin
		if(!reset ) now <= 4'h0;
		else if(oneHz) now <= 4'h0;
		else if(tick)begin
			if(now > 4'h9) now <= 4'h0;
			else now <= now + 4'h1;
		end 
		else begin
			now <= now;
		end
	end
	
	always@(*)begin
		if(now == 4'h9) carry = 1'b1;
		else carry = 1'b0;
	end
	
endmodule