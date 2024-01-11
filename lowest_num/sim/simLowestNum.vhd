library IEEE;
use IEEE. STD_LOGIC_1164.ALL;

entity simLowestNum is
end simLowestNum;

architecture Behavioral of simLowestNum is
    signal inputs : std_logic_vector(31 downto 0);
    signal lowest : std_logic_vector(1 downto 0);
    
    component lowest_num is
        port (
                inputs: in std_logic_vector(31 downto 0);
                lowest: out std_logic_vector(1 downto 0)
        );
    end component;
    
begin
    uut: lowest_num port map (
        inputs => inputs,
        lowest => lowest
    );
    
    process
    begin
        inputs <= "00100110001000100010001100100010"; -- 0, 2, 1, 2, 0, 2, 0, 2, 0, 2, 0, 3, 0, 2, 0, 2
        wait for 50ns;  -- expected output 0
        
        inputs <= "01111010110110100100111001100101"; -- 1, 3, 2, 2, 3, 1, 2, 2, 1, 0, 3, 2, 1, 2, 1, 1
        wait for 50 ns; -- expected output 0
        
        inputs <= "01111010110110100101111001100101"; -- 1, 3, 2, 2, 3, 1, 2, 2, 1, 1, 3, 2, 1, 2, 1, 1
        wait for 50 ns; -- expected output 1
        
        wait;
    end process;
    
end Behavioral;
