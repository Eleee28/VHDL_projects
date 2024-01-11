library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Mux is
    port (
        A, B : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        output_mux : out std_logic_vector(1 downto 0)
    );
end Mux;

architecture Behavioral of Mux is

begin
    process (sel, A, B)
    begin
        if sel = '0' then
            output_mux <= A;
        else
            output_mux <= B;
        end if;
    end process;

end Behavioral;
