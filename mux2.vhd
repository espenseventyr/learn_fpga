library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (3 downto 0));
end mux2;

architecture synth of mux2 is

begin
    y <= d1 when s='1' else d0;

end synth;
