----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2023 04:38:20 PM
-- Design Name: 
-- Module Name: add_sub - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_sub is
    generic (z : natural := 6);
    port (
        op: in std_logic;
        input1, input2: in std_logic_vector(z - 1 downto 0);
        output: out std_logic_vector(z - 1 downto 0)
    );
    
end add_sub;

architecture Behavioral of add_sub is

begin
    process (input1, input2, op)
    begin
        if op = '0' then
            output <= std_logic_vector(unsigned(input1) + unsigned(input2));
        else
            output <= std_logic_vector(unsigned(input1) - unsigned(input2));
        end if;
    end process;

end Behavioral;
