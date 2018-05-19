	component nios_system is
		port (
			blsensor_export        : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			brsensor_export        : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			challengeselect_export : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			clk_clk                : in  std_logic                     := 'X';             -- clk
			drivespeed_export      : out std_logic_vector(6 downto 0);                     -- export
			encoderincm_export     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			encoderreset_export    : out std_logic;                                        -- export
			flsensor_export        : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			frsensor_export        : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			greenlight_export      : in  std_logic                     := 'X';             -- export
			leds_export            : out std_logic_vector(7 downto 0);                     -- export
			lsensor_export         : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			redlight_export        : in  std_logic                     := 'X';             -- export
			reset_reset_n          : in  std_logic                     := 'X';             -- reset_n
			reverse_export         : out std_logic;                                        -- export
			rsensor_export         : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			switches_export        : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			targetdirection_export : out std_logic_vector(8 downto 0);                     -- export
			yellowlight_export     : in  std_logic                     := 'X'              -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			blsensor_export        => CONNECTED_TO_blsensor_export,        --        blsensor.export
			brsensor_export        => CONNECTED_TO_brsensor_export,        --        brsensor.export
			challengeselect_export => CONNECTED_TO_challengeselect_export, -- challengeselect.export
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			drivespeed_export      => CONNECTED_TO_drivespeed_export,      --      drivespeed.export
			encoderincm_export     => CONNECTED_TO_encoderincm_export,     --     encoderincm.export
			encoderreset_export    => CONNECTED_TO_encoderreset_export,    --    encoderreset.export
			flsensor_export        => CONNECTED_TO_flsensor_export,        --        flsensor.export
			frsensor_export        => CONNECTED_TO_frsensor_export,        --        frsensor.export
			greenlight_export      => CONNECTED_TO_greenlight_export,      --      greenlight.export
			leds_export            => CONNECTED_TO_leds_export,            --            leds.export
			lsensor_export         => CONNECTED_TO_lsensor_export,         --         lsensor.export
			redlight_export        => CONNECTED_TO_redlight_export,        --        redlight.export
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			reverse_export         => CONNECTED_TO_reverse_export,         --         reverse.export
			rsensor_export         => CONNECTED_TO_rsensor_export,         --         rsensor.export
			switches_export        => CONNECTED_TO_switches_export,        --        switches.export
			targetdirection_export => CONNECTED_TO_targetdirection_export, -- targetdirection.export
			yellowlight_export     => CONNECTED_TO_yellowlight_export      --     yellowlight.export
		);

