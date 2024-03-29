--------DEFAULT LIBRARIES-----------
library IEEE;
	use IEEE.STD_LOGIC_1164.all;
	use IEEE.NUMERIC_STD.ALL;
------------------------------------

-----------------------------------------------------------CODE EXPLANATION--------------------------------------------------------------------------------------------------
-- This module generates the kittcar effect with a dimmed tail. The tail movement and bounce is managed through an array, whose length is equal to the number of 
-- elements of the tail. Each element of this array (called pwm_map below) is an integer and contains the index (between 0 and NUM_OF_LEDS-1) of the leds array at which the
-- corresponding element of the tail should be. For example with a tail of 3 elements, with pwm_map = [3,2,1], the head led should be at the led number one, the second
-- element on the led number two, and the third element of the tail on the led number 3.

-- e.g. with a tail of length 4, at a certain time the pwm_map = [3,2,1,0] meaning that the head of the tail, whose position is encoded as the integer in position 0 of this array,
-- will be on the led number 0 ready to bounce back. After the delay set with the switches elapses, in the next step the pwm_map will contain [2,1,0,1].
-- Regarding the two elements both connected on the led 1, the element on the right, meaning the head of the tail, will be always written as last in the process such as it will dominate 
-- and will be on led 1. The procedure is: shift left discarding the element on the left while the first element on the right is the one that was there before the shift plus 1. 
-- When the number of leds is reached, the direction must be changed and then we subtract one instead of summing. And so on. Therefore the next steps will be [1,0,1,2] and [0,1,2,3].

-- The pwm signals, coming from a different modile, are connected to the leds following the indexes contained in the pwm_map register. Highest duty cycle is connected to the head.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

entity KittCarPWM is
	Generic (

		CLK_PERIOD_NS			:	POSITIVE	RANGE	1	TO	100     := 10;	-- clk period in nanoseconds
		MIN_KITT_CAR_STEP_MS	:	POSITIVE	RANGE	1	TO	2000    := 2;	-- Minimum step period in milliseconds (i.e., value in milliseconds of Delta_t)

		NUM_OF_SWS				:	INTEGER	RANGE	1 TO 16 := 16;	-- Number of input switches
		NUM_OF_LEDS				:	INTEGER	RANGE	1 TO 16 := 16;	-- Number of output LEDs

		TAIL_LENGTH				:	INTEGER	RANGE	1 TO 16	:= 4	-- Tail length
	);
	Port (

		------- Reset/Clock --------
		reset	:	IN	STD_LOGIC;
		clk		:	IN	STD_LOGIC;
		----------------------------

		-------- LEDs/SWs ----------
		sw		:	IN	STD_LOGIC_VECTOR(NUM_OF_SWS-1 downto 0);	-- Switches avaiable on Basys3
		leds	:	OUT	STD_LOGIC_VECTOR(NUM_OF_LEDS-1 downto 0)	-- LEDs avaiable on Basys3
		----------------------------

	);
end KittCarPWM;

architecture Behavioral of KittCarPWM is

	---------------------------------------COMPONENTs INSTANTIATION------------------------------------
	-- PWM module declaration
	component PWM_module
        generic(
            TAIL_LENGTH	    :  	INTEGER	RANGE	1 TO 16	-- Tail length
        );
        port(
            -------Reset/Clock----------
		    reset	:	IN	STD_LOGIC;
		    clk		:	IN	STD_LOGIC;
            ----------------------------
            ------OUT PWM VECTOR--------
            pwm_out :   OUT std_logic_vector(TAIL_LENGTH-1 downto 0)
		    ----------------------------
        );
    end component;
	-------------------------------------------------------------------------------------------------


	----------------------------------------SIGNALS & CONSTANTS-------------------------------------

	-- the array of legth equal to the tail, containing the indexes of the single elements of the tail is created and named pwm_map
	-- in order to reduce the number of bit used for the natural, a subtype is created.
	subtype my_natural is natural range 0 to NUM_OF_LEDS-1; 
	type pwm_array_map is array (TAIL_LENGTH-1 downto 0) of my_natural;
	signal pwm_map : pwm_array_map;

	-- direction bit, used to know in which direction the tail is going
	signal dir : std_logic;

	-- signal connected to the pwm module, containing the pwm signals with different duty cycles
	signal pwm_out : std_logic_vector(0 TO TAIL_LENGTH-1);

	-- constant that stores the number of clock cycles needed for MIN_KITT_CAR_STEP_MS time to pass
	-- no range is specified, 32bit will be instantiatied. In the worst case 31 would be needed anyway
    constant delay_step : positive := (1_000_000 / CLK_PERIOD_NS * MIN_KITT_CAR_STEP_MS); 

    -- counters needed respectively to know when MIN_KITT_CAR_STEP_MS time has elapsed and when the time set by the SW has elapsed
    signal counter_clk : natural range 0 to delay_step := 0; 
    signal counter_ms : unsigned(NUM_OF_SWS-1 downto 0);

	-- Registers for leds and sw 
    signal sw_reg : std_logic_vector(NUM_OF_SWS-1 downto 0);
    signal leds_reg : std_logic_vector(NUM_OF_LEDS-1 downto 0);

	----------------------------------------------------------------------------------------------

begin
	
	--------------------------------------PWM MODULE INSTATIATION---------------------------------
	inst1: PWM_module 
        generic map (
            TAIL_LENGTH => TAIL_LENGTH
        )
        port map (
            reset  => reset,
            clk    => clk,
            pwm_out => pwm_out
        );
	---------------------------------------------------------------------------------------------

	process (clk, reset)
	begin
		if rising_edge(clk) then

			sw_reg <= sw;
			leds <= leds_reg;

			---------------------------------SYNC RESET LOGIC-----------------------------------
			if (reset = '1') then

				-- turn on all leds
				leds_reg <= (others => '1');
				leds <= leds_reg;
				-- set direction to 0 and set to 0 all leds positions
				dir <= '0';
				pwm_map <= (others => 0); 
				-- reset counters
				counter_clk <= 0;
				counter_ms <= (others => '0');

			else
			
				--------------------------------PWM ASSIGNMENT----------------------------------
				-- signals from the pwm module are mapped and connected to the leds indicated by the pwm_map array
				leds_reg <= (others => '0');
				
				for I in TAIL_LENGTH-1 downto 0 loop
					leds_reg(pwm_map(I)) <= pwm_out(I);
				end loop; 
				--------------------------------------------------------------------------------

				-----------------------------SYNC SWITCHES DELAY TIME CHANGE-------------------------
				-- change the speed immediately, whitout waiting for the counter to finish when the SW are changed
				if sw /= sw_reg then
					counter_ms <= (others => '0');
					counter_clk <= 0; 
				end if;
				-------------------------------------------------------------------------------------

				--------------------------------------COUNT LOGIC-----------------------------------
				-- two counters to keep track of the minimum delay in ms and of the delay set by the SW 
				if counter_clk = delay_step then
					counter_clk <= 0;
					if counter_ms < unsigned(sw_reg) then
						counter_ms <= counter_ms + 1;
					else   
						counter_ms <= (others => '0');
						--------------------------PWM SHIFT LOGIC-----------------------------------
						-- change direction if the extremes of the leds strip are reached
						-- check second last one and first one since after commit the correct one will be lit
						-- then the shift and add/subtract logic dedscribed above is implemented
						if pwm_map(0) = NUM_OF_LEDS-2 then
							dir <= '1';
						elsif  pwm_map(0) = 1 then
							dir <= '0';
						end if;

						case dir is
							when '0' => pwm_map(0) <= pwm_map(0) + 1;
							when '1' => pwm_map(0) <= pwm_map(0) - 1;
							when others => pwm_map(0) <= pwm_map(0); 
						end case;

						for I in 0 to TAIL_LENGTH-2 loop
							pwm_map(I+1) <= pwm_map(I);
						end loop; 				
						----------------------------------------------------------------------------
					end if;

				else

					counter_clk <= counter_clk + 1;

				end if;

			end if;

		end if;

	end process;

end Behavioral;
