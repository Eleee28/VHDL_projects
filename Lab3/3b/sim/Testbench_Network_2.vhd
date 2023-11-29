library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Network_2_tb is
end Network_2_tb;

architecture Behavioral of Network_2_tb is
    -- Constants
    constant M_VALUE: integer := 4;
    constant N_VALUE: integer := 4;
    
    -- Signals
    signal inputs: std_logic_vector((M_VALUE * N_VALUE) - 1 downto 0);
    signal output: std_logic_vector(N_VALUE - 1 downto 0);
    signal reset: std_logic;
    signal clk: std_logic;
    -- Component instantiation
--    component Network_2
--        generic (m: integer := M_VALUE; n: integer := N_VALUE);
--        port (inputs: in std_logic_vector((m * n) - 1 downto 0);
--              output: out std_logic_vector(n - 1 downto 0));
--    end component;

constant clk_period: time := 50 ns;

begin
    -- Instantiate the DUT (Design Under Test)
    DUT: entity work.Network_2
        generic map (m => M_VALUE, n => N_VALUE)
        port map (inputs => inputs, output => output, clk => clk, reset => reset);

clock_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Test case 1: All zeros
stim_proc: process
  begin
  
  reset <= '1';
  
    inputs <= "1111111111111111";
    
    wait for 50 ns;
    reset <= '0';
         -- Test Case 1: All inputs set to '1's
    inputs <= "1111111111111111";
    wait for 50 ns;

    -- Test Case 2: All inputs set to '0's
    inputs <= "0000000000001111";
    wait for 10 ns;

    -- Test Case 3: Alternating '01' pattern
    inputs <= "0101010101010101";
    wait for 50 ns;
    
    inputs <= "0111010101010111";
    wait for 10 ns;

    -- Add more test cases here

    wait;
  end process;
end Behavioral;
