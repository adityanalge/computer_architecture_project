library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity segment_driver is
    Port ( display_A : in STD_LOGIC_VECTOR (3 downto 0);
           display_B : in STD_LOGIC_VECTOR (3 downto 0);
           display_C : in STD_LOGIC_VECTOR (3 downto 0);
           display_D : in STD_LOGIC_VECTOR (3 downto 0);
           seg_A : out STD_LOGIC;
           seg_B : out STD_LOGIC;
           seg_C : out STD_LOGIC;
           seg_D : out STD_LOGIC;
           seg_E : out STD_LOGIC;
           seg_F : out STD_LOGIC;
           seg_G : out STD_LOGIC;
           select_display_A : out STD_LOGIC;
           select_display_B : out STD_LOGIC;
           select_display_C : out STD_LOGIC;
           select_display_D : out STD_LOGIC;
           clk : in STD_LOGIC
           );
           
    end segment_driver;

architecture Behavioral of segment_driver is

-- component of seven_segment defined
 
            COMPONENT seven_segment
            PORT(Digit : in std_logic_vector(3 downto 0);
                 a : out STD_LOGIC;
                 b : out STD_LOGIC;
                 c : out STD_LOGIC;
                 d : out STD_LOGIC;
                 e : out STD_LOGIC;
                 f : out STD_LOGIC;
                 g : out STD_LOGIC
                 );
                    
            END COMPONENT;

-- component of clock_divider defined

            COMPONENT clock_divider
            PORT(clk : in STD_LOGIC;
                 enable : in STD_LOGIC;
                 reset : in STD_LOGIC;
                 data_clk :  out STD_LOGIC_VECTOR(15 downto 0)
                 );
                
            END COMPONENT;

-- internal signals used to transfer value from one module to the other
                  
SIGNAL temporary_data : std_logic_vector(3 downto 0);
SIGNAL clock_word : std_logic_vector(15 downto 0);
SIGNAL slow_clock : std_logic;

begin
            
                    seven_segement_unit : seven_segment
                    PORT MAP(DIGIT => temporary_data,
                             a => seg_A,
                             b => seg_B,
                             c => seg_C,
                             d => seg_D,
                             e => seg_E,
                             f => seg_F,
                             g => seg_G
                             );
            
                    clock_divider_unit: clock_divider 
                    PORT MAP(clk => clk,
                             enable => '1',
                             reset => '0',
                             data_clk => clock_word
                             );
            
slow_clock <= clock_word(15);   -- 16th bit of clock_word goes into slow_clock

process(slow_clock)
    
    variable display_selection : STD_LOGIC_VECTOR(1 downto 0);  --two bit variable acting as switches for 4:1 multiplexer
    
begin
    
    if slow_clock'event and slow_clock = '1' then
    
        case display_selection is
    
            when "00" => temporary_data <= display_A;       -- temporary data gets input data for display_A;
    
                select_display_A <= '0';    --active low
                select_display_B <= '1';
                select_display_C <= '1';
                select_display_D <= '1'; 
     
                display_selection := display_selection + '1';
    
            when "01" => temporary_data <= display_B;       -- temporary data gets input data for display_A;
        
                select_display_A <= '1';
                select_display_B <= '0';    --active low
                select_display_C <= '1';
                select_display_D <= '1'; 
         
                display_selection := display_selection + '1';
    
            when "10" => temporary_data <= display_C;       -- temporary data gets input data for display_A;
        
                select_display_A <= '1';
                select_display_B <= '1';
                select_display_C <= '0';    --active low
                select_display_D <= '1'; 
         
                display_selection := display_selection + '1';
            
            when "11" => temporary_data <= display_D;       -- temporary data gets input data for display_A;
        
                select_display_A <= '1';
                select_display_B <= '1';
                select_display_C <= '1';
                select_display_D <= '0';    --active low
         
                display_selection := display_selection + '1';
    
        end case;
    
    end if;

end process;
                     
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity segment_driver is
    Port ( display_A : in STD_LOGIC_VECTOR (3 downto 0);
           display_B : in STD_LOGIC_VECTOR (3 downto 0);
           display_C : in STD_LOGIC_VECTOR (3 downto 0);
           display_D : in STD_LOGIC_VECTOR (3 downto 0);
           seg_A : out STD_LOGIC;
           seg_B : out STD_LOGIC;
           seg_C : out STD_LOGIC;
           seg_D : out STD_LOGIC;
           seg_E : out STD_LOGIC;
           seg_F : out STD_LOGIC;
           seg_G : out STD_LOGIC;
           select_display_A : out STD_LOGIC;
           select_display_B : out STD_LOGIC;
           select_display_C : out STD_LOGIC;
           select_display_D : out STD_LOGIC;
           clk : in STD_LOGIC);
           
    end segment_driver;

architecture Behavioral of segment_driver is

-- component of seven_segment defined
 
            COMPONENT seven_segment
            PORT(Digit : in std_logic_vector(3 downto 0);
                 a : out STD_LOGIC;
                 b : out STD_LOGIC;
                 c : out STD_LOGIC;
                 d : out STD_LOGIC;
                 e : out STD_LOGIC;
                 f : out STD_LOGIC;
                 g : out STD_LOGIC
                 );
                    
            END COMPONENT;

-- component of clock_divider defined

            COMPONENT clock_divider
            PORT(clk : in STD_LOGIC;
                 enable : in STD_LOGIC;
                 reset : in STD_LOGIC;
                 data_clk :  out STD_LOGIC_VECTOR(15 downto 0)
                 );
                
            END COMPONENT;

-- internal signals used to transfer value from one module to the other
                  
SIGNAL temporary_data : std_logic_vector(3 downto 0);
SIGNAL clock_word : std_logic_vector(15 downto 0);
SIGNAL slow_clock : std_logic;

begin
            
            seven_segement_unit : seven_segment
            PORT MAP(DIGIT => temporary_data,
                     a => seg_A,
                     b => seg_B,
                     c => seg_C,
                     d => seg_D,
                     e => seg_E,
                     f => seg_F,
                     g => seg_G
                     );
    
            clock_divider_unit: clock_divider 
            PORT MAP(clk => clk,
                     enable => '1',
                     reset => '0',
                     data_clk => clock_word
                     );
            
slow_clock <= clock_word(15);   -- 16th bit of clock_word goes into slow_clock

process(slow_clock)
    
    variable display_selection : STD_LOGIC_VECTOR(1 downto 0);  --two bit variable acting as switches for 4:1 multiplexer
    
begin
    
    if slow_clock'event and slow_clock = '1' then
    
        case display_selection is
    
            when "00" => temporary_data <= display_A;       -- temporary data gets input data for display_A;
    
                select_display_A <= '0';    --active low
                select_display_B <= '1';
                select_display_C <= '1';
                select_display_D <= '1'; 
     
                display_selection := display_selection + '1';
    
            when "01" => temporary_data <= display_B;       -- temporary data gets input data for display_A;
        
                select_display_A <= '1';
                select_display_B <= '0';    --active low
                select_display_C <= '1';
                select_display_D <= '1'; 
         
                display_selection := display_selection + '1';
    
            when "10" => temporary_data <= display_C;       -- temporary data gets input data for display_A;
        
                select_display_A <= '1';
                select_display_B <= '1';
                select_display_C <= '0';    --active low
                select_display_D <= '1'; 
         
                display_selection := display_selection + '1';
            
            when "11" => temporary_data <= display_D;       -- temporary data gets input data for display_A;
        
                select_display_A <= '1';
                select_display_B <= '1';
                select_display_C <= '1';
                select_display_D <= '0';    --active low
         
                display_selection := display_selection + '1';
    
        end case;
    
    end if;

end process;
                     
end Behavioral;
