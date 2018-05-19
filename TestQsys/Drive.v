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
MotorSpeed,
encoder_c
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

 output reg    MotorDirection;
 output wire    MotorPWM;
 output reg [6:0]    MotorSpeed;
	wire [6:0]  MotorSpeed_n;

 output wire [23:0]    encoder_c;


FirstCounter firstCounter(
	.rst_n(~EncoderReset),
	.CLOCK_50(CLOCK_50),
	.A(A),
	.B(B),
	.c_out(encoder_c)
);
 assign EncoderInCM_n = encoder_c * 'd4 / 'd10; //fixme fix constant 

always @(posedge CLOCK_50) begin
		EncoderInCM <= EncoderInCM_n;
	end

//motor stuff
	assign SWDirection_n =  SWDirection;
	assign MotorSpeed_n = SWSpeed;
	
	always @(posedge CLOCK_50) begin
		MotorDirection <=  SWDirection_n;
		MotorSpeed <=  MotorSpeed_n;
	end
	
	ClockDivider #(.COUNTER_WIDTH(25)) pwm(
												.CLOCK_IN(CLOCK_50),
		.CLOCK_DIVIDER('d100),//16 samples per second (~from recommended 60ms)
              
               .HIGH_TIME(SWSpeed),//number of ticks high –FIXME check math 
		.async_reset(~Reset), //do not reset for now
												.CLOCK_OUT(MotorPWM));	
 
 
 
endmodule
