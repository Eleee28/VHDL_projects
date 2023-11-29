library IEEE;
use IEEE.std_logic_1164.ALL;

entity parallel_reg is
    port (
            rst, clk, load: in std_logic;
            E: in std_logic_vector(7 downto 0);
            S: out std_logic_vector(7 downto 0)
         );
end parallel_reg;

architecture Behavioral of parallel_reg is
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            if rst = '1' then
                S <= "00000000";
            elsif load = '1' then
                S <= E;
            end if;
        end if;
    end process;
end Behavioral; 