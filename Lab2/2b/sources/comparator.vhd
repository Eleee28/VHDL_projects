library IEEE;
use IEEE.std_logic_1164.ALL;

entity comparator is
    port (
            E1, E2: in std_logic_vector (7 downto 0);
            S: out std_logic
          );
end comparator;

architecture Behavioral of comparator is
begin
    process (E1, E2)
    begin
        if (E1 = E2) then
            S <= '1';
        else
            S <= '0';
        end if;
    end process;
end Behavioral;