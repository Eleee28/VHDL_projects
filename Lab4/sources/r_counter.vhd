----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2023 16:38:46
-- Design Name: 
-- Module Name: r_counter - Behavioral
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

entity r_counter is
    Generic (t: integer := 6);
    Port ( input: in std_logic_vector (t - 1 downto 0);
        load, count, clk, rst: in std_logic;
        output: out std_logic_vector (t - 1 downto 0));
end r_counter;

architecture Behavioral of r_counter is

    signal cnt : unsigned(t - 1 downto 0);

begin
    process (clk, rst)
    begin
    
        if clk'event and clk = '1' then
            if (rst = '1') then
                cnt <= (others => '0');
            elsif (load = '1') then
                cnt <= unsigned(input);
            elsif (count = '1') then
                cnt <= cnt + 1;
            end if;
        end if;
        
    end process;
    
    output <= std_logic_vector(cnt);

end Behavioral;
