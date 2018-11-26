----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:48 11/21/2018 
-- Design Name: 
-- Module Name:    alu_4bit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_4bit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           CY_FLAG : out  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end alu_4bit;

-- DESIGN is as follows:

-- Select(SEL)			Operation			Carry flag(CY_FLAG)

-- 000					A + B					Overflow bit
-- 001					A - B					'1' if A > B
-- 010					A AND B				'0'
-- 011					A OR B				'0'
-- 100					NOT A					'0'
-- 101					A XOR B				'0'
-- 110					A + 1					Overflow bit (if any)
-- 111					B + 1					Overflow bit (if any)

architecture Behavioral of alu_4bit is
begin

process (A, B, SEL) is
variable sum_5bit : STD_LOGIC_VECTOR (4 downto 0);
begin

case SEL is

when "000" => -- addition
sum_5bit := STD_LOGIC_VECTOR (unsigned("0" & A) + unsigned("0" & B));
Z <= sum_5bit(3 downto 0);
CY_FLAG <= sum_5bit(4);

when "001" => -- subtraction
if (unsigned(A) >= unsigned(B)) then
	Z <= STD_LOGIC_VECTOR (unsigned(A) - unsigned(B));
	CY_FLAG <= '0';
else
	Z <= STD_LOGIC_VECTOR (unsigned(B) - unsigned(A));
	CY_FLAG <= '1';
end if;

when "010" => -- A AND B
Z <= A AND B;
CY_FLAG <= '0';

when "011" => -- A OR B
Z <= A OR B;
CY_FLAG <= '0';

when "100" => -- NOT A
Z <= NOT A;
CY_FLAG <= '0';

when "101" => -- A XOR B
Z <= A XOR B;
CY_FLAG <= '0';

when "110" => -- A + 1
sum_5bit := STD_LOGIC_VECTOR (unsigned("0" & A) + "00001");
Z <= sum_5bit(3 downto 0);
CY_FLAG <= sum_5bit(4);

when "111" => -- B + 1
sum_5bit := STD_LOGIC_VECTOR (unsigned("0" & B) + "00001");
Z <= sum_5bit(3 downto 0);
CY_FLAG <= sum_5bit(4);

when others =>
NULL;

end case;
end process;
end Behavioral;

