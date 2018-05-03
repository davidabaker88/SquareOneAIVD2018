/module CustomLogic (
				//INPUTS from board
				LEDR,SW,GPIO_0,GPIO_1,ADC_CON,KEY,CLOCK_50,
				//Inputs from processor
				targetDirection,driveSpeedPercentage,swivelDistance,swivelDirection,reverse
			    //OUTPUTS to board
				HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
				//Outputs to Processor
				 encoderInCM,FRSensorInCM,FLSensorInC,RSensorInCM,LSensorInCM,RSensorInCM,BLSensorInCM,GPSLat,GPSLong,leftMagnetic,rightMagnetic,challengeSelect,
				 redLight,yellowLight,greenLight
				) 
				
input wire [9:0]  LEDR
input wire [9:0]  SW
inout wire [39:0] GPIO_0
inout wire [39:0] GPIO_1			
input wire [3:0]  KEY
input wire        CLOCK_50
input wire [8:0]  targetDirection
input wire [6:0]  driveSpeedPercentage
input wire [7:0]  swivelDistance
input wire        swivelDirection
input wire        reverse
input wire        EncoderReset

output wire [31:0] encoderInCM				 
output wire [8:0]  RSensorInCM
output wire [8:0]  LSensorInC
output wire	[8:0]  RSensorInCM
output wire [8:0]  LSensorInCM
output wire [8:0]  BLSensorInCM
output wire [8:0]  RSensorInCM
output wire [7:0]  leftMagnetic
output wire [7:0]  rightMagnetic

output wire redLight
output wire yellowLight
output wire	greenLight
output wire	GPSLat 			
output wire GPSLong

//wire encoderA;

//assign encoderA = GPIO_0[0];
 

Steering Steering(
.CLOCK_50(CLOCK_50),
.targetDirection(),
.reset_Pos(),

//outputs
.targetDirection_Aid(),
.reset_Pos_Aid()

);

Drive Drive(
.A(GPIO_0[0]),
.B(GPIO_0[1]),
.CLOCK_50(CLOCK_50),
.Reset(KEY[0]),
.EncoderReset(EncoderReset),
.SWDirection(reverse),
.SWSpeed(driveSpeedPercentage),
//output
.EncoderInCM(GPIO_0[2]),
.MotorDirection(GPIO_0[15]),
.MotorPWM(GPIO_0[16]),
.MotorSpeed()
	
);


SonicSensorNetwork SonicSensorNetwork(
//x6 echo
.echo(GPIO_0[3]),
.echo1(GPIO_0[4]),
.echo2(GPIO_0[5]),
.echo3(GPIO_0[6]),
.echo4(GPIO_0[7]),
.echo5(GPIO_0[8]),
.CLOCK_50(CLOCK_50),
.reset(KEY[0]),
//outputs
//x6 Trigger
.Trigger(GPIO_0[9]),
.Trigger1(GPIO_0[10]),
.Trigger2(GPIO_0[11]),
.Trigger3(GPIO_0[12]),
.Trigger4(GPIO_0[13]),
.Trigger5(GPIO_0[14]),



//x6 DistanceInCM
.DistanceInCM(RSensorInCM[0]),
.DistanceInCM1(RSensorInCM[1]),
.DistanceInCM2(RSensorInCM[2]),
.DistanceInCM3(RSensorInCM[3]),
.DistanceInCM4(RSensorInCM[4]),
.DistanceInCM5(RSensorInCM[5])
);

Debug Debug(
);
 

