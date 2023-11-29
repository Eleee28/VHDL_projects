----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2023 05:03:47 PM
-- Design Name: 
-- Module Name: r_dividend - Behavioral
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

entity r_dividend is
    generic (t : natural := 6);
    port (
            clk, load: in std_logic;
            input: in std_logic_vector(t - 1 downto 0);
            output: out std_logic_vector(t - 1 downto 0);
            msb: out std_logic
         );
end r_dividend;

architecture Behavioral of r_dividend is

begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            if load = '1' then
                output <= input;
                msb <= input(t - 2);
            end if;
        end if;
    end process;

end Behavioral;