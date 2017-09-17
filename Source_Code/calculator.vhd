library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity calculator is
	   Port (input : in  STD_LOGIC_VECTOR (15 downto 0);
			output : out  STD_LOGIC_VECTOR (15 downto 0);
			clock  : in STD_LOGIC;
			push_button_LEFT  : in STD_LOGIC;
			push_button_RIGHT  : in STD_LOGIC;
			push_button_UP  : in STD_LOGIC;
			push_button_DOWN  : in STD_LOGIC;
			push_button_CENTRE : in  STD_LOGIC
			);
	   end calculator;

architecture Behavioral of calculator is

signal operand_1  : std_logic_vector (15 downto 0);
signal operand_2  : std_logic_vector (15 downto 0);
signal temp1 : std_logic_vector (15 downto 0);
signal temp2 : std_logic_vector (15 downto 0);


begin

process (clock)

begin

	if (clock'event and clock = '1') then

		if (push_button_CENTRE = '1') then

			if (push_button_UP = '1')then

				operand_1 <= input;           -- Storing Input in Operand 1
                temp1 <= operand_1;
                
			elsif (push_button_DOWN ='1') then
				
				operand_2 <= input;           -- Storing Input in Operand 2
			    temp2 <= operand_2;
			     
			end if;

		elsif (push_button_UP = '1') then

		  operand_1 <= X"0000";                 -- Reseting Operand 1
		
		  operand_2 <= X"0000";                 -- Reseting Operand 2 

		end if;

	end if;

end process;


process (clock)

begin

	   if (clock'event and clock = '1') then
        
        if (push_button_CENTRE = '1') then
    
                if (push_button_UP = '1')then
    
                    output <= temp1;           -- Display Operand 1
                    
                elsif (push_button_DOWN ='1') then
                    
                    output <= temp2;           -- Displaying Operand2
                     
                end if;

        
	   elsif (push_button_LEFT = '1')then

			output <= operand_1 + operand_2;     -- Performing Addition

	   elsif (push_button_RIGHT = '1')then

			output <= operand_1 - operand_2;     -- Performing Subtraction

		elsif (push_button_DOWN = '1' and push_button_CENTRE = '0')then

			case (operand_2) is                  -- Using case statements to perform Logical Left Shift based on operand_2
				
				when X"0000" =>    output <= operand_1(15 downto 0);
				when X"0001" =>    output <= operand_1(14 downto 0) & "0";
				when X"0002" =>    output <= operand_1(13 downto 0) & "00";
				when X"0003" =>    output <= operand_1(12 downto 0) & "000";
				when X"0004" =>    output <= operand_1(11 downto 0) & "0000";
				when X"0005" =>    output <= operand_1(10 downto 0) & "00000";
				when X"0006" =>    output <= operand_1(9 downto 0) & "000000";
				when X"0007" =>    output <= operand_1(8 downto 0) & "0000000";
				when X"0008" =>    output <= operand_1(7 downto 0) & "00000000";
				when X"0009" =>    output <= operand_1(6 downto 0) & "000000000";
				when X"000A" =>    output <= operand_1(5 downto 0) & "0000000000";
				when X"000B" =>    output <= operand_1(4 downto 0) & "00000000000";
				when X"000C" =>    output <= operand_1(3 downto 0) & "000000000000";
				when X"000D" =>    output <= operand_1(2 downto 0) & "0000000000000";
				when X"000E" =>    output <= operand_1(1 downto 0) & "00000000000000";
				when X"000F" =>    output <= operand_1(0) & "000000000000000";
				when X"0010" =>    output <= "0000000000000000";
				when others  =>    output <= "0000000000000000";

			end case;

		elsif (push_button_UP = '1' and push_button_CENTRE = '0')then

			output    <= X"0000";            -- Reseitng output display

		end if;

	end if;

end process;

end Behavioral;