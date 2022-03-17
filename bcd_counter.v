module bcd_counter(
	input gclk,
	input reset,
	input oneHz,
	input add,
	output reg [3:0] now
);
	
	
	wire tick;
	edge_detect falling_edge(gclk,reset,add,,tick);
	
	/*wire [3:0] next;
	assign next = (reset | oneHz) ? 4'h0 :
					  (!tick) 			? now  :
					  (now > 9) 		? 4'h0 :
					  now + 4'd1		;
				*/	  
	always@(posedge gclk,posedge reset)begin
		if(reset) now <= 4'h0;
		else if(oneHz) now <= 4'h0;
		else if(tick)begin
			if(now > 4'h9) now <= now + 4'h9;
			else now <= 4'h0;
		end
	end
	
endmodule