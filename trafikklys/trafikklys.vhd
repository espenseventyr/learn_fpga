----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2017 01:04:16 PM
-- Design Name: 
-- Module Name: trafikklys - synth
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
