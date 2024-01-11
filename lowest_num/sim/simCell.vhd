library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simCell is
end simCell;

architecture Behavioral of simCell is

component Cell is
    port (
            inputA, inputB : in std_logic_vector(1 downto 0);
            output : out std_logic_vector(1 downto 0)
    );
end component;

-- Inputs
    signal A, B: std_logic_vector(1 downto 0);
    signal output: std_logic_vector(1 downto 0);
    
begin
    uut: Cell port map (
                inputA => A,
                inputB => B,
                output => output
    );
    
    process
    begin
        A <= "10";  -- Example input A: 2
        B <= "01";  -- Example input B: 1
        wait for 50 ns;
        A <= "00";  -- Example input A: 0
        B <= "11";  -- Example input B: 3
        wait for 50 ns;
        -- You can add more test cases here
        wait;
    end process;
    
end Behavioral;
