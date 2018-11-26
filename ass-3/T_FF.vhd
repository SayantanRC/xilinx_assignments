----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:08:03 11/23/2018 
-- Design Name: 
-- Module Name:    T_FF - Behavioral 
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

entity T_FF is
    Port ( T : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end T_FF;

architecture Behavioral of T_FF is

begin

process (CLK, RST) is
-- initialize a variable to store last value
variable PREVIOUS : STD_LOGIC := '0';
begin

if (RST = '1') then
	Q <= '0';
	PREVIOUS := '0';
elsif (falling_edge(CLK) and T = '1') then
	-- negative edge triggered flip flop
	-- useful for up counting
	Q <= (not PREVIOUS);
	PREVIOUS := (not PREVIOUS);
end if;

end process;

end Behavioral;

