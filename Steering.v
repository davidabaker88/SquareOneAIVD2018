module Steering (
CLOCK_50,
targetDirection,
reset_Pos,
reset,

//outputs
targetDirection_Ard,
reset_Pos_Ard
);

input wire 				reset_Pos;
input wire        	CLOCK_50;
input wire 	[8:0]  	targetDirection;
input wire     reset;
output reg [8:0]  	targetDirection_Ard;
output reg 			reset_Pos_Ard;

always @(posedge CLOCK_50) begin
	targetDirection_Ard <= reset ? 'b0 : targetDirection;
	reset_Pos_Ard <= reset ? 'b0 : reset_Pos;
end
endmodule
