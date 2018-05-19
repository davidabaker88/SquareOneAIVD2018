module Debug(encoder_c, CLOCK_50, driveSpeedPercentage,encoderInCM,FRSensorInCM,FLSensorInCM,RSensorInCM,EncoderReset,
					LSensorInCM,BLSensorInCM,BRSensorInCM,GPSLat,GPSLong,leftMagnetic,rightMagnetic,challengeSelect,
					redLight,yellowLight,greenLight,targetDirection,swivelDistance,swivelDirection,reverse,SW,LEDR,KEY,
					HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,reset);

					
					
					
					
					
					
	output wire [9:0]  LEDR;
	output wire [6:0] HEX0;
	output wire [6:0] HEX1;
	output wire [6:0] HEX2;
	output wire [6:0] HEX3;
	output wire [6:0] HEX4;
	output wire [6:0] HEX5;
	
	
	
	
	input wire [23:0] encoder_c;
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
	output reg [3:0]  challengeSelect;
	
	input wire        redLight;
	input wire        yellowLight;
	input wire        greenLight;
	input wire 			reset;
	
	wire [7:0] Debug1;
	wire [7:0] Debug2;
	wire [7:0] Debug3;
	
	wire [3:0]  challengeSelect_next;
	
	assign challengeSelect_next = KEY[3] ? SW[3:0]: challengeSelect;
	
	always @(posedge CLOCK_50) begin
		challengeSelect <= challengeSelect_next;
	end
	
	assign LEDR[3:0] = challengeSelect;
	
	
	assign LEDR[9:7] = {redLight,yellowLight,greenLight};
	
	
	
		ClockDivider #(.COUNTER_WIDTH(25)) test(
												.CLOCK_IN(CLOCK_50),
		.CLOCK_DIVIDER('d50000000),//16 samples per second (~from recommended 60ms)
              
               .HIGH_TIME(25000000),//number of ticks high –FIXME check math 
		.async_reset('b1), //do not reset for now
												.CLOCK_OUT(LEDR[4]));	
	
	
	
	assign Debug1 = 	(SW[9] == 1'b1) ?  (SW[8]?encoder_c[7:0]:encoderInCM[7:0])		 :
							(SW[2:0] == 3'b000) ? {4'b0,challengeSelect}		 : 
							(SW[2:0] == 3'b001) ? targetDirection[8:1] 		 :
							(SW[2:0] == 3'b011) ? rightMagnetic  		 : 
							(SW[2:0] == 3'b101) ? BLSensorInCM[8:1]   		 :
									
								8'd0;
								
	assign Debug2 =   (SW[9] == 1'b1) ? (SW[8]?encoder_c[15:8]:encoderInCM[15:8])			 :
							(SW[5:3] == 3'b000) ? {7'b0,GPSLong} 					 : //now motorPWM
							(SW[5:3] == 3'b001) ? leftMagnetic   		 :
							(SW[5:3] == 3'b011) ? RSensorInCM [8:1]    		 : 
							(SW[5:3] == 3'b010) ? FLSensorInCM[8:1]    		 :
							(SW[5:3] == 3'b101) ? swivelDirection  : //now target direction from sw
								
								8'd0;
								
								
	assign Debug3 =   (SW[9] == 1'b1) ?  (SW[8]?encoder_c[23:16]:encoderInCM[23:16])			 :
							(SW[8:6] == 3'b000) ? LSensorInCM[8:1] 			 : 
							(SW[8:6] == 3'b001) ? {7'b0,EncoderReset} 		    :
							(SW[8:6] == 3'b011) ? {1'b0,driveSpeedPercentage}  : 
							(SW[8:6] == 3'b101) ? {7'b0,reverse}				:			
								8'd0;

								
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
					