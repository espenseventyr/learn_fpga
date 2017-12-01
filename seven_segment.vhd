library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment is
    Port ( data : in STD_LOGIC_VECTOR (3 downto 0);
           segments : out STD_LOGIC_VECTOR (6 downto 0));
end seven_segment;

architecture behavioral of seven_segment is

begin
    process(data) begin
        case data is
        --                        abcdefg
        when X"0" => segments <= "1111110";
        when X"1" => segments <= "0110000";
        when X"2" => segments <= "1101101";
        when X"3" => segments <= "1111001";
        -- etc.
        end case;
    end process;        
end behavioral;
