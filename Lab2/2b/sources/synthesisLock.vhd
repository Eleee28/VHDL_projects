library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity synthesisLock is
    port (
            rst, clk, button, btnU: in std_logic;
            passwd: in std_logic_vector(7 downto 0);
            locked: out std_logic;
            cathodes: out std_logic_vector(6 downto 0);
            anodes: out std_logic_vector(3 downto 0)
          );
end synthesisLock;

architecture lockArch of synthesisLock is
    
    component lock is 
        port (
                rst, clk: in std_logic;
                button, btnU: in std_logic; 
                passwd: in std_logic_vector(7 downto 0);
                locked: out std_logic;
                attempts: out std_logic_vector(3 downto 0)
              );
    end component;
    
    component debouncer is
        port (
                rst_debouncer, clk_deb: in std_logic;
                x: in std_logic;
                xDeb: out std_logic;
                xDebFallingEdge: out std_logic;
                xDebRisingEdge: out std_logic
              );
    end component;
    
    component conv_7seg is
        port (
                dis_in: in std_logic_vector(3 downto 0); -- attempts
                dis_out: out std_logic_vector(6 downto 0)
              );
    end component;
    
    signal attempts_aux: std_logic_vector(3 downto 0);
    signal outDebouncer, outDebouncerU, locked_aux: std_logic;
   
    
    begin
        debouncerInstance1: debouncer port map (
                                        rst_debouncer => '1',   --rst,
                                        clk_deb => clk, 
                                        x => button,
                                        xDeb => open,
                                        xDebFallingEdge => open,--outDebouncer,
                                        xDebRisingEdge => outDebouncer );
                                        
        debouncerInstance2: debouncer port map (
                                        rst_debouncer => '1',   --rst,
                                        clk_deb => clk, 
                                        x => btnU,
                                        xDeb => open,
                                        xDebFallingEdge => open,--outDebouncer,
                                        xDebRisingEdge => outDebouncerU );
                                        
        lockInstance: lock port map (
                                rst => rst,
                                clk => clk,
                                button => outDebouncer,
                                passwd => passwd,
                                locked => locked,
                                attempts => attempts_aux,
                                btnU => outDebouncerU );
                                
        conv7segInstance: conv_7seg port map (
                                        dis_in => attempts_aux,
                                        dis_out => cathodes );
         --btnU  boton set                             
        anodes <= "1100";
        
end;