--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:30:24 11/14/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-1/mux_8x1_tb.vhd
-- Project Name:  ass-1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_8x1_using_2x1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_8x1_tb IS
END mux_8x1_tb;
 
ARCHITECTURE behavior OF mux_8x1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8x1_using_2x1
    PORT(
         J0 : IN  std_logic;
         J1 : IN  std_logic;
         J2 : IN  std_logic;
         J3 : IN  std_logic;
         J4 : IN  std_logic;
         J5 : IN  std_logic;
         J6 : IN  std_logic;
         J7 : IN  std_logic;
         SJ0 : IN  std_logic;
         SJ1 : IN  std_logic;
         SJ2 : IN  std_logic;
         FF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J0 : std_logic := '0';
   signal J1 : std_logic := '0';
   signal J2 : std_logic := '0';
   signal J3 : std_logic := '0';
   signal J4 : std_logic := '0';
   signal J5 : std_logic := '0';
   signal J6 : std_logic := '0';
   signal J7 : std_logic := '0';
   signal SJ0 : std_logic := '0';
   signal SJ1 : std_logic := '0';
   signal SJ2 : std_logic := '0';

 	--Outputs
   signal FF : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8x1_using_2x1 PORT MAP (
          J0 => J0,
          J1 => J1,
          J2 => J2,
          J3 => J3,
          J4 => J4,
          J5 => J5,
          J6 => J6,
          J7 => J7,
          SJ0 => SJ0,
          SJ1 => SJ1,
          SJ2 => SJ2,
          FF => FF
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		
		J0 <= '0';
		J1 <= '0';
		J2 <= '0';
		J3 <= '0';
		J4 <= '1';
		J5 <= '0';
		J6 <= '0';
		J7 <= '0';
		SJ0 <= '0';
		SJ1 <= '0';
		SJ2 <= '1';
		
		-- should be 1
		
		wait for 100 ns;	
		
		J0 <= '0';
		J1 <= '0';
		J2 <= '1';
		J3 <= '0';
		J4 <= '0';
		J5 <= '0';
		J6 <= '0';
		J7 <= '0';
		SJ0 <= '0';
		SJ1 <= '1';
		SJ2 <= '0';
		
		-- should be 1
		
		wait for 100 ns;	
		
		J0 <= '1';
		J1 <= '1';
		J2 <= '1';
		J3 <= '1';
		J4 <= '1';
		J5 <= '1';
		J6 <= '0';
		J7 <= '1';
		SJ0 <= '0';
		SJ1 <= '1';
		SJ2 <= '1';
		
		--should be 0
		
      wait;
   end process;

END;
