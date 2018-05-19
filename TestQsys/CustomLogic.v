module CustomLogic (
				//INPUTS from board
				LEDR,SW,GPIO_0,GPIO_1,KEY,CLOCK_50,
				//Inputs from processor
				targetDirection,driveSpeedPercentage,swivelDistance,swivelDirection,reverse,steeringReset,EncoderReset,
			    //OUTPUTS to board
				HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
				//Outputs to Processor
				 encoderInCM,FRSensorInCM,FLSensorInCM,RSensorInCM,LSensorInCM,BRSensorInCM,BLSensorInCM,GPSLat,GPSLong,leftMagnetic,rightMagnetic,challengeSelect,
				 redLight,yellowLight,greenLight
				); 
				
output wire [9:0]  	LEDR;
input wire [9:0]  	SW;
inout wire [39:0] 	GPIO_0;
inout wire [39:0] 	GPIO_1;		
input wire [3:0]  	KEY;
input wire        	CLOCK_50;
input wire [8:0]  	targetDirection;
input wire [6:0]  	driveSpeedPercentage;
input wire [7:0]  	swivelDistance;
input wire        	swivelDirection;
input wire       	 	reverse;
input wire        	EncoderReset;
input wire 				steeringReset;
output wire [6:0] HEX0;
output wire [6:0] HEX1;
output wire [6:0] HEX2;
output wire [6:0] HEX3;
output wire [6:0] HEX4;
output wire [6:0] HEX5;


 
output wire [31:0] 	encoderInCM;				 
output wire [8:0]  	FRSensorInCM;
output wire [8:0]  	FLSensorInCM;
output wire	[8:0] 	RSensorInCM;
output wire [8:0]  	LSensorInCM;
output wire [8:0]  	BLSensorInCM;
output wire [8:0]  	BRSensorInCM;
output wire [7:0]  	leftMagnetic;
output wire [7:0]  	rightMagnetic;
output wire [3:0] 	challengeSelect;

input wire 		 	   redLight;
input wire 			   yellowLight;
input wire				greenLight;
output wire				GPSLat 	;		
output wire 			GPSLong;

wire [6:0] MotorSpeed;

assign leftMagnetic = 'b0;
assign rightMagnetic = 'b0;
assign	GPSLat 	='b0;		
assign	GPSLong ='b0;
assign GPIO_0[4] =0;
assign GPIO_0[5] =1;
 
assign GPIO_0[34] =0;
assign GPIO_0[35] =1;

assign GPIO_1[4] =1;
assign GPIO_1[5] =0;

assign GPIO_1[34] =1;
assign GPIO_1[35] =0;

Steering Steering(
.CLOCK_50(CLOCK_50),
.targetDirection(targetDirection),
.reset_Pos(steeringReset),
.reset(1'b0),

//outputs
.targetDirection_Ard({GPIO_0[36],GPIO_0[33:30],GPIO_0[9:6]}),
.reset_Pos_Ard(GPIO_0[37])

);


Drive Drive(
.A(GPIO_1[1]),
.B(GPIO_1[0]),
.CLOCK_50(CLOCK_50),
.Reset(1'b0),
.EncoderReset(EncoderReset),
.SWDirection(reverse),
.SWSpeed(driveSpeedPercentage),
//output
.EncoderInCM(encoderInCM),
.MotorDirection(GPIO_0[1]),
.MotorPWM(GPIO_0[0]),
.MotorSpeed(MotorSpeed)
	
);


SonicSensorNetwork SonicSensorNetwork(
//x6 echo
.E1(GPIO_1[32]),
.E2(GPIO_1[36]),
.E3(GPIO_1[38]),
.E4(GPIO_1[6]),
.E5(GPIO_1[8]),
.E6(GPIO_1[30]),
.CLOCK_50(CLOCK_50),
.reset(1'b0),
//outputs
//x6 Trigger
.T1(GPIO_1[33]),
.T2(GPIO_1[37]),
.T3(GPIO_1[39]),
.T4(GPIO_1[7]),
.T5(GPIO_1[9]),
.T6(GPIO_1[31]),



//x6 DistanceInCM
.Dist1(FLSensorInCM), 
.Dist2(FRSensorInCM), 
.Dist3(RSensorInCM), 
.Dist4(BRSensorInCM), 
.Dist5(BLSensorInCM), 
.Dist6(LSensorInCM) 
);
/*

Debug Debug(

.CLOCK_50(Clock_50),
.driveSpeedPercentage(driveSpeedPercentage),
.encoderInCM(encoderInCM),
.FRSensorInCM(FRSensorInCM),
.FLSensorInCM(FLSensorInCM),
.RSensorInCM(RSensorInCM),
.LSensorInCM(LSensorInCM),
.BLSensorInCM(BLSensorInCM),
.GPSLat(GPSLat),				
.GPSLong(GPSLong),
.leftMagnetic(leftMagnetic),
.rightMagnetic(rightMagnetic),
.challengeSelect(challengeSelect),
.redLight(redLight),
.yellowLight(yellowLight),
.greenLight(greenLight),
.targetDirection(GPIO_0[17]),
.swivelDistance(swivelDistance),
.swivelDirection(swivelDirection),
.reverse(reverse),
.SW(SW),
.HEX0(HEX0),
.HEX1(HEX1),
.HEX2(HEX2),
.HEX3(HEX3),
.HEX4(HEX4),
.HEX5(HEX5)
);
*/
Debug debug(
	.CLOCK_50(CLOCK_50), 
	.driveSpeedPercentage(MotorSpeed),
	.encoderInCM(encoderInCM),
	.FRSensorInCM(FRSensorInCM),
	.FLSensorInCM(FLSensorInCM),
	.RSensorInCM(RSensorInCM),
	.EncoderReset('b0),
	.LSensorInCM('b0),
	.BLSensorInCM(BLSensorInCM),
	.BRSensorInCM(BRSensorInCM),
	.GPSLat('b0),
	.GPSLong(GPIO_0[0]),
	.leftMagnetic('b0),
	.rightMagnetic('b0),
	.challengeSelect(challengeSelect),
	.redLight(redLight),
	.yellowLight(yellowLight),
	.greenLight(greenLight),
	.targetDirection({GPIO_0[36],GPIO_0[33:30],GPIO_0[9:6]}),
	.swivelDistance('b0),
	.swivelDirection(targetDirection[8:1]),
	.reverse(GPIO_0[1]),
	.SW(SW),
	.LEDR(LEDR),
	.KEY(KEY),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4),
	.HEX5(HEX5),
	.reset(1'b0));
	
					
endmodule
