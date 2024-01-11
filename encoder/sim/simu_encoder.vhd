library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simu_encoder is
end simu_encoder;

architecture Behavioral of simu_encoder is
    signal clk, rst: std_logic := '0';
    signal Input: std_logic_vector(3 downto 0) := (others => '0');
    signal O: std_logic_vector(1 downto 0);

    component encoder is
        generic (n : natural := 2);
        port (
            Input: in std_logic_vector(2**n - 1 downto 0);
            O: out std_logic_vector(n - 1 downto 0)
        );
    end component;
    
    constant clk_period : time := 50ns;

begin
    dut: encoder
        generic map (2)
        port map (
            Input => Input,
            O => O
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    simulation: process
    begin
        rst <= '1'; -- Reset active
        wait for 50 ns;
        rst <= '0'; -- Release reset

        -- Stimulus
        wait for 10 ns;
        Input <= "0001"; -- Input = 1, O=0
        wait for 50 ns;
        Input <= "0100"; -- Input = 4, O=2
        wait for 50 ns;
        Input <= "1000"; -- Input = 16, O=4
        wait for 50 ns;
        Input <= "0010"; -- Input = 2, O=1

        wait;
    end process;
end Behavioral;
