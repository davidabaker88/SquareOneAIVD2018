
module nios_system (
	blsensorincm_export,
	brsensorincm_export,
	clk_clk,
	drivespeedpercentage_export,
	encoderincm_export,
	encoderreset_export,
	flsensorincm_export,
	frsensorincm_export,
	leftmagnetic_export,
	lsensorincm_export,
	reset_reset_n,
	reverse_export,
	rightmagnetic_export,
	rsensorincm_export,
	targetdirection_export);	

	output	[8:0]	blsensorincm_export;
	output	[8:0]	brsensorincm_export;
	input		clk_clk;
	output	[6:0]	drivespeedpercentage_export;
	input	[31:0]	encoderincm_export;
	output		encoderreset_export;
	output	[8:0]	flsensorincm_export;
	input	[8:0]	frsensorincm_export;
	output	[7:0]	leftmagnetic_export;
	output	[8:0]	lsensorincm_export;
	input		reset_reset_n;
	output		reverse_export;
	output	[7:0]	rightmagnetic_export;
	output	[8:0]	rsensorincm_export;
	output	[8:0]	targetdirection_export;
endmodule
