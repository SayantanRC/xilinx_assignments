----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:35:48 11/22/2018 
-- Design Name: 
-- Module Name:    comparator_8 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_8 is
    Port ( IP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           IP_B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           X1 : out  STD_LOGIC;
           X2 : out  STD_LOGIC;
           X3 : out  STD_LOGIC);
end comparator_8;

architecture Behavioral of comparator_8 is
begin

process (IP_A, IP_B, SEL) is
begin

if ( SEL = '1' ) then
	if ( signed(IP_A) > signed(IP_B) ) then
		X1 <= '1'; X2 <= '0'; X3 <= '0';
	elsif ( signed(IP_A) = signed(IP_B) ) then
		X1 <= '0'; X2 <= '1'; X3 <= '0';
	else
		X1 <= '0'; X2 <= '0'; X3 <= '1';
	end if;
else
	if ( unsigned(IP_A) > unsigned(IP_B) ) then
		X1 <= '1'; X2 <= '0'; X3 <= '0';
	elsif ( unsigned(IP_A) = unsigned(IP_B) ) then
		X1 <= '0'; X2 <= '1'; X3 <= '0';
	else
		X1 <= '0'; X2 <= '0'; X3 <= '1';
	end if;
end if;


end process;
end Behavioral;

