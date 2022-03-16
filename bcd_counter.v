module bcd_counter(
	input gclk,
	input reset,
	input oneHz,
	input add,
	output reg [3:0] now
);
	
	wire [3:0] next_now = (reset || oneHz)?(now < 9)?now+4'h1:4'h0:4'h0;
	always@(posedge gclk,posedge reset)begin
		if(reset) now <= 4'h0;
		else now <= next_now;
		
	end
	
endmodule