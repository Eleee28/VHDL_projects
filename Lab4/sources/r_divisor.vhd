----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2023 05:53:25 PM
-- Design Name: 
-- Module Name: r_divisor - Behavioral
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


entity r_divisor is
    generic (t : natural := 6);
    port (
        clk, rst: in std_logic;
        input: in std_logic_vector(t - 1 downto 0);
        load: in std_logic;
        shift_right_divisor: in std_logic;
        output: out std_logic_vector(t - 1 downto 0)
    );
end r_divisor;

architecture Behavioral of r_divisor is
    signal shift : std_logic_vector(t - 1 downto 0);

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                shift <= (others => '0');
            elsif (load = '1') then
                shift <= input;
            elsif (shift_right_divisor = '1') then
                shift <= '0' & shift(t - 1 downto 1);
            end if;
        end if;
        
    end process;

  -- Output the shifted value
  output <= shift;
    
end Behavioral;