module Clock_Counter(
	input CLOCK_50,
	input reset,
	input oneHz,
	input testSignal,
	output reg [31:0] result
);
	
	wire [31:0] buffer;
	reg add;
	
	always@(posedge CLOCK_50,posedge reset)begin //result
		if(reset) result <= 32'd0;
		else if(oneHz) result <= buffer;
		else result <= result;
	end
	
	wire [7:0] edged;
	wire [7:0] toEdge;
	assign toEdge[0] = testSignal; 
	genvar i;
	generate
		for(i = 0 ; i < 6 ; i = i + 1)begin : gen
			edge_detect edges(CLOCK_50,reset,toEdge[i],,edged[i]);
			bcd_counter count(CLOCK_50,reset,edged[i],buffer[i*4+:4]);
			assign toEdge[i+1] = buffer[i*4+3];
		end
	endgenerate
	
endmodule