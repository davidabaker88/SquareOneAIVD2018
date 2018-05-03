	component nios_system is
		port (
			clk_clk                     : in  std_logic                     := 'X';             -- clk
			reset_reset_n               : in  std_logic                     := 'X';             -- reset_n
			targetdirection_export      : out std_logic_vector(8 downto 0);                     -- export
			drivespeedpercentage_export : out std_logic_vector(6 downto 0);                     -- export
			swiveldistacne_export       : out std_logic_vector(7 downto 0);                     -- export
			encoderincm_export          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			swiveldirection_export      : out std_logic;                                        -- export
			reverse_export              : out std_logic;                                        -- export
			frsensorincm_export         : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- export
			flsensorincm_export         : out std_logic_vector(8 downto 0);                     -- export
			rsensorincm_export          : out std_logic_vector(8 downto 0);                     -- export
			lsensorincm_export          : out std_logic_vector(8 downto 0);                     -- export
			blsensorincm_export         : out std_logic_vector(8 downto 0);                     -- export
			brsensorincm_export         : out std_logic_vector(8 downto 0);                     -- export
			leftmagnetic_export         : out std_logic_vector(7 downto 0);                     -- export
			rightmagnetic_export        : out std_logic_vector(7 downto 0)                      -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                     => CONNECTED_TO_clk_clk,                     --                  clk.clk
			reset_reset_n               => CONNECTED_TO_reset_reset_n,               --                reset.reset_n
			targetdirection_export      => CONNECTED_TO_targetdirection_export,      --      targetdirection.export
			drivespeedpercentage_export => CONNECTED_TO_drivespeedpercentage_export, -- drivespeedpercentage.export
			swiveldistacne_export       => CONNECTED_TO_swiveldistacne_export,       --       swiveldistacne.export
			encoderincm_export          => CONNECTED_TO_encoderincm_export,          --          encoderincm.export
			swiveldirection_export      => CONNECTED_TO_swiveldirection_export,      --      swiveldirection.export
			reverse_export              => CONNECTED_TO_reverse_export,              --              reverse.export
			frsensorincm_export         => CONNECTED_TO_frsensorincm_export,         --         frsensorincm.export
			flsensorincm_export         => CONNECTED_TO_flsensorincm_export,         --         flsensorincm.export
			rsensorincm_export          => CONNECTED_TO_rsensorincm_export,          --          rsensorincm.export
			lsensorincm_export          => CONNECTED_TO_lsensorincm_export,          --          lsensorincm.export
			blsensorincm_export         => CONNECTED_TO_blsensorincm_export,         --         blsensorincm.export
			brsensorincm_export         => CONNECTED_TO_brsensorincm_export,         --         brsensorincm.export
			leftmagnetic_export         => CONNECTED_TO_leftmagnetic_export,         --         leftmagnetic.export
			rightmagnetic_export        => CONNECTED_TO_rightmagnetic_export         --        rightmagnetic.export
		);

