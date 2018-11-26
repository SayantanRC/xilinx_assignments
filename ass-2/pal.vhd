----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:07:36 11/21/2018 
-- Design Name: 
-- Module Name:    pal - Behavioral 
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

entity pal is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC);
end pal;

-- PAL basics: https://www.youtube.com/watch?v=qlq4NHk5Y_w

-- We are designing 2 functions with minterms:
-- Y1(ABC) = m(2,3,5,7)
-- Y2(ABC) = m(0,1,5)
-- On simpifying
-- Y1 = A'B + AC
-- Y2 = A'B' + B'C

-- So, number of AND gates = 
-- number of variables * number of func. = 3*2 = 6

-- Number of OR gates = 
-- number of functions (Y1 and Y2) = 2

architecture Behavioral of pal is

component and_2 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           F : out  STD_LOGIC);
end component;

component or_3 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           F : out  STD_LOGIC);
end component;

-- 6 signals from o/p of each AND gate
signal s1, s2, s3, s4, s5, s6 : STD_LOGIC := '0';

begin

-- AND gate will be for expressions A'B, AC, A'B', B'C
-- For Y1:
a1 : and_2 port map ((not A), B, s1);
a2 : and_2 port map (A, C, s2);
-- Y1 does not have any other expression, so no "a3" gate
-- For Y2
a4 : and_2 port map ((not A), (not B), s4);
a5 : and_2 port map ((not B), C, s5);
-- similarly no "a6" gate, as we don't need

-- A PAL, has fixed OR gates.
-- For each OR gate, 
-- number of input = number of variables = 3
-- These inputs are from previous AND gates.
-- Outputs give the function results.
o1 : or_3 port map (s1, s2, s3, Y1);
o2 : or_3 port map (s4, s5, s6, Y2);


end Behavioral;

