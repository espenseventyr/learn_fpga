library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
    Port ( d0, d1, d2, d3 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end mux4;

architecture synth of mux4 is

begin
    with s select y <=
        d0 when "00",
        d1 when "01",
        d2 when "10",
        d3 when others;
end synth;
