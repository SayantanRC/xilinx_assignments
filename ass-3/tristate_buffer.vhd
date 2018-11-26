----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:55:01 11/22/2018 
-- Design Name: 
-- Module Name:    tristate_buffer - Behavioral 
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

entity tristate_buffer is
    Port ( IP : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : out  STD_LOGIC_VECTOR (7 downto 0);
           E : in  STD_LOGIC);
end tristate_buffer;

architecture Behavioral of tristate_buffer is
begin
process (E,IP) is
begin

if (E = '0') then
	OP <= IP;
else
	OP <= "ZZZZZZZZ";
end if;

end process;
end Behavioral;

