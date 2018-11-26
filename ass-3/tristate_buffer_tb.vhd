--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:56:24 11/22/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-3/tristate_buffer_tb.vhd
-- Project Name:  ass-3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tristate_buffer
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
 
ENTITY tristate_buffer_tb IS
END tristate_buffer_tb;
 
ARCHITECTURE behavior OF tristate_buffer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tristate_buffer
    PORT(
         IP : IN  std_logic_vector(7 downto 0);
         OP : OUT  std_logic_vector(7 downto 0);
         E : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IP : std_logic_vector(7 downto 0) := (others => '0');
   signal E : std_logic := '0';

 	--Outputs
   signal OP : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tristate_buffer PORT MAP (
          IP => IP,
          OP => OP,
          E => E
        );

   -- Stimulus process
   stim_proc: process
   begin

IP <= "00110101";
E <= '0';
wait for 100ns;
-- OP = IP

IP <= "00111101";
E <= '1';
wait for 100ns;
-- OP = "ZZZZZZZZ"

IP <= "00111101";
E <= '0';
wait for 100ns;
-- OP = IP

IP <= "01000001";
E <= '0';
wait for 100ns;
-- OP = IP

E <= '1';
wait for 100ns;
-- OP = "ZZZZZZZZ"

E <= '0';
wait for 100ns;
-- OP = IP


      wait;
   end process;

END;
