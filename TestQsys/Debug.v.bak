module Debug(CLOCK_50, driveSpeedPercentage,encoderInCM,FRSensorInCM,FLSensorInCM,RSensorInCM,EncoderReset,
					LSensorInCM,BLSensorInCM,BRSensorInCM,GPSLat,GPSLong,leftMagnetic,rightMagnetic,challengeSelect,
					redLight,yellowLight,greenLight,targetDirection,swivelDistance,swivelDirection,reverse,SW,LEDR,KEY,
					HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);

					
					
					
					
					
					
	output wire [9:0]  LEDR;
	output wire [6:0] HEX0;
	output wire [6:0] HEX1;
	output wire [6:0] HEX2;
	output wire [6:0] HEX3;
	output wire [6:0] HEX4;
	output wire [6:0] HEX5;
	
	
	
	
	
	input wire [9:0]  SW;	
	input wire [3:0]  KEY;
	input wire        CLOCK_50;
	input wire [8:0]  targetDirection;
	input wire [6:0]  driveSpeedPercentage;
	input wire        swivelDirection;
	input wire [7:0]  	swivelDistance;
	input wire        reverse;
	input wire        EncoderReset;
	input wire [31:0] encoderInCM;			 
	input wire [8:0]  RSensorInCM;
	input wire [8:0]  LSensorInCM;
	input wire [8:0]	FLSensorInCM;
	input wire [8:0]	FRSensorInCM;
	
	input wire [8:0]  BLSensorInCM;
	input wire [8:0]  BRSensorInCM;
	input wire [7:0]  leftMagnetic;
	input wire [7:0]  rightMagnetic;
	input wire 			GPSLat;
	input wire 			GPSLong;
	input wire [2:0]  challengeSelect;
	
	input wire        redLight;
	input wire        yellowLight;
	input wire        greenLight;
	
	wire [7:0] Debug1;
	wire [7:0] Debug2;
	wire [7:0] Debug3;
	
	assign LEDR[2:0] = challengeSelect;
	
	assign LEDR[9:7] = {redLight,yellowLight,greenLight};
	
	
	
	assign Debug1 = 	(SW[9] == 'b1) ?  encoderInCM[7:0]		 :
							(SW[2:0] == 'b000) ? challengeSelect 		 : 
							(SW[2:0] == 'b001) ? targetDirection 		 :
							(SW[2:0] == 'b011) ? rightMagnetic  		 : 
							(SW[2:0] == 'b101) ? BLSensorInCM   		 :
									
								'd0;
								
	assign Debug2 =   (SW[9] == 'b1) ?  encoderInCM[15:8]		 :
							(SW[5:3] == 'b000) ? GPSLong 					 : 
							(SW[5:3] == 'b001) ? leftMagnetic   		 :
							(SW[5:3] == 'b011) ? RSensorInCM     		 : 
							(SW[5:3] == 'b010) ? FLSensorInCM    		 :
							(SW[5:3] == 'b101) ? swivelDirection  : 
								
								'd0;
								
								
	assign Debug3 =   (SW[9] == 'b1) ?  encoderInCM[23:16]		 :
							(SW[8:6] == 'b000) ? LSensorInCM 			 : 
							(SW[8:6] == 'b001) ? EncoderReset 		    :
							(SW[8:6] == 'b011) ? driveSpeedPercentage  : 
							(SW[8:6] == 'b101) ? GPSLat				:			
								'd0;

								
Lab2 Display0 (
		.SW(Debug1[3:0]),
		.HEX0(HEX0),
		.LEDR()
	);							
								
Lab2 Display1 (
		.SW(Debug1[7:4]),
		.HEX0(HEX1),
		.LEDR()
	);								
	
Lab2 Display2 (
		.SW(Debug2[3:0]),
		.HEX0(HEX2),
		.LEDR()
	);	

Lab2 Display3 (
		.SW(Debug2[7:4]),
		.HEX0(HEX3),
		.LEDR()
	);	

Lab2 Display4 (
		.SW(Debug3[3:0]),
		.HEX0(HEX4),
		.LEDR()
	);	

Lab2 Display5 (
		.SW(Debug3[7:4]),
		.HEX0(HEX5),
		.LEDR()
	);							
					endmodule			
					