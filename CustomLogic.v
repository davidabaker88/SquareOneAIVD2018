module CustomLogic (
				//INPUTS from board
				LEDR,SW,GPIO_0,GPIO_1,ADC_CON,KEY,CLOCK_50,
				//Inputs from processor
				targetDirection,driveSpeedPercentage,swivelDistance,swivelDirection,reverse
			    //OUTPUTS to board
				HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
				//Outputs to Processor
				 encoderInCM,FRSensorInCM,FLSensorInC,RSensorInCM,LSensorInCM,RSensorInCM,BLSensorInCM,GPSLat,GPSLongleftMagnetic,rightMagnetic,challengeSelect,
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
 

Steering Steering(

);

Drive Drive(
.A(),
.B(),
.CLOCK_50(),
.Reset(),
.EncoderReset(),
.SWDirection(),
.SWSpeed(),
//output
.EncoderInCM(),
.MotorDirection(),
.MotorPWM(),
.MotorSpeed(),
	
);


SonicSensorNetwork SonicSensorNetwork(
);

Debug Debug(
);
 
