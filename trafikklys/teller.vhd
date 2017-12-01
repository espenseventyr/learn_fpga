----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2017 01:04:16 PM
-- Design Name: 
-- Module Name: teller - teller_beh
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: Egen fil for teller som teller hvert 2. sekund
-- 
----------------------------------------------------------------------------------


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
