library IEEE;
use IEEE.std_logic_1164.ALL;

entity lock is
    port (
            rst, clk: in std_logic;
            button: in std_logic;
            passwd: in std_logic_vector(7 downto 0);
            locked: out std_logic;
            attempts: out std_logic_vector(3 downto 0)
          );
end lock;

architecture Behavioral of lock is

type states is (ini, three, two, one, final);

signal current_state, next_state: states := ini;

component parallel_reg
    port (
            rst, clk, load: in std_logic; 
            E: in std_logic_vector(7 downto 0);
            S: out std_logic_vector(7 downto 0) );
end component;

component comparator
    port (
            E1, E2: in std_logic_vector (7 downto 0);
            S: out std_logic
          );
end component;

signal eq, isIniPasswd: std_logic;
signal iniPasswd: std_logic_vector(7 downto 0);

begin
    registerModule: parallel_reg port map (
                                    rst => rst,
                                    clk => clk,
                                    load => isIniPasswd,
                                    E => passwd,
                                    S => iniPasswd );
    comparatorModule: comparator port map (
                                    E1 => passwd,
                                    E2 => iniPasswd,
                                    S => eq );
    
    sync: process(clk, rst)
    begin
        if clk'event and clk = '1' then
            if rst = '1' then
                current_state <= ini;
            else
                current_state <= next_state;
            end if;
        end if;
    end process sync;
    
    comb: process(current_state, button, eq) --current_state, button, eq)
    begin
        case current_state is
            when ini =>
                locked <= '0';
                attempts <= "0100";
                isIniPasswd <= '1';
                if button = '1' then
                    next_state <= three;
                else
                    next_state <= ini;
                end if;
            
            when three =>
                locked <= '1';
                attempts <= "0011";
                isIniPasswd <= '0';
                if button = '1' then
                    if eq = '1' then
                        next_state <= ini;
                    else
                        next_state <= two;
                    end if;
                else
                    next_state <= three;
                end if;
                
            when two =>
                locked <= '1';
                attempts <= "0010";
                isIniPasswd <= '0';
                if button = '1' then
                    if eq = '1' then
                        next_state <= ini;
                    else
                        next_state <= one;
                    end if;
                else
                    next_state <= two;
                end if;
                
                when one =>
                locked <= '1';
                attempts <= "0001";
                isIniPasswd <= '0';
                if button = '1' then
                    if eq = '1' then
                        next_state <= ini;
                    else
                        next_state <= final;
                    end if;
                else
                    next_state <= one;
                end if;
                
                when final =>
                    locked <= '1';
                    isIniPasswd <= '0';
                    attempts <= "0000";
                    next_state <= final;
               end case;
        end process comb;
end Behavioral;