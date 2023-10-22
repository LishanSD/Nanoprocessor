----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 02:55:52 PM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Ovf : out STD_LOGIC);
end Processor;

architecture Behavioral of Processor is


-- Instruction Decoder
component Instruction_Decoder is

    Port ( IB : in STD_LOGIC_VECTOR (11 downto 0);  -- Instruction Bus
           JA : out STD_LOGIC_VECTOR (2 downto 0);  -- Address to Jump
           JF : out STD_LOGIC;                      -- Jump Flag
           RE : out STD_LOGIC_VECTOR (2 downto 0);  -- Register Enable
           RS1 : out STD_LOGIC_VECTOR (2 downto 0); -- Register Select 1
           RS2 : out STD_LOGIC_VECTOR (2 downto 0); -- Register Select 2
           ASS : out STD_LOGIC;                     -- Add/Sub Select
           LS : out STD_LOGIC;                      -- Load Select
           IV : out STD_LOGIC_VECTOR (3 downto 0);  -- Immediate Value
           JRC : in STD_LOGIC_VECTOR (3 downto 0)); -- Register Check for Jump

end component;


-- Program ROM
component Prog_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           IB : out STD_LOGIC_VECTOR (11 downto 0));
end component;


-- Program Counter
component PC is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;


-- Register Bank
component Reg_Bank is
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
end component;


-- 3-bit Adder
component RCA_3 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;


-- 4-bit Add/Subtract Unit
component Add_Sub_4_bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC; -- Overflow
           C_out : out STD_LOGIC);
end component;


-- 2-way 3-bit Multiplexer
component Mux_2_way_3_bit is
    Port ( 
           A1 : in STD_LOGIC_VECTOR (2 downto 0);
           A2 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;


-- 2-way 4-bit Multiplexer
component Mux_2_way_4_bit is
    Port ( 
           S : in STD_LOGIC;
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;


-- 8-way 4-bit Multiplexer
component Mux_8_way_4_bit is
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
end component;


SIGNAL I : STD_LOGIC_VECTOR(11 downto 0);
SIGNAL IV0, Y0, Q0_0, Q1_0, Q2_0, Q3_0, Q4_0, Q5_0, Q6_0, Q7_0, Y1, Y2, S1 : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL D0, Q0, S0, JA0, RE0, RS1_0, RS2_0: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL JF0, LS0, ASS0 : STD_LOGIC;

begin

Instruction_Decoder_0 : Instruction_Decoder
    port map (
        IB => I,
        JA => JA0,
        JF => JF0,
        RE => RE0,
        RS1 => RS1_0,
        RS2 => RS2_0,
        ASS => ASS0,
        LS => LS0,
        IV => IV0,
        JRC => Y1
    );

Prog_ROM_0 : Prog_ROM
    port map (
        address => Q0,
        IB => I
    );

PC_0 : PC
    port map (
        D => D0,
        Res => Res,
        Clk => Clk,
        Q => Q0
    );

Reg_Bank_0 : Reg_Bank
    port map (
        RegSel => RE0,
        A => Y0,
        Clk => Clk,
        Res => Res,
        Q0 => Q0_0,
        Q1 => Q1_0,
        Q2 => Q2_0,
        Q3 => Q3_0,
        Q4 => Q4_0,
        Q5 => Q5_0,
        Q6 => Q6_0,
        Q7 => Q7_0
    );

RCA_3_0 : RCA_3
    port map (
        A0 => Q0(0),
        A1 => Q0(1),
        A2 => Q0(2),
        B0 => '1',
        B1 => '0',
        B2 => '0',
        C_in => '0',
        S0 => S0(0),
        S1 => S0(1),
        S2 => S0(2)    
    );

Add_Sub_4_bit_0 : Add_Sub_4_bit
    port map (
        A => Y1,
        B => Y2,
        M => ASS0,
        S => S1,
        V => Ovf,
        C_out => Zero
    );

Mux_2_way_3_bit_0 : Mux_2_way_3_bit
    port map (
        A1 => S0,
        A2 => JA0,
        S => JF0,
        Y => D0
    );

Mux_2_way_4_bit_0 : Mux_2_way_4_bit
    port map (
        S => LS0,
        A1 => S1,
        A2 => IV0,
        Y => Y0
    );

Mux_8_way_4_bit_0 : Mux_8_way_4_bit
    port map (
        S => RS1_0,
        A1 => Q0_0,
        A2 => Q1_0,
        A3 => Q2_0,
        A4 => Q3_0,
        A5 => Q4_0,
        A6 => Q5_0,
        A7 => Q6_0,
        A8 => Q7_0,
        Y => Y1
    );

Mux_8_way_4_bit_1 : Mux_8_way_4_bit
    port map (
        S => RS2_0,
        A1 => Q0_0,
        A2 => Q1_0,
        A3 => Q2_0,
        A4 => Q3_0,
        A5 => Q4_0,
        A6 => Q5_0,
        A7 => Q6_0,
        A8 => Q7_0,
        Y => Y2
    );

        
S <= Q7_0;
        
end Behavioral;