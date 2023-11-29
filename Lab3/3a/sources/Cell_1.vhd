----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2023 09:55:31
-- Design Name: 
-- Module Name: Cell_1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cell_1 is
    Generic (n: integer := 4);
    Port (  Input_1, Input_2: in std_logic_vector (n - 1 downto 0);
            Output: out std_logic_vector (n - 1 downto 0));
end Cell_1;

architecture Behavioral of Cell_1 is
signal aux_out: std_logic_vector (n - 1 downto 0);
begin

    aux_out <= Input_1 when UNSIGNED(Input_1) > UNSIGNED(Input_2) else Input_2;

output <= aux_out;

end Behavioral;
