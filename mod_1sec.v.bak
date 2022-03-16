module mod_1sec(
	input clk,
	output reset,
	output oneHz
);
	
	reg [25:0] counter;
	always@(posedge clk,posedge reset)begin
		if(!reset) 
			counter <= 0;
		else begin
			if(counter == 50_000_000) counter <= 0;
			else counter <= counter + 1;
		end
	end
	
	always@(*)begin
		if(counter == 50_000_000) oneHz = 1'b1;
		else oneHz = 1'b0;
	end
	
endmodule