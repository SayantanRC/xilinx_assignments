--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:39:07 11/21/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-2/pal_tb.vhd
-- Project Name:  ass-2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pal
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
 
ENTITY pal_tb IS
END pal_tb;
 
ARCHITECTURE behavior OF pal_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pal
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         Y1 : OUT  std_logic;
         Y2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Y1 : std_logic;
   signal Y2 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pal PORT MAP (
          A => A,
          B => B,
          C => C,
          Y1 => Y1,
          Y2 => Y2
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	A <= '0';
	B <= '1';
	C <= '0';
	wait for 100ns;
	-- Y1 = 1, Y2 = 0
	
	A <= '1';
	B <= '0';
	C <= '1';
	wait for 100ns;
	-- Y1 = 1, Y2 = 1
	
	A <= '1';
	B <= '1';
	C <= '1';
	wait for 100ns;
	-- Y1 = 1, Y2 = 0
	
	A <= '0';
	B <= '0';
	C <= '0';
	wait for 100ns;
	-- Y1 = 0, Y2 = 1
	
	A <= '1';
	B <= '0';
	C <= '0';
	wait for 100ns;
	-- Y1 = 0, Y2 = 0

      wait;
   end process;

END;
