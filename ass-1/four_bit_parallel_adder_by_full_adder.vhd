----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:48:39 11/15/2018 
-- Design Name: 
-- Module Name:    four_bit_parallel_adder_by_full_adder - Behavioral 
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

entity four_bit_parallel_adder_by_full_adder is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           B3 : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM0 : out  STD_LOGIC;
           SUM1 : out  STD_LOGIC;
           SUM2 : out  STD_LOGIC;
           SUM3 : out  STD_LOGIC;
           CY : out  STD_LOGIC);
end four_bit_parallel_adder_by_full_adder;

architecture Behavioral of four_bit_parallel_adder_by_full_adder is

component full_adder_using_half_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cy : out  STD_LOGIC);
end component;

signal C0, C1, C2 : STD_LOGIC;

begin

FA0 : full_adder_using_half_adder port map (A0, B0, Cin, SUM0, C0);
FA1 : full_adder_using_half_adder port map (A1, B1, C0, SUM1, C1);
FA2 : full_adder_using_half_adder port map (A2, B2, C1, SUM2, C2);
FA3 : full_adder_using_half_adder port map (A3, B3, C2, SUM3, CY);

end Behavioral;

