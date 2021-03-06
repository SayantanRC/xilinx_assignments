--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:02:51 11/23/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-3/mod10_counter_tb.vhd
-- Project Name:  ass-3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mod10_counter
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
 
ENTITY mod10_counter_tb IS
END mod10_counter_tb;
 
ARCHITECTURE behavior OF mod10_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod10_counter
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector (3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 50 ns;
 
BEGIN
	
	-- Instantiate the Unit Under Test (UUT)
   uut: mod10_counter PORT MAP (
          CLK => CLK,
          RST => RST,
          Q => Q
        );
 
   -- press RST for a short time
	process
	begin
	RST <= '1';
	wait for 5ns;
	RST <= '0';
	wait;
	end process;

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	

END;