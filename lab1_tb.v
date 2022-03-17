`timescale 1ns/1ns

module lab1_tb;

reg clk_50M;
reg reset_n;  //low active
reg key0;     //low active
reg clk_sma;  // test clock
reg [3:0] key;
wire oneHz;
wire [6:0] hex0;
wire [6:0] hex1;
wire [6:0] hex2;
wire [6:0] hex3;
wire [6:0] hex4;
wire [6:0] hex5;
wire [6:0] hex6;
wire [6:0] hex7;



lab1 u1(
                //////// CLOCK //////////
                .CLOCK_50(clk_50M),
                .KEY(key),
                //////// SEG7 //////////
                .HEX0(hex0),
                .HEX1(hex1),
                .HEX2(hex2),
                .HEX3(hex3),
                .HEX4(hex4),
                .HEX5(hex5),
                .HEX6(hex6),
                .HEX7(hex7),
                ///////////////////////
                .SMA_CLKIN(clk_sma),
					 ///////////////////////
					 .oneHz(oneHz)
                               
        );  
		  

always
  #10 clk_50M = ~clk_50M;
  
always
  #31 clk_sma = ~clk_sma;  // 16129032Hz
  
//assign key[0] = reset_n;
//assign key[1] = reset_n;
//assign key[2] = reset_n;
//assign key[3] = reset_n;

initial
  begin
  reset_n = 0;  
  clk_50M = 0 ;  
  clk_sma = 0; 
  key[0] = 1;

  
  #30 reset_n = 1;  
  
  #2_000_000
  //#200
  key[0] = 0;     // key0 press
  #12_000_000
  //#1200
  key[0] = 1;     // key0 release
  
  #200_000_000_0; // simualtion 100ms // 2sec
  //#10_000
  
  $stop;
  end
  
initial
  begin
  $monitor("time=%3d,reset_n=%d,key0=%d,hex0=%x hex1=%x hex2=%x hex3=%x hex4=%x hex5=%x hex6=%x hex7=%x",$time,reset_n,key0,hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7);
  end
  
  
endmodule
