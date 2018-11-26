----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:17 11/23/2018 
-- Design Name: 
-- Module Name:    mod10_counter - Behavioral 
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

entity mod10_counter is
    Port ( CLK : in  STD_LOGIC;
	        RST : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end mod10_counter;

architecture Behavioral of mod10_counter is

component T_FF is
    Port ( T : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end component;

-- signals to hold outout value from T flip flops
signal s : STD_LOGIC_VECTOR (3 downto 0) := "0000";
-- this can be easily avoided by making Q as 'inout'
-- but that is not a good practice

-- temp signal to store value of RST
signal r : STD_LOGIC := '0';

begin



process (CLK, RST, s) is
-- sensitivity list (variables in brackets) contain 's'
-- this ensures that when 's' = "1010" the process is executed
-- and r (works like RST) is made = '1'
begin
if ( s = "1010" or RST = '1') then
	r <= '1';
else
	r <= '0';
end if;
end process;

T0 : T_FF port map ('1', s(0), CLK, r);
Q(0) <= s(0);
T1 : T_FF port map ('1', s(1), s(0), r);
Q(1) <= s(1);
T2 : T_FF port map ('1', s(2), s(1), r);
Q(2) <= s(2);
T3 : T_FF port map ('1', s(3), s(2), r);
Q(3) <= s(3);
	
end Behavioral;