----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:15 11/23/2018 
-- Design Name: 
-- Module Name:    shift_register_4bit - Behavioral 
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

entity shift_register_4bit is
    Port ( D : in  STD_LOGIC;
			-- signals between two D flip flops
           D_FF0 : inout  STD_LOGIC;
           D_FF1 : inout  STD_LOGIC;
           D_FF2 : inout  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end shift_register_4bit;

architecture Behavioral of shift_register_4bit is

component D_FF is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end component;


begin

D0 : D_FF port map (D, D_FF0, CLK, RST);
D1 : D_FF port map (D_FF0, D_FF1, CLK, RST);
D2 : D_FF port map (D_FF1, D_FF2, CLK, RST);
D3 : D_FF port map (D_FF2, Q, CLK, RST);

end Behavioral;

