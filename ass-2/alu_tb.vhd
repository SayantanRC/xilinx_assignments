--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:49:20 11/21/2018
-- Design Name:   
-- Module Name:   /home/sayantan/xilinx working dir/ass-2/alu_tb.vhd
-- Project Name:  ass-2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_4bit
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
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         CY_FLAG : OUT  std_logic;
         SEL : IN  std_logic_vector(2 downto 0);
         Z : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal SEL : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal CY_FLAG : std_logic;
   signal Z : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_4bit PORT MAP (
          A => A,
          B => B,
          CY_FLAG => CY_FLAG,
          SEL => SEL,
          Z => Z
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

A <= "1011";
B <= "1111";

SEL <= "000";
wait for 100 ns;
--addition; should be: Z = 1010, CY_FLAG = 1

SEL <= "001";
wait for 100 ns;
--subtraction
--note that A < B
--should be: Z = 0100, CY_FLAG = 1

SEL <= "010";
wait for 100 ns;
--AND; should be: Z = 1011, CY_FLAG = 0

SEL <= "011";
wait for 100 ns;
--OR; should be: Z = 1111, CY_FLAG = 0

SEL <= "100";
wait for 100 ns;
--NOT A; should be: Z = 0100, CY_FLAG = 0

SEL <= "101";
wait for 100 ns;
--XOR; should be: Z = 0100, CY_FLAG = 0

SEL <= "110";
wait for 100 ns;
--A + 1; should be: Z = 1100, CY_FLAG = 0

SEL <= "111";
wait for 100 ns;
--B + 1; should be: Z = 0000, CY_FLAG = 1


A <= "1110";
B <= "0111";

SEL <= "000";
wait for 100 ns;
--addition; should be: Z = 0101, CY_FLAG = 1

SEL <= "001";
--subtraction again, this time with A > B
--should be: Z = 0111, CY_FLAG = 0

      wait;
   end process;

END;
