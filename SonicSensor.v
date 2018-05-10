module SonicSensor (CLOCK_50,trigger,echo,distanceCM,reset_n);

//58uS per cm
//this is the 50Mhz clock
input wire CLOCK_50;

output reg distanceCM
input wire trigger;
input wire echo;
wire [32:0] echoCount_next;
wire [32:0] distance_next;
reg [32:0] echoCount_r;
reg [32:0] previousValue_r;
											
assign distance_next = previousValue_r / 'd2900;
assign echoCount_next = (trigger == 'd1)? 'd0:echoCount_r + echo;
// the ~ is the bitwise “not” operator in Verilog 
always @(posedge CLOCK_50 ) begin
	echoCount_r <=  reset_n ? echoCount_next : 'd0;
	distanceCM <= reset_n ? distance_next : 'd0;
end
always @(posedge trigger or negedge reset_n) begin
	previousValue_r <=  reset_n ? echoCount_r : 'd0;
end



endmodule
