library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;   
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_design is
      Port(Switch0 : in STD_LOGIC;
           Switch1 : in STD_LOGIC;
           Switch2 : in STD_LOGIC;
           Switch3 : in STD_LOGIC;
           Switch4 : in STD_LOGIC;
           Switch5 : in STD_LOGIC;
           Switch6 : in STD_LOGIC;
           Switch7 : in STD_LOGIC;
           Switch8 : in STD_LOGIC;
           Switch9 : in STD_LOGIC;
           Switch10 : in STD_LOGIC;
           Switch11 : in STD_LOGIC;
           Switch12 : in STD_LOGIC;
           Switch13 : in STD_LOGIC;
           Switch14 : in STD_LOGIC;
           Switch15 : in STD_LOGIC;
           clk : in STD_LOGIC;
           topselDispA : out STD_LOGIC;
           topselDispB : out STD_LOGIC;
           topselDispC : out STD_LOGIC;
           topselDispD : out STD_LOGIC;
           topsegA : out STD_LOGIC;
           topsegB : out STD_LOGIC;
           topsegC : out STD_LOGIC;
           topsegD : out STD_LOGIC;
           topsegE : out STD_LOGIC;
           topsegF : out STD_LOGIC;
           topsegG : out STD_LOGIC;
           L0 : out STD_LOGIC;
           L1 : out STD_LOGIC;
           L2 : out STD_LOGIC;
           L3 : out STD_LOGIC;
           L4 : out STD_LOGIC;
           L5 : out STD_LOGIC;
           L6 : out STD_LOGIC;
           L7 : out STD_LOGIC;
           L8 : out STD_LOGIC;
           L9 : out STD_LOGIC;
           L10 : out STD_LOGIC;
           L11 : out STD_LOGIC;
           L12 : out STD_LOGIC;
           L13 : out STD_LOGIC;
           L14 : out STD_LOGIC;
           L15 : out STD_LOGIC;
           Q : in STD_LOGIC;
           R: in STD_LOGIC;
           L: in STD_LOGIC;
           U: in STD_LOGIC;
           D: in STD_LOGIC
           );
           
end top_design;

architecture Behavioral of top_design is

-- component of segment_driver defined

           COMPONENT segment_driver
           Port(display_A : in STD_LOGIC_VECTOR (3 downto 0);
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
        
            end component; 

-- component of calculator defined

            COMPONENT calculator
            port(input : in  STD_LOGIC_VECTOR (15 downto 0);
				 output : out  STD_LOGIC_VECTOR (15 downto 0);
                 clock : in std_logic;
				 push_button_LEFT  : in STD_LOGIC;
			     push_button_RIGHT  : in STD_LOGIC;
				 push_button_UP  : in STD_LOGIC;
				 push_button_DOWN  : in STD_LOGIC;
				 push_button_CENTRE : in  STD_LOGIC
				 );
				  
             end component;					 

signal calc_result : std_logic_vector (15 downto 0);

begin

        segment_driver_unit : segment_driver 
        PORT MAP(display_A => calc_result (3 downto 0),
                 display_B => calc_result (7 downto 4),
                 display_C => calc_result (11 downto 8),
                 display_D => calc_result (15 downto 12),
                 seg_A => topsegA,
                 seg_B => topsegB,
                 seg_C => topsegC,
                 seg_D => topsegD,
                 seg_E => topsegE,
                 seg_F => topsegF,
                 seg_G => topsegG,
                 select_display_A => topselDispA,
                 select_display_B => topselDispB,
                 select_display_C => topselDispC,
                 select_display_D => topselDispD,
                 clk => clk
                 );
					  
		calculator_unit : calculator
		PORT MAP(input(0)=>  Switch0,
                 input(1)=>  Switch1,
                 input(2)=>  Switch2,
                 input(3)=>  Switch3,
                 input(4)=>  Switch4,
                 input(5)=>  Switch5,
                 input(6)=>  Switch6,
                 input(7)=>  Switch7,
                 input(8)=>  Switch8,
                 input(9)=>  Switch9,
                 input(10)=> Switch10,
                 input(11)=> Switch11,
                 input(12)=> Switch12,
                 input(13)=> Switch13,
                 input(14)=> Switch14,
                 input(15)=> Switch15,
                 output=> calc_result,
                 clock => clk,
				 push_button_LEFT => L,
				 push_button_RIGHT => R,
				 push_button_UP => U,
				 push_button_DOWN => D,
				 push_button_CENTRE => Q
				 );
            
-- LED's light up based on input
       
        L0 <= Switch0 AND '1';
        L1 <= Switch1 AND '1';
        L2 <= Switch2 AND '1';
        L3 <= Switch3 AND '1';
        L4 <= Switch4 AND '1';
        L5 <= Switch5 AND '1';
        L6 <= Switch6 AND '1';
        L7 <= Switch7 AND '1';
        L8 <= Switch8 AND '1';
        L9 <= Switch9 AND '1';
        L10 <= Switch10 AND '1';
        L11 <= Switch11 AND '1';
        L12 <= Switch12 AND '1';
        L13 <= Switch13 AND '1';
        L14 <= Switch14 AND '1';
        L15 <= Switch15 AND '1';
            
end Behavioral;