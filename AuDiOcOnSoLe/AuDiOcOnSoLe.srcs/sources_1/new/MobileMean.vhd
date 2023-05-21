--------DEFAULT LIBRARIES-----------
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
    use IEEE.MATH_REAL.ALL;
------------------------------------

---------------------------------------CODE EXPLANATION----------------------------------------------
-- The mobile mean is implemented by storing the oncoming data in a shift register made of
-- AVERAGING_WINDOW_SIZE elements, such elements are also added to a SUM_TOTAL register
-- as soon as they arrive, while the last element of the shif register is
-- always subtracted from the SUM_TOTAL register. In this way each clock cycle only a sum and a 
-- subtraction are performed. Each clock edge the values in the shif register are shifted by one position.
-- In order to implement the power of 2 division, just the 24 MSB of the SUM_TOTAL register are taken
-- and sent on the data bus.

-- FSM EXPLANATION, same as other modules, can avoid reading it if already did :)
-- This VHDL code implements a 4-state finite state machine to handle data receiving/processing/transmitting in a serial manner.
-- The machine waits for data of both channels and performs appropriate processing before transmitting it.
-- The choice of a 4-state finite state machine is justified by the nature of the input data, which arrives in a sequential manner,
-- since left and right channels data is known to arrive one after the other in a single packet.
-- By employing a serial approach, we ensure the safety and simplicity of data handling.
-- Additionally, employing serial data transmission simplifies the design and implementation of the system
-- by eliminating the need for complex parallel data handling mechanisms.
-- This is possible considering that the frequency of the AXI protocol clock is significantly higher than that of the audio signals.
-- Overall, this design choice optimizes data handling efficiency while ensuring reliability and ease of implementation.
-----------------------------------------------------------------------------------------------------

entity MobileMean is
    Generic(
        -- AXIS data bus width
        AXIS_TDATA_WIDTH        : integer	:= 24;
        -- Averaging window size
        AVERAGING_WINDOW_SIZE   : integer   := 32
    );
    Port (
        -- Clock and reset
        aclk             :   in   STD_LOGIC;   
        aresetn         :   in   STD_LOGIC;  

        ------------AXI4-Stream--slave-------------
        S_AXIS_TVALID	:   in   STD_LOGIC;
        -- Data coming from the master
        S_AXIS_TDATA	:   in 	 STD_LOGIC_VECTOR(AXIS_TDATA_WIDTH-1 DOWNTO 0);
        -- TREADY indicates that the slave can accept a transfer in the current cycle
        S_AXIS_TREADY	:   out  STD_LOGIC := '0';
        -- AXI4Stream TLAST to distinguish between left and right channel
        S_AXIS_TLAST	:   in   STD_LOGIC;
        --------------------------------------------

        ------------AXI4-Stream--master-------------
        M_AXIS_TREADY	:   in 	 STD_LOGIC;
        -- Data output
        M_AXIS_TDATA	:   out  STD_LOGIC_VECTOR(AXIS_TDATA_WIDTH-1 DOWNTO 0) := (Others =>'0');
        -- AXI4Stream TLAST to distinguish between left and right channel
        M_AXIS_TLAST	:   out  STD_LOGIC;
        --TVALID indicates if data on the bus is valid
        M_AXIS_TVALID	:   out  STD_LOGIC := '0';
        --------------------------------------------
        
        -- Input enable signal
        filter_enable : in std_logic

     );
end MobileMean;

architecture Behavioral of MobileMean is

    --------------------------------------SIGNALS & CONSTANTS----------------------------------------
    -- Length of the sum register, which stores the sum of all the window elements 
    constant SUM_TOTAL_LENGTH : positive := (AXIS_TDATA_WIDTH + positive(ceil(log2(real(AVERAGING_WINDOW_SIZE)))));

    -- Registers that store the sum
    signal SUM_TOTAL_L : signed(SUM_TOTAL_LENGTH-1 downto 0) := (others => '0');
    signal SUM_TOTAL_R : signed(SUM_TOTAL_LENGTH-1 downto 0) := (others => '0') ;

    -- Internal signals for the AXI protocol
    signal M_AXIS_TVALID_int : std_logic := '0';
    signal M_AXIS_TLAST_int : std_logic;
    signal S_AXIS_TREADY_int : std_logic := '0';
    signal M_AXIS_TDATA_int : std_logic_vector(AXIS_TDATA_WIDTH-1 downto 0) := (others => '0');

    -- Register for the result of the R channel
    signal DATA_R : std_logic_vector(AXIS_TDATA_WIDTH-1 downto 0) := (others => '0');

    -- Shift registers for the L and R channels
    type SHIFT_REG  is array(0 TO AVERAGING_WINDOW_SIZE-1) of STD_LOGIC_VECTOR(AXIS_TDATA_WIDTH-1 downto 0);
    signal mem_L : SHIFT_REG := (others => (others => '0'));
    signal mem_R : SHIFT_REG := (others => (others => '0'));  

    -- states for the state machine
	type state_type is (RECEIVE_L, RECEIVE_R, SEND_L, SEND_R);
	signal state     : state_type := RECEIVE_L;
    -------------------------------------------------------------------------------------------------

begin

    -- FSM process
    FSM : process (aresetn, aclk)
    begin
        if aresetn = '0' then
        
        elsif rising_edge(aclk) then

            -- this mux for the filter_en can't be performed in DATAFLOW,
            -- since after implementation the total negative slack is non null due to longer signals path for clock >=180MHz
            -- a register is needed since I'm not able to perform path optimization :(
            case filter_enable is 
                when '0' => 
                            M_AXIS_TDATA <= S_AXIS_TDATA; 
                            M_AXIS_TVALID <= S_AXIS_TVALID;
                            S_AXIS_TREADY <= M_AXIS_TREADY;
                            M_AXIS_TLAST <= S_AXIS_TLAST;
                when '1' =>
                            M_AXIS_TDATA <= M_AXIS_TDATA_int; 
                            M_AXIS_TVALID <= M_AXIS_TVALID_int;
                            S_AXIS_TREADY <= S_AXIS_TREADY_int;
                            M_AXIS_TLAST <= M_AXIS_TLAST_int;
            end case;

            case state is

                when RECEIVE_L =>

                    -- process the data only if TVALID = '1', TLAST discriminates between channels 
                    if S_AXIS_TLAST = '0' and filter_enable = '1' and S_AXIS_TVALID = '1' then

                        ------------------------------------AVG VALUE CALCULATION-----------------------------------------
                        -- fill the first position of the memory with the oncoming data
                        mem_L <= S_AXIS_TDATA & mem_L(0 to AVERAGING_WINDOW_SIZE-2);
                        -- oncoming data is always summed to the total, last element of the memory is subtracted
                        SUM_TOTAL_L <= SUM_TOTAL_L + signed(std_logic_vector(resize(signed(S_AXIS_TDATA),SUM_TOTAL_LENGTH))) 
                                                   - signed(std_logic_vector(resize(signed(mem_L(AVERAGING_WINDOW_SIZE-1)),SUM_TOTAL_LENGTH)));
                        --------------------------------------------------------------------------------------------------
                        
                        -- the division is implemented by taking the 24 MSBs of the total register
                        -- and the result is put on the axis bus
                        M_AXIS_TDATA_int <= std_logic_vector(SUM_TOTAL_L(SUM_TOTAL_LENGTH-1 downto SUM_TOTAL_LENGTH-AXIS_TDATA_WIDTH));
                        
                        -- ready to receive the next data
                        S_AXIS_TREADY_int <= '1';
                        -- go to receive right state
                        state <= RECEIVE_R; 
                    end if;

                when RECEIVE_R => 

                    if S_AXIS_TLAST = '1' and filter_enable = '1' and S_AXIS_TVALID = '1' then

                        ------------------------------------AVG VALUE CALCULATION-----------------------------------------
                        -- same calculation as before but for the other channel
                        mem_R <= S_AXIS_TDATA & mem_R(0 to AVERAGING_WINDOW_SIZE-2);
                        SUM_TOTAL_R <= SUM_TOTAL_R + signed(std_logic_vector(resize(signed(S_AXIS_TDATA),SUM_TOTAL_LENGTH))) 
                                                   - signed(std_logic_vector(resize(signed(mem_R(AVERAGING_WINDOW_SIZE-1)),SUM_TOTAL_LENGTH)));                            
                        --------------------------------------------------------------------------------------------------
                        
                        -- the division is implemented by taking the 24 MSBs of the total register
                        -- and the result is saved on a dedicated register
                        DATA_R <= std_logic_vector(SUM_TOTAL_R(SUM_TOTAL_LENGTH-1 downto SUM_TOTAL_LENGTH-AXIS_TDATA_WIDTH));

                        -- don't receive any more data
                        S_AXIS_TREADY_int <= '0';
                        -- writing on the L channel
                        M_AXIS_TLAST_int <= '0';
                        -- ready to send data, set master valid to '1'
                        M_AXIS_TVALID_int <= '1';
                        -- set the next state to be the sending of the left data
                        state <= SEND_L;     
                    end if;
                   
                when SEND_L =>

                    -- if slave is ready, means it read the data on the bus, put new data on the bus and change state
                    if M_AXIS_TREADY = '1' then
                        -- writing on the R channel
                        M_AXIS_TLAST_int <= '1';
                        -- when the elaboration of the right channel is done, the data can be send in the next clock phase
                        M_AXIS_TDATA_int <= DATA_R;
                        -- set the next state to be the receiving of data
                        state <= SEND_R;
                    end if;

                when SEND_R =>

                    -- if slave is ready, means it read the data on the bus, go back to receive state
                    if M_AXIS_TREADY = '1' then
                        -- invalidate the data on the line
                        M_AXIS_TVALID_int <= '0';
                        -- ready to read the signal from the bus
                        S_AXIS_TREADY_int <= '1';
                        -- set the next state to be the receiving of data
                        state <= RECEIVE_L;
                    end if;
                    
            end case;

        end if;    
    end process;
end Behavioral;
