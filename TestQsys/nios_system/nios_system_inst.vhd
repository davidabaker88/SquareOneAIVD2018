	component nios_system is
		port (
			blsensorincm_export         : out std_logic_vector(8 downto 0);                     -- export
			brsensorincm_export         : out std_logic_vector(8 downto 0);                     -- export
			clk_clk                     : in  std_logic                     := 'X';             -- clk
			drivespeedpercentage_export : out std_logic_vector(6 downto 0);                     -- export
			encoderincm_export          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			encoderreset_export         : out std_logic;                                        -- export
			flsensorincm_export         : out std_logic_vector(8 downto 0);                     -- export
			frsensorincm_export         : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			leftmagnetic_export         : out std_logic_vector(7 downto 0);                     -- export
			lsensorincm_export          : out std_logic_vector(8 downto 0);                     -- export
			reset_reset_n               : in  std_logic                     := 'X';             -- reset_n
			reverse_export              : out std_logic;                                        -- export
			rightmagnetic_export        : out std_logic_vector(7 downto 0);                     -- export
			rsensorincm_export          : out std_logic_vector(8 downto 0);                     -- export
			targetdirection_export      : out std_logic_vector(8 downto 0)                      -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			blsensorincm_export         => CONNECTED_TO_blsensorincm_export,         --         blsensorincm.export
			brsensorincm_export         => CONNECTED_TO_brsensorincm_export,         --         brsensorincm.export
			clk_clk                     => CONNECTED_TO_clk_clk,                     --                  clk.clk
			drivespeedpercentage_export => CONNECTED_TO_drivespeedpercentage_export, -- drivespeedpercentage.export
			encoderincm_export          => CONNECTED_TO_encoderincm_export,          --          encoderincm.export
			encoderreset_export         => CONNECTED_TO_encoderreset_export,         --         encoderreset.export
			flsensorincm_export         => CONNECTED_TO_flsensorincm_export,         --         flsensorincm.export
			frsensorincm_export         => CONNECTED_TO_frsensorincm_export,         --         frsensorincm.export
			leftmagnetic_export         => CONNECTED_TO_leftmagnetic_export,         --         leftmagnetic.export
			lsensorincm_export          => CONNECTED_TO_lsensorincm_export,          --          lsensorincm.export
			reset_reset_n               => CONNECTED_TO_reset_reset_n,               --                reset.reset_n
			reverse_export              => CONNECTED_TO_reverse_export,              --              reverse.export
			rightmagnetic_export        => CONNECTED_TO_rightmagnetic_export,        --        rightmagnetic.export
			rsensorincm_export          => CONNECTED_TO_rsensorincm_export,          --          rsensorincm.export
			targetdirection_export      => CONNECTED_TO_targetdirection_export       --      targetdirection.export
		);

