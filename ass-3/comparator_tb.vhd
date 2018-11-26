--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:43:47 11/22/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-3/comparator_tb.vhd
-- Project Name:  ass-3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator_8
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
 
ENTITY comparator_tb IS
END comparator_tb;
 
ARCHITECTURE behavior OF comparator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator_8
    PORT(
         IP_A : IN  std_logic_vector(7 downto 0);
         IP_B : IN  std_logic_vector(7 downto 0);
         SEL : IN  std_logic;
         X1 : OUT  std_logic;
         X2 : OUT  std_logic;
         X3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IP_A : std_logic_vector(7 downto 0) := (others => '0');
   signal IP_B : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL : std_logic := '0';

 	--Outputs
   signal X1 : std_logic;
   signal X2 : std_logic;
   signal X3 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator_8 PORT MAP (
          IP_A => IP_A,
          IP_B => IP_B,
          SEL => SEL,
          X1 => X1,
          X2 => X2,
          X3 => X3
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	IP_A <= "10110101";
	IP_B <= "00110101";
	
	SEL <= '1';
	wait for 100ns;
	-- MSB of IP_A is 1.
	-- So, IP_A (negative number) < IP_B for signed numbers
	
	SEL <= '0';
	wait for 100ns;
	-- IP_A > IP_B for unsigned numbers
	
	IP_A <= "10000000";
	IP_B <= "10110101";
	
	
	SEL <= '1';
	wait for 100ns;
	-- MSB of IP_A and IP_B is 1. Hence both are negative.
	-- 2's complement of IP_A = -128, IP_B = -75
	-- So, IP_A < IP_B for signed numbers
	
	SEL <= '0';
	wait for 100ns;
	-- IP_A < IP_B for unsigned numbers

      wait;
   end process;

END;
