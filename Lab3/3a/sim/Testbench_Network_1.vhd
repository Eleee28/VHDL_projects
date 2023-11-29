library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Testbench_Network_1 is
end Testbench_Network_1;

architecture TB of Testbench_Network_1 is
  signal inputs_tb: std_logic_vector(15 downto 0);
  signal output_tb: std_logic_vector(3 downto 0);

begin
  -- Instantiate the design under test
  DUT: entity work.Network_1
    generic map (m => 4, n => 4)
    port map (inputs => inputs_tb, output => output_tb);

  -- Stimulus process
  stim_proc: process
  begin
    -- Test Case 1: All inputs set to '1's
    inputs_tb <= "1111111111111111";
    wait for 10 ns;

    -- Test Case 2: All inputs set to '0's
    inputs_tb <= "0000000000000000";
    wait for 10 ns;

    -- Test Case 3: Alternating '01' pattern
    inputs_tb <= "0101010101010101";
    wait for 10 ns;
    
     inputs_tb <= "0101010101010001";
    wait for 10 ns;

    -- Add more test cases here

    wait;
  end process;

  -- Display results
--  report "Output: " & output_tb severity NOTE;

end TB;
