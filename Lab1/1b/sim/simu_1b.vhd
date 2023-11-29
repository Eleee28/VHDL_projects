-- Libraries needed
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;
 
 
ENTITY simreg IS
END simreg;
 
ARCHITECTURE behavior OF simreg IS 
 
-- Declaration of the component that we are going to simulate
 
    COMPONENT parallel_reg
    PORT(
         rst, load : IN  std_logic;
         clk : IN  std_logic;
         I : IN  std_logic_vector(3 downto 0);
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

-- Inputs
    signal rst, load : std_logic;
    signal clk : std_logic;
    signal I : std_logic_vector(3 downto 0);
		
-- Outputs
    signal O : std_logic_vector(3 downto 0);
   
-- The clock period is defined here 
    constant clk_period : time := 50 ns;
 
BEGIN
 
-- Instantiation of the unit under test (UUT)

   uut: parallel_reg PORT MAP (
          rst => rst,
		  load => load,
          clk => clk,
          I => I,
          O => O
        );

-- Definition of the clk process
reloj_process :process
   begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;
 

-- Stimuli process
stim_proc: process
   begin		
-- The reset is set to '1' for 45 ns.
	rst<='1';
	I<="0000";
	load <= '0';
      wait for 45 ns;
-- We stop reseting	
	rst<='0';
	I<="0000";
	load <= '1';
      wait for 50 ns;	
-- We load the value "1101" in the register
	rst<='0';
	I<="1101";
	load <= '1';
      wait for 50 ns;	
-- We keep that value for 100 ns
	rst<='0';
	I<="0000"; 
	load <= '1';
      wait for 100 ns;	
-- We load the value "0011" in the register
	rst<='0';
	I<="0011"; 
	load <= '1';
      wait for 50 ns;	
-- We keep that value forever
	rst<='0';
	I<="0000"; 
	load <= '0';
      wait;	end process;

END;
