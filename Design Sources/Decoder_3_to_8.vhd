----------------------------------------------------------------------------------
-- Engineer: Lishan
-- 
-- Design Name: 3-to-8 Decoder using two 2-to-4 Decoders
-- Description: Hierarchical design with enable input
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8 is
    Port (
        I  : in  STD_LOGIC_VECTOR (2 downto 0);
        EN : in  STD_LOGIC;
        Y  : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Decoder_3_to_8;

architecture Structural of Decoder_3_to_8 is

    -- Reuse optimized 2-to-4 decoder
    component Decoder_2_to_4 
        Port (
            I  : in  STD_LOGIC_VECTOR (1 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal Y_low, Y_high : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instantiate lower half decoder (for I(2) = 0)
    Dec_Low : Decoder_2_to_4
        port map (
            I  => I(1 downto 0),
            EN => (not I(2)) and EN,
            Y  => Y_low
        );

    -- Instantiate upper half decoder (for I(2) = 1)
    Dec_High : Decoder_2_to_4
        port map (
            I  => I(1 downto 0),
            EN => I(2) and EN,
            Y  => Y_high
        );

    -- Combine outputs
    Y <= Y_low & Y_high;

end Structural;
