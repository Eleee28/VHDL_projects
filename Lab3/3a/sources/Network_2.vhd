----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2023 12:49:59
-- Design Name: 
-- Module Name: Network_2 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Network_2 is
    Generic ( m: integer := 4;
              n: integer := 4);
    Port ( inputs: in std_logic_vector ( (m * n) - 1 downto 0);
           output: out std_logic_vector ( n - 1 downto 0));
end Network_2;

architecture Behavioral of Network_2 is

component Cell_1 is
    Generic (n: natural := n);
    Port (  Input_1, Input_2: in std_logic_vector (n - 1 downto 0);
            Output: out std_logic_vector (n - 1 downto 0));
end component;

function log2( input: integer ) return integer is
    variable tmp, log:integer;
begin
    tmp := input;
    log := 0;
    while (tmp > 1) loop
        tmp := tmp/2;
        log := log + 1;
    end loop;
    return log;
end function log2;

signal aux_conn: std_logic_vector ((m * 2 - 1) * n - 1 downto 0);

begin

aux_conn ((m * n) - 1 downto 0) <= inputs;

    gen_levels: for i in 0 to log2( m / 2 ) generate
        gen_level: for j in 0 to ( m / 2 ** ( i + 1 )) - 1 generate
        
            if_1_generate: if i = 0 generate
            comparator_ij: Cell_1
            
                generic map (
                    n => n
                )
                port map (
                    input_1 => aux_conn ( (2 * j + 1) * n - 1 downto (2 * j) * n),
                    input_2 => aux_conn ( (2 * j + 2) * n - 1 downto ((2 * j + 1) * n)),
                    output => aux_conn (4 * m +((j + 1) * n) - 1 downto 4 * m +((j) * n))
                );
            end generate if_1_generate;
                
            if_2_generate: if i = 1 generate
            comparator_ij: Cell_1
            
                generic map (
                    n => n
                )
                port map (
                    input_1 => aux_conn (4 * m + (2 * j + 1) * n - 1 downto 4 * m + (2 * j) * n),
                    input_2 => aux_conn (4 * m + (2 * j + 2) * n - 1 downto 4 * m + ((2 * j + 1) * n)),
                    output => aux_conn ( 6 * m +((j + 1) * n) - 1 downto 6 * m +(j) * n)
                );
            end generate if_2_generate;
            
            if_3_generate: if i = 2 generate
            comparator_ij: Cell_1
            
                generic map (
                    n => n
                )
                port map (
                    input_1 => aux_conn (3 * m + (2 * j + 1) * n - 1 downto 3 * m + (2 * j) * n),
                    input_2 => aux_conn (3 * m + (2 * j + 2) * n - 1 downto 3 * m + ((2 * j + 1) * n)),
                    output => aux_conn (4 * m +((2 * j + 1) * n) - 1 downto 4 * m +(2 * j) * n)
                );
            end generate if_3_generate;
         end generate gen_level;
     end generate gen_levels;

output <= aux_conn((m * 2 - 1) * n - 1 downto (m * 2 - 2) * n);

end Behavioral;
