library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simlock is
end simlock;

architecture behavior of simlock is

component lock is 
    port (
            rst, clk: in std_logic;
            button: in std_logic;
            passwd: in std_logic_vector(7 downto 0);
            locked: out std_logic;
            attempts: out std_logic_vector(3 downto 0) );
end component;

-- Inputs
    signal rst, clk: std_logic;
    signal button, locked: std_logic;
    
-- Outputs
    signal passwd: std_logic_vector(7 downto 0);
    signal attempts: std_logic_vector(3 downto 0);
    
constant clk_period: time := 50 ns;

begin
    uut: lock port map (
        rst => rst,
        clk => clk,
        button => button,
        passwd => passwd,
        locked => locked,
        attempts => attempts );
        
    clock_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    stim_process: process
    begin
        -- Rst activated for 45 ns
        rst <= '1';
        button <= '0';
        passwd <= "00000000";
        wait for 50 ns;
        
        -- Stop reseting
        rst <= '0';
        button <= '0';
        passwd <= "00000000";
        wait for 50 ns;
        
        -- Load password
        rst <= '0';
        button <= '1';
        passwd <= "00000010";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "00000010";
        wait for 50 ns;
        
        -- Wrong password
        rst <= '0';
        button <= '1';
        passwd <= "00010000";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "00010000";
        wait for 50 ns;
        
        -- Wrong password
        rst <= '0';
        button <= '1';
        passwd <= "01010000";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "01010000";
        wait for 50 ns;
        
        -- Correct password
        rst <= '0';
        button <= '1';
        passwd <= "00000010";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "00000010";
        wait for 50 ns;
        
        --------------------------------------------------------------
        
        -- Load password
        rst <= '0';
        button <= '1';
        passwd <= "11111111";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "11111111";
        wait for 50 ns;
        
        -- Wrong password
        rst <= '0';
        button <= '1';
        passwd <= "00000000";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "00000000";
        wait for 50 ns;
        
        -- Wrong password
        rst <= '0';
        button <= '1';
        passwd <= "01010000";
        wait for 50 ns;
        
        -- Wait
        rst <= '0';
        button <= '0';
        passwd <= "01010000";
        wait for 50 ns;
        
        -- Wrong password
        rst <= '0';
        button <= '1';
        passwd <= "01000100";
        wait for 50 ns;
        
        -- Wait forever
        rst <= '0';
        button <= '0';
        passwd <= "01000100";
        wait;
    end process;
end;
