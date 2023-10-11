----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 12:05:51 AM
-- Design Name: 
-- Module Name: Mux_2_way_4_bit - Behavioral
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

entity Mux_2_way_4_bit is
    Port ( 
           S : in STD_LOGIC;
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4_bit;

architecture Behavioral of Mux_2_way_4_bit is

begin

    Y(0) <= ((NOT(S) AND A1(0)) OR (S AND A2(0))) ;
    Y(1) <= ((NOT(S) AND A1(1)) OR (S AND A2(1))) ;
    Y(2) <= ((NOT(S) AND A1(2)) OR (S AND A2(2))) ;
    Y(3) <= ((NOT(S) AND A1(3)) OR (S AND A2(3))) ;

end Behavioral;