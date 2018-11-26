----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:48 11/21/2018 
-- Design Name: 
-- Module Name:    pla - Behavioral 
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

entity pla is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC);
end pla;

-- PLA basics: https://www.youtube.com/watch?v=jrQ1YYgiOTo

-- We are designing 2 functions with minterms:
-- Y1(ABC) = m(4,5,7)
-- Y2(ABC) = m(3,5,7)
-- On simpifying
-- Y1 = AB' + AC
-- Y2 = BC + AC

-- So, number of AND gates = 
-- number of unique AND expressions
-- in Y1 and Y2 combined (AB', AC, BC) = 3

-- Number of OR gates = 
-- number of functions (Y1 and Y2) = 2

architecture Behavioral of pla is

component and_2 is
    Port ( I0 : in  STD_LOGIC;
	        I1 : in  STD_LOGIC;
           F : out  STD_LOGIC);
end component;

component or_2 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           F : out  STD_LOGIC);
end component;

-- 3 signals from o/p of 3 AND gates
signal s1, s2, s3 : STD_LOGIC;

begin

-- AND gate will be for expressions AB', AC, BC
a1 : and_2 port map (A, (not B), s1);
a2 : and_2 port map (A, C, s2);
a3 : and_2 port map (B, C, s3);

-- Finally, OR gates for functions Y1 and Y2
o1 : or_2 port map (s1, s2, Y1);
o2 : or_2 port map (s3, s2, Y2);

end Behavioral;

