--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:54:37 11/15/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-1/four_bit_parallel_adder_tb.vhd
-- Project Name:  ass-1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: four_bit_parallel_adder_by_full_adder
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
 
ENTITY four_bit_parallel_adder_tb IS
END four_bit_parallel_adder_tb;
 
ARCHITECTURE behavior OF four_bit_parallel_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT four_bit_parallel_adder_by_full_adder
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         A3 : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         B2 : IN  std_logic;
         B3 : IN  std_logic;
         Cin : in  STD_LOGIC;
         SUM0 : OUT  std_logic;
         SUM1 : OUT  std_logic;
         SUM2 : OUT  std_logic;
         SUM3 : OUT  std_logic;
         CY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal SUM0 : std_logic;
   signal SUM1 : std_logic;
   signal SUM2 : std_logic;
   signal SUM3 : std_logic;
   signal CY : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: four_bit_parallel_adder_by_full_adder PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3,
			 Cin => Cin,
          SUM0 => SUM0,
          SUM1 => SUM1,
          SUM2 => SUM2,
          SUM3 => SUM3,
          CY => CY
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
--      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		
		--				1010    = A
		--			+	1000    = B
		-------------------
		--			   0010    = SUM
		--						1 = CY
		
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		A3 <= '1';
		
		B0 <= '0';
		B1 <= '0';
		B2 <= '0';
		B3 <= '1';
		
		wait for 100 ns;	
		
		
		--				0011    = A
		--			+	0110    = B
		-------------------
		--			   1001    = SUM
		--						0 = CY
		
		A0 <= '1';
		A1 <= '1';
		A2 <= '0';
		A3 <= '0';
		
		B0 <= '0';
		B1 <= '1';
		B2 <= '1';
		B3 <= '0';
		
		wait for 100 ns;	
		
		
		--				1111    = A
		--			+	1111    = B
		-------------------
		--			   1110    = SUM
		--						1 = CY
		
		A0 <= '1';
		A1 <= '1';
		A2 <= '1';
		A3 <= '1';
		
		B0 <= '1';
		B1 <= '1';
		B2 <= '1';
		B3 <= '1';

      wait;
   end process;

END;
