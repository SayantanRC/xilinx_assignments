----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:23:31 11/22/2018 
-- Design Name: 
-- Module Name:    prom - Behavioral 
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

entity prom is
    Port ( I : in  STD_LOGIC_VECTOR (2 downto 0);
           F1 : out  STD_LOGIC;
           F2 : out  STD_LOGIC);
end prom;

-- https://www.youtube.com/watch?v=zaLPKUVffjY

-- We are designing 2 functions with minterms:
-- F1(ABC) = m(2,5,6,7)
-- F2(ABC) = m(3,6,7)

-- We would need a decoder and 2 OR gates (for 2 functions)

architecture Behavioral of prom is

component decoder_3x8 is
    Port ( I : in  STD_LOGIC_VECTOR (2 downto 0);
			  O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component or_8 is
    Port ( I : in  STD_LOGIC_VECTOR (7 downto 0);
           F : out  STD_LOGIC);
end component;

-- signal to record decoder output
signal dop : STD_LOGIC_VECTOR (7 downto 0);

begin

D : decoder_3x8 port map (I, dop);

-- We would pass the required bit from 'dop' to or_8 gate
-- For example, for F1, required bits are bit 2,5,6,7
-- Only when any of these bits are high in 'dop', F1 = 1
O1 : or_8 port map ("00" & dop(2) & "00" & dop(5) & dop(6) & dop(7), F1);
O2 : or_8 port map ("000" & dop(3) & "00" & dop(6) & dop(7), F2);

end Behavioral;

