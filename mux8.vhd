library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8 is
    Port ( s : in STD_LOGIC_VECTOR (2 downto 0);
           d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           d2 : in STD_LOGIC;
           d3 : in STD_LOGIC;
           d4 : in STD_LOGIC;
           d5 : in STD_LOGIC;
           d6 : in STD_LOGIC;
           d7 : in STD_LOGIC;
           y : out STD_LOGIC);
end mux8;

architecture behavioral of mux8 is

begin
    with s select y <=
        d0 when "000" else
        d1 when "001" else
        d2 when "010" else
        d3 when "011" else
        d4 when "100" else
        d5 when "101" else
        d6 when "110" else
        d7;
end behavioral;
