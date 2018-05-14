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
 input wire     SWSpeed;

 output wire    [31:0] EncoderInCM;
 wire    [31:0] EncoderInCM_n;

 output wire    MotorDirection;
 output wire    MotorPWM;
 output wire    MotorSpeed;

 wire [23:0]    encoder_c;

/*encoder stuff
FirstCounter(
	.rst_n(~Reset),
	.CLOCK_50(CLOCK_50),
	.A(A),
	.B(B),
	.c_out(encoder_c)
);
 assign EncoderInCM_n = encoder_c*0.4; //fixme fix constant 

always @(posedge CLOCK_50) begin
		temp_curr <= w_curr;
		r_curr <= temp_curr;
		r_prev <= r_curr;
		r_count <= ~rst_n ? 'd0: count_next;
	end

//motor stuff
 
 
 */
 
endmodule
