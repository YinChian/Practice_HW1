module test_10kHz(
	input clk_50M,
	input reset,
	output reg clk_10k
);
	
	reg [8:0] count;
	always@(posedge clk_50M,negedge reset)begin
		if(!reset) begin
			count <= 9'b0;
			clk_10k <= 1'b0;
		end
		else begin
			if(count > 9'd5000) count <= 9'd0;
			else count <= count + 1'b0;
		end
	end
	
endmodule