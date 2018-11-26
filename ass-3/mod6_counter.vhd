----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:17 11/23/2018 
-- Design Name: 
-- Module Name:    mod9_counter - Behavioral 
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

entity mod6_counter is
    Port ( CLK : in  STD_LOGIC;
	        RST : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end mod6_counter;

architecture Behavioral of mod6_counter is

component T_FF is
    Port ( T : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end component;

-- signals to hold outout value from T flip flops
signal s : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal r : STD_LOGIC := '0';

begin



process (CLK, RST, s) is
begin
if ( s = "110" or RST = '1') then
	r <= '1';
else
	r <= '0';
end if;
end process;

-- here we need only 3 flip flops
T0 : T_FF port map ('1', s(0), CLK, r);
T1 : T_FF port map ('1', s(1), s(0), r);
T2 : T_FF port map ('1', s(2), s(1), r);

-- we need only the last output 
-- i.e frequency divided by 6
Q <= s(2);
	
end Behavioral;

