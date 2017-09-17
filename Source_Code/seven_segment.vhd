library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seven_segment is
    Port ( Digit : in STD_LOGIC_VECTOR (3 downto 0);
           a : out STD_LOGIC;
           b : out STD_LOGIC;
           c : out STD_LOGIC;
           d : out STD_LOGIC;
           e : out STD_LOGIC;
           f : out STD_LOGIC;
           g : out STD_LOGIC
           );
           
    end seven_segment;

architecture Behavioral of seven_segment is

begin

process(Digit)
    
    variable decode_data : std_logic_vector(6 downto 0);    -- 7 bit variable used to save all decoded signals
    
begin
    
    case digit is
        
        when "0000" => decode_data := "1111110"; --0
        when "0001" => decode_data := "0110000"; --1
        when "0010" => decode_data := "1101101"; --2
        when "0011" => decode_data := "1111001"; --3
        when "0100" => decode_data := "0110011"; --4
        when "0101" => decode_data := "1011011"; --5
        when "0110" => decode_data := "1011111"; --6
        when "0111" => decode_data := "1110000"; --7
        when "1000" => decode_data := "1111111"; --8
        when "1001" => decode_data := "1111011"; --9
        when "1010" => decode_data := "1110111"; --A
        when "1011" => decode_data := "0011111"; --b
        when "1100" => decode_data := "1001110"; --C
        when "1101" => decode_data := "0111101"; --d
        when "1110" => decode_data := "1001111"; --E
        when "1111" => decode_data := "1000111"; --F
        when others => decode_data := "0111110"; --Error H
        
    end case;
        
    a <= not decode_data(6); -- assigning bit 7 of decode_data to segment a
    b <= not decode_data(5); -- assigning bit 6 of decode_data to segment b
    c <= not decode_data(4); -- assigning bit 5 of decode_data to segment c
    d <= not decode_data(3); -- assigning bit 4 of decode_data to segment d
    e <= not decode_data(2); -- assigning bit 3 of decode_data to segment e
    f <= not decode_data(1); -- assigning bit 2 of decode_data to segment f
    g <= not decode_data(0); -- assigning bit 1 of decode_data to segment g

end process;
        
end Behavioral;