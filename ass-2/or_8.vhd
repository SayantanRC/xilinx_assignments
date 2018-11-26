----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:57:34 11/22/2018 
-- Design Name: 
-- Module Name:    or_8 - Behavioral 
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

entity or_8 is
    Port ( I : in  STD_LOGIC_VECTOR (7 downto 0);
           F : out  STD_LOGIC);
end or_8;

architecture Behavioral of or_8 is

begin

F <= I(0) OR I(1) OR I(2) OR I(3) OR I(4) OR I(5) OR I(6) OR I(7);

end Behavioral;

