`timescale 1ns/1ns

module bcd_counter(
	input gclk,
	input reset,
	input oneHz,
	input add, 
	output reg [3:0] now,
	output reg carry
);
	
	always@(posedge gclk,negedge reset)begin
		if(!reset ) now <= 4'h0;
		else if(oneHz) now <= 4'h0;
		else if(add)begin
			if(now == 4'd9) now <= 4'h0;
			else now <= now + 4'h1;
		end 
		else begin
			now <= now;
		end
	end
	
	always@(*)begin
		if(now == 4'd9 && add) carry = 1'b1;
		else carry = 1'b0;
	end
	
endmodule