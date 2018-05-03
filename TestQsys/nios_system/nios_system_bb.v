
module nios_system (
	clk_clk,
	reset_reset_n,
	targetdirection_export,
	drivespeedpercentage_export,
	swiveldistacne_export,
	encoderincm_export,
	swiveldirection_export,
	reverse_export,
	frsensorincm_export,
	flsensorincm_export,
	rsensorincm_export,
	lsensorincm_export,
	blsensorincm_export,
	brsensorincm_export,
	leftmagnetic_export,
	rightmagnetic_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[8:0]	targetdirection_export;
	output	[6:0]	drivespeedpercentage_export;
	output	[7:0]	swiveldistacne_export;
	input	[31:0]	encoderincm_export;
	output		swiveldirection_export;
	output		reverse_export;
	input	[8:0]	frsensorincm_export;
	output	[8:0]	flsensorincm_export;
	output	[8:0]	rsensorincm_export;
	output	[8:0]	lsensorincm_export;
	output	[8:0]	blsensorincm_export;
	output	[8:0]	brsensorincm_export;
	output	[7:0]	leftmagnetic_export;
	output	[7:0]	rightmagnetic_export;
endmodule
