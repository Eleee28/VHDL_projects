library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cell is
    port (
        inputA, inputB : in std_logic_vector(1 downto 0);
        output : out std_logic_vector(1 downto 0)
    );
end Cell;

architecture Behavioral of Cell is

    component Mux 
        port (
            A, B : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            output_mux : out std_logic_vector(1 downto 0)
        );
    end component;
    
    component Comparator
        port (
            A, B     : in STD_LOGIC_VECTOR(1 downto 0);
            output_comp : out STD_LOGIC   
        );
    end component;
    
    signal eq: std_logic;
    signal mux_out: std_logic_vector(1 downto 0);

begin

    mux_instance: Mux port map (
                    A => inputA,
                    B => inputB,
                    sel => eq,
                    output_mux => mux_out
    );
    
    comp_instance: Comparator port map (
                    A => inputA,
                    B => inputB,
                    output_comp => eq
    );
    
    output <= mux_out;

end Behavioral;
