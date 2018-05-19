
module nios_system (
	blsensor_export,
	brsensor_export,
	challengeselect_export,
	clk_clk,
	drivespeed_export,
	encoderincm_export,
	encoderreset_export,
	flsensor_export,
	frsensor_export,
	greenlight_export,
	leds_export,
	lsensor_export,
	redlight_export,
	reset_reset_n,
	reverse_export,
	rsensor_export,
	switches_export,
	targetdirection_export,
	yellowlight_export);	

	input	[8:0]	blsensor_export;
	input	[8:0]	brsensor_export;
	input	[3:0]	challengeselect_export;
	input		clk_clk;
	output	[6:0]	drivespeed_export;
	input	[31:0]	encoderincm_export;
	output		encoderreset_export;
	input	[8:0]	flsensor_export;
	input	[8:0]	frsensor_export;
	input		greenlight_export;
	output	[7:0]	leds_export;
	input	[8:0]	lsensor_export;
	input		redlight_export;
	input		reset_reset_n;
	output		reverse_export;
	input	[8:0]	rsensor_export;
	input	[7:0]	switches_export;
	output	[8:0]	targetdirection_export;
	input		yellowlight_export;
endmodule
