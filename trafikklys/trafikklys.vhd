library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafikklys is
    Port (  CLOCK_50        : in STD_LOGIC;
            KEY0          : in STD_LOGIC;
            SW17, SW16  : in STD_LOGIC;
            ledr            : out STD_LOGIC_VECTOR(2 downto 0);
            ledg            : out STD_LOGIC_VECTOR(7 downto 5));
end trafikklys;

architecture struct of trafikklys is
    signal klokke           : STD_LOGIC;

    component teller
        Port ( klokke_50    : in STD_LOGIC;
               kl_ut        : out STD_LOGIC);
    end component;
    
    component trafikk
        Port ( reset, Ta, Tb : in STD_LOGIC;
               kl_in         : in STD_LOGIC;
               ledr_ut       : out STD_LOGIC_VECTOR (2 downto 0); --Trafikklys på Avenue.
               ledg_ut       : out STD_LOGIC_VECTOR (7 downto 5));-- Trafikklys på Boulevard.           
    end component;

begin
    teller1  :   teller port map(KLOKKE_50 => CLOCK_50, kl_ut => klokke);
    trafikk1 :   trafikk port map(kl_in => klokke, reset => KEY0, 
                                  Ta => SW17, Tb => SW16,
                                  ledr_ut => ledr, ledg_ut => ledg);

end struct;
