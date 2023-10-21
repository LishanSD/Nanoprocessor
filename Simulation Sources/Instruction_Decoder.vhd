----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 10:22:53 AM
-- Design Name: 
-- Module Name: Instruction Decoder - Behavioral
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

entity Instruction_Decoder is

    Port ( IB : in STD_LOGIC_VECTOR (11 downto 0);  -- Instruction Bus
           JA : out STD_LOGIC_VECTOR (2 downto 0);  -- Address to Jump
           JF : out STD_LOGIC;                      -- Jump Flag
           RE : out STD_LOGIC_VECTOR (2 downto 0);  -- Register Enable
           RS1 : out STD_LOGIC_VECTOR (2 downto 0); -- Register Select 1
           RS2 : out STD_LOGIC_VECTOR (2 downto 0); -- Register Select 2
           ASS : out STD_LOGIC;                     -- Add/Sub Select
           LS : out STD_LOGIC;                      -- Load Select
           IV : out STD_LOGIC_VECTOR (3 downto 0);  -- Immediate Value
           JRC : in STD_LOGIC_VECTOR (3 downto 0));                     -- Register Check for Jump

end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decorder_2_to_4
    PORT(
        I : in STD_LOGIC_VECTOR (1 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL JRCV : STD_LOGIC;
SIGNAL OP : STD_LOGIC_VECTOR(3 downto 0);

begin

Decoder_2_to_4 : Decorder_2_to_4
    PORT MAP(
        I(0) => IB(10),
        I(1) => IB(11),
        EN => '1',
        Y => OP);
        
        
                    JRCV <= NOT(JRC(0) OR JRC(1) OR JRC(2) OR JRC(3));

                    ASS <= (OP(0) AND '0') OR (OP(1) AND '1');
                    RE(0) <= (OP(0) OR OP(1) OR OP(2)) AND IB(7);
                    RE(1) <= (OP(0) OR OP(1) OR OP(2)) AND IB(8);
                    RE(2) <= (OP(0) OR OP(1) OR OP(2)) AND IB(9);
                    RS1(0) <= (OP(0) OR OP(1) OR OP(3)) AND IB(7);
                    RS1(1) <= (OP(0) OR OP(1) OR OP(3)) AND IB(8);
                    RS1(2) <= (OP(0) OR OP(1) OR OP(3)) AND IB(9);
                    RS2(0) <= (OP(0) OR OP(1)) AND IB(4);
                    RS2(1) <= (OP(0) OR OP(1)) AND IB(5);
                    RS2(2) <= (OP(0) OR OP(1)) AND IB(6);
                    
                
                    LS <= OP(2) AND '1';
                     
                    IV(0) <= OP(2) AND IB(0);
                    IV(1) <= OP(2) AND IB(1);
                    IV(2) <= OP(2) AND IB(2);
                    IV(3) <= OP(2) AND IB(3);           
                    
                        JF <= OP(3) AND JRCV AND '1';
                        JA(0) <= OP(3) AND JRCV AND IB(0);
                        JA(1) <= OP(3) AND JRCV AND IB(1);
                        JA(2) <= OP(3) AND JRCV AND IB(2);
                   

end Behavioral;