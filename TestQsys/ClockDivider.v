module ClockDivider (CLOCK_IN,CLOCK_DIVIDER,async_reset,CLOCK_OUT,HIGH_TIME);
parameter COUNTER_WIDTH = 25; //width to hold CLOCK_DIVIDER/2 in a register
//this is the 50Mhz clock
input wire CLOCK_IN;
input wire [COUNTER_WIDTH:0] CLOCK_DIVIDER;
input wire async_reset;
input wire [COUNTER_WIDTH:0]HIGH_TIME;
output wire CLOCK_OUT;


//output wire of the compare
wire counterRst;
//wire to hold value to know when to toggle slower clock


//counter next wire and register
wire [COUNTER_WIDTH-1:0] counter_next;
reg  [COUNTER_WIDTH-1:0] counter_r;

//slowClk_r is the new slower clock (1 slow period)
wire slowClk_next;
reg  slowClk_r;

 

//use counterRstValue-1 since it resets to 0 instead of 1
assign counterRst = (counter_r == CLOCK_DIVIDER-1);
assign counter_next = counterRst ? 'd0 : counter_r+1;

assign slowClk_next = counter_r < HIGH_TIME;


always @(negedge CLOCK_IN or negedge async_reset) begin
	counter_r   <= ~async_reset ? 'd0 : counter_next;
	slowClk_r   <= ~async_reset ? 'd0 :slowClk_next; 
end

assign CLOCK_OUT = slowClk_r;
		
endmodule
