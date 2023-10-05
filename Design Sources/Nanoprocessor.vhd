----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 06:36:19 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Ovf : out STD_LOGIC;
           Annode : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is


-- Processor
component Processor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Ovf : out STD_LOGIC);
end component;


-- Look Up Table
component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;


-- Slow Clock
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal slow_clock : STD_LOGIC;
signal address0 : STD_LOGIC_VECTOR (3 downto 0);

begin

Processor_0 : Processor
    port map (
        Clk => slow_clock,
        Res => Res,
        S => address0,
        Zero => Zero,
        Ovf => Ovf
    );

LUT_16_7_0 : LUT_16_7
    port map (
        address => address0,
        data => S_7Seg
    );

Slow_Clk_0 : Slow_Clk
    port map (
        Clk_in => Clk,
        Clk_out => slow_clock
    );


S_LED <= address0;
Annode <= "1110";

end Behavioral;