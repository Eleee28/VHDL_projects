----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 12:57:58 PM
-- Design Name: 
-- Module Name: divider - ARCH
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

entity divider is
    generic (
        n : natural := 6;
        m : natural := 3
    );
    port (
        clk, reset: in std_logic;
        dividend: in std_logic_vector(n - 1 downto 0);
        divisor: in std_logic_vector(m - 1 downto 0);
        start: in std_logic;
        ready: out std_logic;
        quotient: out std_logic_vector(n - 1 downto 0)
    );
end divider;

architecture ARCH of divider is

    -- Add declaration of components "controller" and "datapath"
    
    component controller is
    port (
        clk, reset, start: in std_logic;
        status: in std_logic_vector(W_STATUS - 1 downto 0);
        control: out std_logic_vector(W_CONTROL - 1 downto 0);
        ready: out std_logic
        );
    end component;
    
    component data_path is
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
    end component;
    
    --signal clk_intermediate : std_logic;
    signal control : std_logic_vector(W_CONTROL - 1 downto 0);
    signal status : std_logic_vector(W_STATUS - 1 downto 0);
    

begin

    --clk_intermediate <= clk;
   -- clk_out <= clk_intermediate;
    
    my_datapath: data_path port map (
            clk => clk,--clk_intermediate,        -- input
            reset => reset,                   -- input
            dividend => dividend,           -- input
            divisor => divisor,             -- input
            control => control,             -- input
            status => status,               -- output
            quotient => quotient            -- output
        );
        
    my_controller: controller port map (
            clk => clk, --clk_intermediate,        -- input
            reset => reset,                 -- input
            start => start,                 -- input
            control => control,             -- output
            status => status,               -- input
            ready => ready                  -- output
        );


end ARCH;
