library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lowest_num is
    port (
            inputs: in std_logic_vector(31 downto 0);
            lowest: out std_logic_vector(1 downto 0)
    );
end lowest_num;

architecture Behavioral of lowest_num is
    type t_num_array is array(14 downto 0) of std_logic_vector(1 downto 0);
    signal numbers : t_num_array;
    
    component Cell is
    port (
            inputA, inputB : in std_logic_vector(1 downto 0);
            output : out std_logic_vector(1 downto 0)
    );
    end component;

begin
    cell0: Cell port map (
        inputA => inputs(1 downto 0),
        inputB => inputs(3 downto 2),
        output => numbers(0)
    );
    
    cell1: Cell port map (
        inputA => inputs(5 downto 4),
        inputB => inputs(7 downto 6),
        output => numbers(1)
    );
    
    cell2: Cell port map (
        inputA => inputs(9 downto 8),
        inputB => inputs(11 downto 10),
        output => numbers(2)
    );
    
    cell3: Cell port map (
        inputA => inputs(13 downto 12),
        inputB => inputs(15 downto 14),
        output => numbers(3)
    );
    
    cell4: Cell port map (
        inputA => inputs(17 downto 16),
        inputB => inputs(19 downto 18),
        output => numbers(4)
    );
    
    cell5: Cell port map (
        inputA => inputs(21 downto 20),
        inputB => inputs(23 downto 22),
        output => numbers(5)
    );
    
    cell6: Cell port map (
        inputA => inputs(25 downto 24),
        inputB => inputs(27 downto 26),
        output => numbers(6)
    );
    
    cell7: Cell port map (
        inputA => inputs(29 downto 28),
        inputB => inputs(31 downto 30),
        output => numbers(7)
    );
    
    cell8: Cell port map (
        inputA => numbers(0),
        inputB => numbers(1),
        output => numbers(8)
    );
    
    cell9: Cell port map (
        inputA => numbers(2),
        inputB => numbers(3),
        output => numbers(9)
    );
    
    cell10: Cell port map (
        inputA => numbers(4),
        inputB => numbers(5),
        output => numbers(10)
    );
    
    cell11: Cell port map (
        inputA => numbers(6),
        inputB => numbers(7),
        output => numbers(11)
    );
    
    cell12: Cell port map (
        inputA => numbers(8),
        inputB => numbers(9),
        output => numbers(12)
    );
    
    cell13: Cell port map (
        inputA => numbers(10),
        inputB => numbers(11),
        output => numbers(13)
    );
    
    cell14: Cell port map (
        inputA => numbers(12),
        inputB => numbers(13),
        output => numbers(14)
    );
    
    lowest <= numbers(14);
    
end Behavioral;
