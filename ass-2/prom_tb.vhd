--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:56:03 11/22/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-2/prom_tb.vhd
-- Project Name:  ass-2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: prom
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
 
ENTITY prom_tb IS
END prom_tb;
 
ARCHITECTURE behavior OF prom_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prom
    PORT(
         I : IN  std_logic_vector(2 downto 0);
         F1 : OUT  std_logic;
         F2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I :
	std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal F1 : std_logic;
   signal F2 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prom PORT MAP (
          I => I,
          F1 => F1,
          F2 => F2
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
	I <= "000";
	wait for 100ns;
	-- F1 = 0; F2 = 0;
	
	I <= "110";
	wait for 100ns;
	-- F1 = 1; F2 = 1;
	
	I <= "111";
	wait for 100ns;
	-- F1 = 1; F2 = 1;
	
	I <= "010";
	wait for 100ns;
	-- F1 = 1; F2 = 0;
	
	I <= "011";
	wait for 100ns;
	-- F1 = 0; F2 = 1;

      wait;
   end process;

END;
