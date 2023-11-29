----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2023 12:04:40 PM
-- Design Name: 
-- Module Name: data_path - ARCH
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.definitions.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is
    generic (
        n : natural := 6;
        m : natural := 3
        );
    port (
        clk, reset: in std_logic;
        dividend: in std_logic_vector(n - 1 downto 0);
        divisor: in std_logic_vector(m - 1 downto 0);
        control: in std_logic_vector(W_CONTROL - 1 downto 0);
        status: out std_logic_vector(W_STATUS - 1 downto 0);
        quotient: out std_logic_vector(N - 1 downto 0)
    );
    
end data_path;

architecture ARCH of data_path is

    signal control_aux : std_logic_vector(W_CONTROL - 1 downto 0);
    alias load_dividend : std_logic is control_aux(0);
    alias load_divisor : std_logic is control_aux(1);
    alias shift_right_divisor : std_logic is control_aux(2);
    alias load_quotient : std_logic is control_aux(3);
    alias shift_left_quotient : std_logic is control_aux(4);
    alias load_k : std_logic is control_aux(5);
    alias count_k : std_logic is control_aux(6);
    alias mux_dividend : std_logic is control_aux(7);
    alias operation : std_logic is control_aux(8);
    
    signal status_aux : std_logic_vector(W_STATUS - 1 downto 0);
    alias MSB_dividend : std_logic is status_aux(0);
    alias less_or_equals : std_logic is status_aux(1);

    
    component parallel_reg is
        generic (t: natural := n + 1);
        port( rst, clk, load: in  std_logic;
               input: in  std_logic_vector(t - 1 downto 0);
               output: out std_logic_vector(t - 1 downto 0) );
    end component;

    component r_counter is
        Generic (t: integer := n + 1);
        Port ( input: in std_logic_vector (t - 1 downto 0);
            load, count, clk, rst: in std_logic;
            output: out std_logic_vector (t - 1 downto 0));
    end component;
    
    
    component r_divisor is
        generic (t : natural := n + 1);
        port (
            clk, rst: in std_logic;
            input: in std_logic_vector(t - 1 downto 0);
            load: in std_logic;
            shift_right_divisor: in std_logic;
            output: out std_logic_vector(t - 1 downto 0)
        );
    end component;
    
    
    component r_quotient is
        generic (t : natural := n + 1);
        port (
            clk, rst: in std_logic;
            input: in std_logic_vector(t - 1 downto 0);
            load: in std_logic;
            shift_left_quotient: in std_logic;
            MSB: in std_logic;
            output: out std_logic_vector(t - 1 downto 0)
        );
    end component;
    
    
    component add_sub is
        generic (z : natural := n + 1);
        port (
            op: in std_logic;
            input1, input2: in std_logic_vector(z - 1 downto 0);
            output: out std_logic_vector(z - 1 downto 0)
        );
    end component;
    
    
    component comparator is
        Generic (t: natural := n + 1);
        Port ( input1, input2: in std_logic_vector (t - 1 downto 0);
               output: out std_logic );
    end component;
    
    
    

--    component Mux is
--        port (
--            A, B : in std_logic_vector(1 downto 0);
--            sel : in std_logic;
--            output_mux : out std_logic_vector(1 downto 0)
--        );
--    end component;
    
    signal out_dividend, in_dividend : std_logic_vector(n downto 0);
    signal out_divisor, in_divisor : std_logic_vector(n downto 0);
    signal out_add, out_mux : std_logic_vector(n downto 0);
    signal in_quotient, out_quotient : std_logic_vector(n downto 0);
    signal out_counter, in_counter : std_logic_vector(n downto 0);
    signal num : std_logic_vector(n downto 0); --integer;
    --signal num_std : std_logic_vector(n downto 0);
    signal msb : std_logic;
    

    
--    signal aux_divisor, aux_dividend, aux_quotient: std_logic_vector(N - 1 downto 0);
--    signal inR_divisor, inR_counter, inR_quotient, inR_dividend : std_logic_vector(N - 1 downto 0);
--    signal outR_divisor, outR_counter, outR_quotient, outR_dividend : std_logic_vector(N - 1 downto 0);
--    signal count_k, load_k, load_divisor, shift_right_divisor : std_logic;
--    signal load_quotient, shift_left_quotient, load_dividend : std_logic;
--    signal less_or_equals, MSB, op, mux_dividend : std_logic;
--    signal outMux, out_add_sub : std_logic_vector(N - 1 downto 0);


begin

--    mux_instance : Mux port map (
--        A => out_add_sub,
--        b => aux_dividend,
--        sel => mux_dividend,
--        output_mux => outMux
--    );
    
--    add_sub_instance : add_sub port map (
--            op => op,
--            input1 => outR_dividend,
--            input2 => outR_divisor,
--            output => out_add_sub
--        );
        
--    R_counter_instance : r_counter port map (
--            clk => clk,
--            count => count_k,
--            load => load_k,
--            input => std_logic_vector(to_unsigned(0, n)),
--            output => outR_counter
--        );
    
--    R_divisor_instance : r_divisor port map (
--            clk => clk,
--            input => inR_divisor,
--            load => load_divisor,
--            shift_right_divisor => shift_right_divisor,
--            output => outR_divisor
--        );
    
--    comparator_instance : comparator port map (
--            input => outR_counter,
--            output => less_or_equals
--        );
    
--    R_dividend_instance :
    
--    R_quotient_instance :

    control_aux <= control;
    in_dividend <= '0' & dividend;
    in_divisor <= '0' & divisor & "000";
    in_counter <= (others => '0');
    in_quotient <= (others => '0');
    
    num <= std_logic_vector(to_unsigned(n - m, n + 1));

    
    
    R_divisor_instance : r_divisor 
        generic map (t => n + 1)
        port map (
            rst => reset,
            clk => clk,
            input => in_divisor,
            load => load_k,
            shift_right_divisor => shift_right_divisor,
            output => out_divisor
        );
        
    R_counter_instance : r_counter 
        generic map (t => n + 1)
        port map (
            rst => reset,
            clk => clk,
            count => count_k,
            load => load_k,
            input => in_counter,
            output => out_counter
        );

    comparator_instance : comparator 
        generic map (t => n + 1)
        port map (
            input1 => out_counter,
            input2 => num,
            output => less_or_equals
        );
        
    add_sub_instance : add_sub 
        generic map (z => n + 1)
        port map (
            op => operation,
            input1 => out_dividend,
            input2 => out_divisor,
            output => out_add
        );
    
    out_mux <= out_add when mux_dividend = '0' else in_dividend;
    
    R_dividend_instance: parallel_reg
        generic map (t => n + 1)
        port map (
            rst => reset,
            clk => clk,
            load => load_dividend,
            input => out_mux,
            output => out_dividend
        );
    
    msb <= out_dividend(n);
    MSB_dividend <= msb;
    
    R_quotient_instance : R_quotient
        generic map (t => n + 1)
        port map (
            rst => reset,
            clk => clk,
            load => load_quotient,
            MSB => msb,
            shift_left_quotient => shift_left_quotient,
            input => in_quotient,
            output => out_quotient
        );
        
    quotient <= out_quotient(n - 1 downto 0);
    status <= status_aux;

end ARCH;
