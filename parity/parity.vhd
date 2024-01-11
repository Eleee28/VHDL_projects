library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity parity is
    generic (n : natural := 4 );
    
    port (
        I : in std_logic_vector (n - 1 downto 0);
        O : out std_logic
    );
end parity;

architecture Behavioral of parity is

begin
    process (I)
        variable xor_result : std_logic; 
    begin
        xor_result := '0';
        
        for i in I'range loop
            xor_result := xor_result XOR I(i);
        end loop;
        
        O <= xor_result;

end Behavioral;
