----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2017 01:04:16 PM
-- Design Name: 
-- Module Name: trafikk - trafikk_beh
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
--      Styrer trafikklys. State-maskin.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafikk is
        -- Ta er trafikk på Avenue. Tb er trafikk på Boulevard.
    Port ( reset, Ta, Tb : in STD_LOGIC;
           kl_in : in STD_LOGIC;
           ledr_ut : out STD_LOGIC_VECTOR (2 downto 0); --Trafikklys på Avenue.
           ledg_ut : out STD_LOGIC_VECTOR (7 downto 5));-- Trafikklys på Boulevard.
end trafikk;

architecture trafikk_beh of trafikk is
    type statetype is (S0, S1, S2, S3, S4, S5);
    signal state, nextstate: statetype;

begin
    -- state register
    process (kl_in, reset)
        begin
            if reset = '1' then state <= S0; --Reset hvis KEY(0) blir trykket ned
            elsif kl_in'event and kl_in = '1' then
                state <= nextstate;
            end if;
        end process;
        
    -- next state logic:
process (state, Ta, Tb)
    begin
        case state is
            when S0     =>      if Ta = '1' then
                                        nextstate <= S0;
                                else    nextstate <= S1;
                                end if;
            when S1     =>              nextstate <= S2;
            when S2     =>              nextstate <= S3;
            
            when S3     =>      if Tb = '1' then
                                        nextstate <= S3;
                                else    nextstate <= S4;
                                end if;
            when S4     =>              nextstate <= S5;                    
            when S5     =>              nextstate <= S0;
            when others =>              nextstate <= S0;
        end case;
end process;

    -- output logic:
process (state)
    begin
        case state is
            -- Avenue grønn, Boulevard rød:
            when S0 => ledr_ut(2 downto 0) <= "001"; ledg_ut(7 downto 5) <= "100";
            -- Avenue gul, Boulevard rød:                                           
            when S1 => ledr_ut(2 downto 0) <= "010"; ledg_ut(7 downto 5) <= "100";
            -- Avenue rød, Boulevard rød:
            when S2 => ledr_ut(2 downto 0) <= "100"; ledg_ut(7 downto 5) <= "100";
            -- Avenue rød, Boulevard grønn:
            when S3 => ledr_ut(2 downto 0) <= "100"; ledg_ut(7 downto 5) <= "001";
            -- Avenue rød, Boulevard gul:
            when S4 => ledr_ut(2 downto 0) <= "100"; ledg_ut(7 downto 5) <= "010";
            -- Avenue rød, Boulevard rød:
            when S5 => ledr_ut(2 downto 0) <= "100"; ledg_ut(7 downto 5) <= "100";
            -- slukket, slukket:
            when others => ledr_ut(2 downto 0) <= "000"; ledg_ut(7 downto 5) <= "000";
        end case;
end process;

end trafikk_beh;
