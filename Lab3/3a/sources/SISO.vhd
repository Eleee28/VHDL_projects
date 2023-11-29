----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2023 15:08:56
-- Design Name: 
-- Module Name: SISO - Behavioral
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

entity SISO is
    Port (  clk: in std_logic;
            S_input: in std_logic;
            S_output: out std_logic);
end SISO;

architecture Behavioral of SISO is

signal reg: std_logic := '0';

begin
    process (clk)
    begin
        if clk'event and clk='1' then
            reg <= S_input;
        end if;
        
    S_output <= reg;
            

end process;

end Behavioral;
