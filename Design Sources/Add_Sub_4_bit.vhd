----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 10:25:44 AM
-- Design Name: 
-- Module Name: Add_Sub_4_bit - Behavioral
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

entity Add_Sub_4_bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC; -- Overflow
           C_out : out STD_LOGIC);
end Add_Sub_4_bit;

architecture Behavioral of Add_Sub_4_bit is

component RCA_4
    PORT(
               A0 : in STD_LOGIC;
               A1 : in STD_LOGIC;
               A2 : in STD_LOGIC;
               A3 : in STD_LOGIC;
               B0 : in STD_LOGIC;
               B1 : in STD_LOGIC;
               B2 : in STD_LOGIC;
               B3 : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S0 : out STD_LOGIC;
               S1 : out STD_LOGIC;
               S2 : out STD_LOGIC;
               S3 : out STD_LOGIC;
               V : out STD_LOGIC; -- Overflow
               C_out : out STD_LOGIC);
end component;

SIGNAL BX0, BX1, BX2, BX3 : STD_LOGIC;

begin

  BX0 <= B(0) XOR M;
  BX1 <= B(1) XOR M;
  BX2 <= B(2) XOR M;
  BX3 <= B(3) XOR M;
  

  RCA_4_0 : RCA_4
    PORT MAP(
        A0 => A(0),
        A1 => A(1),
        A2 => A(2),
        A3 => A(3),
        B0 => BX0,
        B1 => BX1,
        B2 => BX2,
        B3 => BX3,
        C_in => M,
        S0 => S(0),
        S1 => S(1),
        S2 => S(2),
        S3 => S(3),
        V => V,
        C_out => C_out);
        
    

end Behavioral;