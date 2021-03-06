library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity teller is
    Port ( klokke_50 : in STD_LOGIC;
           kl_ut : out STD_LOGIC);
end teller;

architecture teller_beh of teller is
    signal counter      : STD_LOGIC_VECTOR(27 downto 0);
    signal numb         : STD_LOGIC;

begin
    kl_ut <= numb;
    
    process(klokke_50)
    begin
        if (klokke_50'event and klokke_50 = '1') then
            counter <= counter + '1';
            if (counter = X"2FAF080") then          -- skifter hvert sekund
                            counter <= X"0000000";
                    numb <= not numb;
            end if;
        end if;
    end process;
    
end teller_beh;
