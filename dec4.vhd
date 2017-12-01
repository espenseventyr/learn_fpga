library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec4 is
    Port ( a : in STD_LOGIC_VECTOR(1 downto 0);
           y : out STD_LOGIC_VECTOR(3 downto 0));
end dec4;

architecture beh of dec4 is

begin
    process(a) begin
        case a is
            when "00" => y <= X"1";
            when "01" => y <= X"2";
            when "10" => y <= X"4";
            when "11" => y <= X"8";
            when others => y <= "XXXX";
        end case;
    end process;
end beh;
