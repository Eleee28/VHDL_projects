----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2023 17:01:27
-- Design Name: 
-- Module Name: comparator - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    generic (t : natural := 6);
    
    port (
        input1, input2 : in std_logic_vector(t - 1 downto 0);
        output : out std_logic
    );

--    generic (n : integer := 6;
--             m : integer := 3
--             );
--    Port ( input: in std_logic_vector (n - 1 downto 0);
--        output: out std_logic );
end comparator;

architecture Behavioral of comparator is
--signal comp: integer := n - m;
--signal int: integer := 4;
--begin
--    process(input)
--    begin
--        if unsigned(input) > to_unsigned(comp, n) then
--            output <= '1';
--        else 
--            output <= '0';
--        end if;

--    end process;

begin
    process (input1, input2)
    begin
        if unsigned(input1) > unsigned(input2) then
            output <= '0';
        else
            output <= '1';
        end if;
    end process;
    

end Behavioral;
