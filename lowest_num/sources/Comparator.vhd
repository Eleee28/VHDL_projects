library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comparator is
    Port (
        A, B     : in STD_LOGIC_VECTOR(1 downto 0);  -- 2-bit inputs A and B
        output_comp : out STD_LOGIC                  -- Output signals for greater than, equal, and less than
    );
end Comparator;

architecture Behavioral of Comparator is
begin
    process (A, B)
    begin
        if A < B then
            output_comp <= '0';
        else
            output_comp <= '1';
        end if;
    end process;
          
end Behavioral;
