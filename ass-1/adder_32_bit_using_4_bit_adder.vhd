----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:46:35 11/15/2018 
-- Design Name: 
-- Module Name:    adder_32_bit_using_4_bit_adder - Behavioral 
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

entity adder_32_bit_using_4_bit_adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (31 downto 0);
           CY : out  STD_LOGIC);
end adder_32_bit_using_4_bit_adder;

architecture Behavioral of adder_32_bit_using_4_bit_adder is

component four_bit_parallel_adder_by_full_adder is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           B3 : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM0 : out  STD_LOGIC;
           SUM1 : out  STD_LOGIC;
           SUM2 : out  STD_LOGIC;
           SUM3 : out  STD_LOGIC;
           CY : out  STD_LOGIC);
end component;

signal A0, A1, A2, A3, A4, A5, A6, A7 : STD_LOGIC_VECTOR (3 downto 0);
signal B0, B1, B2, B3, B4, B5, B6, B7 : STD_LOGIC_VECTOR (3 downto 0);
signal C0, C1, C2, C3, C4, C5, C6 : STD_LOGIC;

begin

-- THIS QUESTION WAS REMOVED FROM THE ASSIGNMENT!!!
-- ALSO, THE ANSWER FROM TEST BENCH IS WRONG.
-- But because the question was removed, I had no interest to resolve the problem.

A0 <= A(3 downto 0);
A1 <= A(7 downto 4);
A2 <= A(11 downto 8);
A3 <= A(15 downto 12);
A4 <= A(19 downto 16);
A5 <= A(23 downto 20);
A6 <= A(27 downto 24);
A7 <= A(31 downto 28);

B0 <= B(3 downto 0);
B1 <= B(7 downto 4);
B2 <= B(11 downto 8);
B3 <= B(15 downto 12);
B4 <= B(19 downto 16);
B5 <= B(23 downto 20);
B6 <= B(27 downto 24);
B7 <= B(31 downto 28);

CLA4_0 : four_bit_parallel_adder_by_full_adder port map 
	(A0(0), B0(0), A0(1), B0(1), A0(2), B0(2), A0(3), B0(3), Cin, SUM(0), SUM(1), SUM(2), SUM(3), C0);
	
CLA4_1 : four_bit_parallel_adder_by_full_adder port map 
	(A1(0), B1(0), A1(1), B1(1), A1(2), B1(2), A1(3), B1(3), C0, SUM(4), SUM(5), SUM(6), SUM(7), C1);
	
CLA4_2 : four_bit_parallel_adder_by_full_adder port map 
	(A2(0), B2(0), A2(1), B2(1), A2(2), B2(2), A2(3), B2(3), C1, SUM(8), SUM(9), SUM(10), SUM(11), C2);
	
CLA4_3 : four_bit_parallel_adder_by_full_adder port map 
	(A3(0), B3(0), A3(1), B3(1), A3(2), B3(2), A3(3), B3(3), C2, SUM(12), SUM(13), SUM(14), SUM(15), C3);
	
CLA4_4 : four_bit_parallel_adder_by_full_adder port map 
	(A4(0), B4(0), A4(1), B4(1), A4(2), B4(2), A4(3), B4(3), C3, SUM(16), SUM(17), SUM(18), SUM(19), C4);
	
CLA4_5 : four_bit_parallel_adder_by_full_adder port map 
	(A5(0), B5(0), A5(1), B5(1), A5(2), B5(2), A5(3), B5(3), C4, SUM(20), SUM(21), SUM(22), SUM(23), C5);
	
CLA4_6 : four_bit_parallel_adder_by_full_adder port map 
	(A6(0), B6(0), A6(1), B6(1), A6(2), B6(2), A6(3), B6(3), C5, SUM(24), SUM(25), SUM(26), SUM(27), C6);
	
CLA4_7 : four_bit_parallel_adder_by_full_adder port map 
	(A7(0), B7(0), A7(1), B7(1), A7(2), B7(2), A7(3), B7(3), C6, SUM(28), SUM(29), SUM(30), SUM(31), CY);

end Behavioral;

