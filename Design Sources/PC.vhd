----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:42:33 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

 component D_FF 
 port ( 
    D : in STD_LOGIC; 
    Res: in STD_LOGIC; 
    Clk : in STD_LOGIC; 
    Q : out STD_LOGIC; 
    Qbar : out STD_LOGIC); 
 end component; 
 
begin 
 
 D_FF_0 : D_FF 
    port map ( 
        D => D(0), 
        Res => Res, 
        Clk => Clk, 
        Q => Q(0));

 D_FF_1 : D_FF 
    port map ( 
        D => D(1), 
        Res => Res, 
        Clk => Clk, 
        Q => Q(1));

 D_FF_2 : D_FF 
    port map ( 
        D => D(2), 
        Res => Res, 
        Clk => Clk, 
        Q => Q(2));
 
end Behavioral;