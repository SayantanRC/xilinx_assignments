----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:46 11/14/2018 
-- Design Name: 
-- Module Name:    full_adder_using_half_adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_using_half_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cy : out  STD_LOGIC);
end full_adder_using_half_adder;

architecture Behavioral of full_adder_using_half_adder is

component half_adder is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C : out  STD_LOGIC);
end component;

signal SG0, SG1, SG2 : STD_LOGIC;

begin

HA0 : half_adder port map (A, B, SG0, SG1);
HA1 : half_adder port map (SG0, Cin, S, SG2);

Cy <= SG1 OR SG2;


end Behavioral;

