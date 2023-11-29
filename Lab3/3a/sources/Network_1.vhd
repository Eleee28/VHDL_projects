----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2023 10:06:19
-- Design Name: 
-- Module Name: Network_1 - Behavioral
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

entity Network_1 is
    Generic ( m: integer := 4; --Nº Inputs
              n: natural := 4); --Nº Digits per input
    Port ( inputs: in std_logic_vector ( (m * n) - 1 downto 0);
           output: out std_logic_vector ( n - 1 downto 0));
end Network_1;

architecture Behavioral of Network_1 is

component Cell_1 is
    Generic (n: natural := n);
    Port (  Input_1, Input_2: in std_logic_vector (n - 1 downto 0);
            Output: out std_logic_vector (n - 1 downto 0));
end component;

--function log2( input: integer ) return integer is
--    variable tmp, log:integer;
--begin
--    tmp := input;
--    log := 0;
--    while (tmp > 1) loop
--        tmp := tmp/2;
--        log := log + 1;
--    end loop;
--    return log;
--end function log2;

signal aux_con: std_logic_vector (m * (n + 1) downto 0);

begin

    aux_con ( n - 1 downto 0 ) <= inputs ( n - 1  downto 0 );
    gen_levels: for i in 0 to m - 2 generate
        comp_map: Cell_1 
            generic map (
                    n => n)
            port map (
                    Input_1 => aux_con ( (i + 1) * n - 1 downto i * n),
                    Input_2 => inputs ( (((i + 1) * n) - 1) + n downto ((i) * n) + n),
                    Output => aux_con ( (i + 2) * n - 1 downto (i + 1) * n)
                    );
                    
            end generate gen_levels;

    output <= aux_con ( (( m - 2) + 2) * n - 1 downto ((m - 2) + 1) * n);

end Behavioral;
