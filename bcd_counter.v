module bcd_counter(
	input gclk,
	input reset,
	input add,
	output reg [3:0] now
);
	
	always@(posedge gclk,posedge reset)begin
		if(reset) now <= 4'h0;
		else if(now < 4'h9) now <= now + 4'h1;
		else now <= 4'h0;
	end
	
endmodule