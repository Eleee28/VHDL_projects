------------------------------------------------------------
-- register with parallel input / parallel output
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity parallel_reg is
    generic (t : natural := 6);
    port( rst, clk, load: in  std_logic;
	       input:              in  std_logic_vector(t - 1 downto 0);
	       output:              out std_logic_vector(t - 1 downto 0) );
end parallel_reg;

architecture Behavioral of parallel_reg is
begin

    process(clk)
    begin
	      if clk'event and clk = '1' then
		      if rst = '1' then
			    output <= std_logic_vector(to_unsigned(0, t));
		      elsif load = '1' then
			    output <= input;
		      end if;
	      end if;
    end process;
end Behavioral;