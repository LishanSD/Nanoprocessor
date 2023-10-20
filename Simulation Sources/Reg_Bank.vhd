----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 01:21:32 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL y : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
    port map (
        I => RegSel,
        EN => '1',
        Y => y);

Reg_0 : Reg
    port map (
        D => "0000",
        En => y(0),
        Clk => Clk,
        Res => Res,
        Q => Q0);

Reg_1 : Reg
    port map (
        D => A,
        En => y(1),
        Clk => Clk,
        Res => Res,
        Q => Q1);

Reg_2 : Reg
    port map (
        D => A,
        En => y(2),
        Clk => Clk,
        Res => Res,
        Q => Q2);

Reg_3 : Reg
    port map (
        D => A,
        En => y(3),
        Clk => Clk,
        Res => Res,
        Q => Q3);

Reg_4 : Reg
    port map (
        D => A,
        En => y(4),
        Clk => Clk,
        Res => Res,
        Q => Q4);

Reg_5 : Reg
    port map (
        D => A,
        En => y(5),
        Clk => Clk,
        Res => Res,
        Q => Q5);

Reg_6 : Reg
    port map (
        D => A,
        En => y(6),
        Clk => Clk,
        Res => Res,
        Q => Q6);

Reg_7 : Reg
    port map (
        D => A,
        En => y(7),
        Clk => Clk,
        Res => Res,
        Q => Q7);
               
end Behavioral;