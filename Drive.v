module Drive (

A,
B,
CLOCK_50,
Reset,
EncoderReset,
SWDirection,
SWSpeed,
//output
EncoderInCM,
MotorDirection,
MotorPWM,
MotorSpeed
 );


 input wire     A;
 input wire     B;
 input wire     CLOCK_50;
 input wire     Reset;
 input wire     EncoderReset;
 input wire     SWDirection;
 	wire   SWDirection_n;
 input wire [6:0]     SWSpeed;

 output reg    [31:0] EncoderInCM;
 wire    [31:0] EncoderInCM_n;

 output wire    MotorDirection;
 output wire    MotorPWM;
 output wire    MotorSpeed;
	wire MotorSpeed_n;

 wire [23:0]    encoder_c;

encoder stuff
FirstCounter(
	.rst_n(~Reset),
	.CLOCK_50(CLOCK_50),
	.A(A),
	.B(B),
	.c_out(encoder_c)
);
 assign EncoderInCM_n = encoder_c*0.4; //fixme fix constant 

always @(posedge CLOCK_50) begin
		EncoderInCM <=~ Reset ? 'd0: EncoderInCM_n;
	end

//motor stuff
	assign SWDirection_n =  SWDirection;
	assign MotorSpeed_n = MotorSpeed;
	
	always @(posedge CLOCK_50) begin
		SWDirection <=~ Reset ? 'd0: SWDirection_n;
		MotorSpeed <= Reset ? 'd0: MotorSpeed_n;
	end
	
	ClockDivider #(.COUNTER_WIDTH(25)) pwm(
												.CLOCK_IN(CLOCK_50),
		.CLOCK_DIVIDER('d100),//16 samples per second (~from recommended 60ms)
              
               .HIGH_TIME(SWSpeed),//number of ticks high –FIXME check math 
		.async_reset(~Reset), //do not reset for now
												.CLOCK_OUT(MotorPWM));	
 
 
 
endmodule
