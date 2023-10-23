----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 06:52:06 PM
-- Design Name: 
-- Module Name: Nanoprocessor_sim - Behavioral
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

entity Nanoprocessor_sim is
--  Port ( );
end Nanoprocessor_sim;

architecture Behavioral of Nanoprocessor_sim is

component Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Ovf : out STD_LOGIC;
           Annode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S_LED : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal Annode : STD_LOGIC_VECTOR (3 downto 0) := "1110";
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
signal Res, Clk, Zero, Ovf : STD_LOGIC := '0';

begin

UUT : Nanoprocessor
    PORT MAP(
        Clk => Clk,
        Res => Res,
        S_LED => S_LED,
        S_7Seg => S_7Seg,
        Zero => Zero,
        Ovf => Ovf,
        Annode => Annode            
    );
    

process
begin
    Clk <= NOT(Clk);
    wait for 2ns;

end process;


process
begin
    Res <= '1';
    wait for 50ns;

    Res <= '0';
    wait for 450ns;
    
    Res <= '1';
    wait for 50ns;

    Res <= '0';
    wait;    
end process;


end Behavioral;