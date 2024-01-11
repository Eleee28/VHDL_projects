library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity encoder is
    generic (n : natural := 2);
    
    port (
        Input: in std_logic_vector(2**n - 1 downto 0);
        O: out std_logic_vector(n - 1 downto 0)
    );
end encoder;

architecture Behavioral of encoder is
begin
    process(Input)
    begin
        O <= (others => '0');
        
        for i in 0 to 2**n - 1 loop
            if (Input(i) = '1') then
                O <= std_logic_vector(unsigned(to_signed(i, n)));
             end if;
        end loop;
    end process;

end Behavioral;
