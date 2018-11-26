--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:14:29 11/15/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-1/adder_32_bit_tb.vhd
-- Project Name:  ass-1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder_32_bit_using_4_bit_adder
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
 
ENTITY adder_32_bit_tb IS
END adder_32_bit_tb;
 
ARCHITECTURE behavior OF adder_32_bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_32_bit_using_4_bit_adder
    PORT(
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (31 downto 0);
           CY : out  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector (31 downto 0);
   signal B : std_logic_vector (31 downto 0);
   signal Cin : std_logic := '0';

 	--Outputs
   signal SUM : std_logic_vector (31 downto 0);
   signal CY : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder_32_bit_using_4_bit_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          SUM => SUM,
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
		
		
		A <= "01110000011110000110110101101000";
		B <= "01010011100100110100011001000011";
		wait for 500 ns;	
		
		
		A <= "11000010010110100101010100001111";
		B <= "11110011101100111011010111011011";
		wait for 500 ns;	
		
      wait;
   end process;

END;
