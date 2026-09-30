----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2026 13:00:49
-- Design Name: 
-- Module Name: comb - Behavioral
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

entity comb is
    Port (sw_i : in STD_LOGIC_VECTOR (3 downto 0);
          led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
          led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end comb;

architecture Behavioral of comb is
    -- Constants for displaying numbers on 7-segment display
    constant NUM_0 : std_logic_vector (7 downto 0) := "00000011";
    constant NUM_1 : std_logic_vector (7 downto 0) := "10011111";
    constant NUM_2 : std_logic_vector (7 downto 0) := "00100101";
    constant NUM_3 : std_logic_vector (7 downto 0) := "00001101";
    constant NUM_4 : std_logic_vector (7 downto 0) := "10011001";
    
begin
    led7_an_o <= "0000";
    sel: process(sw_i) is
    begin
        case sw_i is
         when "0000" => led7_seg_o <= NUM_0;
         when "0001" | "0010" | "0100" | "1000"  => led7_seg_o <= NUM_1;
         when "0011" | "0101" | "0110" | "1010" | "1100" | "1001" => led7_seg_o <= NUM_2;
         when "0111" | "1011" | "1101" | "1110" => led7_seg_o <= NUM_3;
         when "1111" => led7_seg_o <= NUM_4;
         when others => led7_seg_o <= NUM_0;
        end case;
    end process sel;
end Behavioral;
