----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2023 18:13:01
-- Design Name: 
-- Module Name: r_quotient - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity r_quotient is
    generic (t : natural := 6);
    port (
        clk, rst: in std_logic;
        input: in std_logic_vector(t - 1 downto 0);
        load: in std_logic;
        shift_left_quotient: in std_logic;
        output: out std_logic_vector(t - 1 downto 0);
        MSB: in std_logic
    );
end r_quotient;

architecture Behavioral of r_quotient is

    signal shift : std_logic;
    signal move: std_logic_vector (t - 1 downto 0);

begin
    process(clk, rst)
    begin
        if rising_edge(clk) then

            if MSB = '1' then
                shift <= '0';
            else
                shift <= '1'; 
            end if;
            
            if (rst = '1') then
                move <= (others => '0');
            elsif (load = '1') then
                move <= input;
            elsif (shift_left_quotient = '1') then
                move <= move(t - 2 downto 0) & shift;
            end if;
        end if;
    end process;
    
  -- Output the shifted value
  output <= move;

end Behavioral;
