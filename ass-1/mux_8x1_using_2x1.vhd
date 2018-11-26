----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:10 11/14/2018 
-- Design Name: 
-- Module Name:    mux_8x1_using_2x1 - Behavioral 
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

entity mux_8x1_using_2x1 is
    Port ( J0 : in  STD_LOGIC;
           J1 : in  STD_LOGIC;
           J2 : in  STD_LOGIC;
           J3 : in  STD_LOGIC;
           J4 : in  STD_LOGIC;
           J5 : in  STD_LOGIC;
           J6 : in  STD_LOGIC;
           J7 : in  STD_LOGIC;
           SJ0 : in  STD_LOGIC;
           SJ1 : in  STD_LOGIC;
           SJ2 : in  STD_LOGIC;
           FF : out  STD_LOGIC);
end mux_8x1_using_2x1;

architecture Behavioral of mux_8x1_using_2x1 is

component mux_2x1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           F : out  STD_LOGIC);
end component;

signal SG0, SG1, SG2, SG3, SG4, SG5 : STD_LOGIC;

begin

M1 : mux_2x1 port map (J0, J1, SJ0, SG0);
M2 : mux_2x1 port map (J2, J3, SJ0, SG1);
M3 : mux_2x1 port map (J4, J5, SJ0, SG2);
M4 : mux_2x1 port map (J6, J7, SJ0, SG3);
M5 : mux_2x1 port map (SG0, SG1, SJ1, SG4);
M6 : mux_2x1 port map (SG2, SG3, SJ1, SG5);
M7 : mux_2x1 port map (SG4, SG5, SJ2, FF);

end Behavioral;

