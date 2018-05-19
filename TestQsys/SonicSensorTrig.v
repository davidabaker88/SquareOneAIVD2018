module SonicSensorTrig (CLOCK_50,reset, Tset1,Tset2);

//this is the 50Mhz clock
input wire CLOCK_50;
input wire reset;
output reg Tset1;
output reg Tset2;

wire enable_next;
reg enable;

ClockDivider #(.COUNTER_WIDTH(25)) secondDivider(
												.CLOCK_IN(CLOCK_50),
												.CLOCK_DIVIDER('d3125000),//16 samples per second (~from recommended 60ms)
              
               .HIGH_TIME('d 500),//number of ticks high –FIXME check math 
												.async_reset(~reset), //do not reset for now
												.CLOCK_OUT(trigger));	
												
assign enable_next = {enable};

always @(negedge trigger ) begin
	enable <= enable_next;
end

always @(posedge CLOCK_50 ) begin
	Tset1 <= trigger & enable;
	Tset2 <= trigger & ~enable;
end

endmodule
//Distance in cm
//Reset