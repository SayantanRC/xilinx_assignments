--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:02:27 11/23/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-3/shift_register_tb.vhd
-- Project Name:  ass-3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_register_4bit
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
 
ENTITY shift_register_tb IS
END shift_register_tb;
 
ARCHITECTURE behavior OF shift_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_register_4bit
    PORT(
         D : IN  std_logic;
         D_FF0 : inout  STD_LOGIC;
         D_FF1 : inout  STD_LOGIC;
         D_FF2 : inout  STD_LOGIC;
         Q : OUT  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal D_FF0 : std_logic;
   signal D_FF1 : std_logic;
   signal D_FF2 : std_logic;
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_register_4bit PORT MAP (
          D => D,
			 D_FF0 => D_FF0,
			 D_FF1 => D_FF1,
			 D_FF2 => D_FF2,
          Q => Q,
          CLK => CLK,
          RST => RST
        );

	-- each process runs independently

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 

		D <= '0';
		wait for 20ns;

		D <= '1';
		wait for 40ns;

		D <= '0';
		wait for 22ns;

		D <= '1';
		wait for 30ns;

		D <= '0';
		wait for 25ns;

   end process;
	
	-- process to set RST to high periodically
	-- this resets all flip flops to 0
	process
	begin
	
		RST <= '1';
		wait for 5ns;
		RST <= '0';
		wait for 250ns;
	
	end process;
END;
