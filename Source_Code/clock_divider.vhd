library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_divider is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_clk : out STD_LOGIC_VECTOR (15 downto 0)
           );

    end clock_divider;

architecture Behavioral of clock_divider is

begin

process(clk,reset)
        
    variable count: STD_LOGIC_VECTOR (15 downto 0):=(others=>'0'); -- Initializing a variable that gets incremented with each clock cycle

begin
        
    if reset = '1' then
        
        count := (others => '0');                                  -- Reseting the entire array of variable count to '0' when reset = '1'
    
    elsif enable='1' and clk'event and clk='1' then
        
        count := count + 1;                                        -- Incrementing the variable 'count' by 1 with each clock cycle
        
    end if;
        
        data_clk <= count;                                         -- Passing the value of 'count' to counter output 'data_clk'
        
end process;
            
end Behavioral;
