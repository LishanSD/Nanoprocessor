----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 01:17:40 AM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8_way_4_bit is
    Port ( 
           S : in STD_LOGIC_VECTOR (2 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           A8 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is 

begin
 
    Y(0) <= (NOT(S(2)) AND NOT(S(1)) AND NOT(S(0)) AND A1(0)) OR (NOT(S(2)) AND NOT(S(1)) AND S(0) AND A2(0)) OR 
            (NOT(S(2)) AND S(1) AND NOT(S(0)) AND A3(0)) OR (NOT(S(2)) AND S(1) AND S(0) AND A4(0)) OR
            (S(2) AND NOT(S(1)) AND NOT(S(0)) AND A5(0)) OR (S(2) AND NOT(S(1)) AND S(0) AND A6(0)) OR
            (S(2) AND S(1) AND NOT(S(0)) AND A7(0)) OR (S(2) AND S(1) AND S(0) AND A8(0));
            
    Y(1) <= (NOT(S(2)) AND NOT(S(1)) AND NOT(S(0)) AND A1(1)) OR (NOT(S(2)) AND NOT(S(1)) AND S(0) AND A2(1)) OR 
                  (NOT(S(2)) AND S(1) AND NOT(S(0)) AND A3(1)) OR (NOT(S(2)) AND S(1) AND S(0) AND A4(1)) OR
                  (S(2) AND NOT(S(1)) AND NOT(S(0)) AND A5(1)) OR (S(2) AND NOT(S(1)) AND S(0) AND A6(1)) OR
                  (S(2) AND S(1) AND NOT(S(0)) AND A7(1)) OR (S(2) AND S(1) AND S(0) AND A8(1));
                  
    Y(2) <= (NOT(S(2)) AND NOT(S(1)) AND NOT(S(0)) AND A1(2)) OR (NOT(S(2)) AND NOT(S(1)) AND S(0) AND A2(2)) OR 
                  (NOT(S(2)) AND S(1) AND NOT(S(0)) AND A3(2)) OR (NOT(S(2)) AND S(1) AND S(0) AND A4(2)) OR
                  (S(2) AND NOT(S(1)) AND NOT(S(0)) AND A5(2)) OR (S(2) AND NOT(S(1)) AND S(0) AND A6(2)) OR
                  (S(2) AND S(1) AND NOT(S(0)) AND A7(2)) OR (S(2) AND S(1) AND S(0) AND A8(2));
                  
    Y(3) <= (NOT(S(2)) AND NOT(S(1)) AND NOT(S(0)) AND A1(3)) OR (NOT(S(2)) AND NOT(S(1)) AND S(0) AND A2(3)) OR 
                  (NOT(S(2)) AND S(1) AND NOT(S(0)) AND A3(3)) OR (NOT(S(2)) AND S(1) AND S(0) AND A4(3)) OR
                  (S(2) AND NOT(S(1)) AND NOT(S(0)) AND A5(3)) OR (S(2) AND NOT(S(1)) AND S(0) AND A6(3)) OR
                  (S(2) AND S(1) AND NOT(S(0)) AND A7(3)) OR (S(2) AND S(1) AND S(0) AND A8(3));

end Behavioral;