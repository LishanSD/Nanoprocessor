----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 05:03:02 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

component D_FF_A
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

SIGNAL Clk_1 : STD_LOGIC;

begin

Clk_1 <= Clk AND En;

D_FF_0 : D_FF_A
    port map (
        D => D(0),
        Res => Res,
        Clk => Clk_1,
        Q => Q(0));

D_FF_1 : D_FF_A
    port map (
        D => D(1),
        Res => Res,
        Clk => Clk_1,
        Q => Q(1));
             
D_FF_2 : D_FF_A
    port map (
        D => D(2),
        Res => Res,
        Clk => Clk_1,
        Q => Q(2));
        
D_FF_3 : D_FF_A
    port map (
        D => D(3),
        Res => Res,
        Clk => Clk_1,
        Q => Q(3));

end Behavioral;