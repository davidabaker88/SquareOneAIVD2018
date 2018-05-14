// Implements a simple Nios II system for the DE-series board.
// Inputs: SW7¡0 are parallel port inputs to the Nios II system
// CLOCK_50 is the system clock
// KEY0 is the active-low system reset
// Outputs: LEDR7¡0 are parallel port outputs from the Nios II system
module ledTest (CLOCK_50, SW, HEX0,HEX1,HEX2,HEX3,HEX4,HEX5, KEY, LEDR);

input CLOCK_50;
input [7:0] SW;
input [3:0] KEY;
output [7:0] LEDR;
input wire [6:0] HEX0;
input wire [6:0] HEX1;
input wire [6:0] HEX2;
input wire [6:0] HEX3;
input wire [6:0] HEX4;
input wire [6:0] HEX5;

wire encReset;
wire reverse;
wire [8:0] targetDriection;
wire [6:0] driveSpeedPercentage;
wire [31:0] encoderInCM;
wire [8:0] RSesnorInCMl;
wire [8:0] LSesnorInCM;
wire [8:0] BLSensorInCM;
wire [8:0] BRSensorInCM;
wire [8:0] LSensorInCM;
wire [8:0] FRSensorInCMdrive;
wire [7:0] leftMagnetic;
wire [7:0] rightMagnetic;
wire reset;
wire redLight;
wire greenLight;
wire yellowLight;


// Instantiate the Nios II system module generated by the Qsys tool:


	nios_system u0 (
		.blsensorincm_export         (BLSensorInCM),         //         blsensorincm.export
		.brsensorincm_export         (BRSensorInCM),         //         brsensorincm.export
		.clk_clk                     (CLOCK_50),                     //                  clk.clk
		.drivespeedpercentage_export (driveSpeedPercentage), // drivespeedpercentage.export
		.encoderincm_export          (encoderInCM),          //          encoderincm.export
		.flsensorincm_export         (FLSensorInCM),         //         flsensorincm.export
		.frsensorincm_export         (FRSensorInCM),         //         frsensorincm.export
		.leftmagnetic_export         (leftMagnetic),         //         leftmagnetic.export
		.lsensorincm_export          (LSensorInCM),          //          lsensorincm.export
		.reset_reset_n               (reset),               //                reset.reset_n
		.reverse_export              (reverse),              //              reverse.export
		.rightmagnetic_export        (rightMagnetic),        //        rightmagnetic.export
		.rsensorincm_export          (RSensorInCM),          //          rsensorincm.export
		.swiveldirection_export      (),      //      swiveldirection.export
		.swiveldistacne_export       (),       //       swiveldistacne.export
		.targetdirection_export      (targetDirection),      //      targetdirection.export
		.encoderreset_export         (encReset)          //         encoderreset.export
	);
	
CustomLogic CL(

.EncoderReset(encReset),
.targetDirection(targetDirection),
.driveSpeedPercentage(driveSpeedPercentage),
.reverse(reverse),
.encoderInCM(encoderInCM),
.RSensorInCM(RSensorInCM),
.LSensorInCM(LSensorInCM),
.FLSensorInCM(FLSensorInCM),
.FRSensorInCM(FRSensorInCM),
.BLSensorInCM(BLSensorInCM),
.BRSensorInCM(BRSensorInCM),
.leftMagnetic(leftMagnetic),
.rightMagnetic(rightMagnetic),
.redLight(redLight),
.yellowLight(yellowLight),
.greenLight(greenLight),
.swivelDirection      ('b0),      //      swiveldirection.export
.swivelDistance       ('b0),
.HEX0(HEX0),
.HEX1(HEX1),
.HEX2(HEX2),
.HEX3(HEX3),
.HEX4(HEX4),
.HEX5(HEX5),
.LEDR(LEDR),
.KEY(KEY));

endmodule
