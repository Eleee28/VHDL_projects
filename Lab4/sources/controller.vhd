----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2023 11:45:40 AM
-- Design Name: 
-- Module Name: controller - ARCH
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    port (
        clk, reset, start: in std_logic;
        status: in std_logic_vector(W_STATUS - 1 downto 0);
        control: out std_logic_vector(W_CONTROL - 1 downto 0);
        ready: out std_logic
        );
end controller;

architecture ARCH of controller is

    type STATES is (Initial, Assignments, Subtraction, Comp1, Load_0_quo, Load_1_quo, Shift_add, Comp2);
    signal STATE, NEXT_STATE: STATES;
    
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
    
    

begin

    -- Processes SYNC and COMB of the finite state machine
    
    SYNC: process (clk,reset)
        begin
            if clk'event and clk = '1' then
                if reset = '1' then
                    STATE <= Initial;
                else
                    STATE <= NEXT_STATE;
                end if;
            end if;
    end process SYNC;
    
    COMB: process (STATE, start, status, status_aux) -- not sure about this
        begin
            status_aux <= status;
            load_dividend <= '0';
            load_divisor <= '0';
            shift_right_divisor <= '0';
            load_quotient <= '0';
            shift_left_quotient <= '0';
            load_k <= '0';
            count_k <= '0';
            mux_dividend <= '0';
            operation <= '0';
            
            case STATE is
                when Initial =>
                    ready <= '1';
                    if (start = '1') then
                        NEXT_STATE <= Assignments;
                    else
                        NEXT_STATE <= Initial;
                    end if;
                                    
                when Assignments =>
                    load_dividend <= '1';
                    load_divisor <= '1';
                    load_k <= '1';
                    load_quotient <= '1';
                    mux_dividend <= '1';
                    ready <= '0';
                    NEXT_STATE <= Subtraction;
                
                when Subtraction =>
                    load_dividend <= '1';
                    operation <= '1';
                    mux_dividend <= '0';
                    NEXT_STATE <= Comp1;
                    ready <= '0';
                
                when Comp1 =>
                    ready <= '0';
                    if (MSB_dividend = '1') then
                        NEXT_STATE <= Load_0_quo;
                    else
                        NEXT_STATE <= Load_1_quo;
                    end if;
                
                when Load_0_quo =>
                    shift_left_quotient <= '1'; -- not sure
                    load_dividend <= '1';
                    operation <= '0';
                    mux_dividend <= '0';
                    NEXT_STATE <= Shift_add;
                    ready <= '0';
                
                when Load_1_quo =>
                    shift_left_quotient <= '1'; -- not sure
                    NEXT_STATE <= Shift_add;
                    ready <= '0';
                
                when Shift_add =>
                    shift_right_divisor <= '1';
                    count_k <= '1';
                    NEXT_STATE <= Comp2;
                    ready <= '0';
                
                when Comp2 =>
                    ready <= '0';
                    if (less_or_equals = '1') then
                        NEXT_STATE <= Subtraction;
                    else
                        NEXT_STATE <= Initial;
                    
                    end if;
                
            end case;
        end process;
        
        control <= control_aux;

end ARCH;
