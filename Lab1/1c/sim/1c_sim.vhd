----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 15:15:56
-- Design Name: 
-- Module Name: 1c_sim - Behavioral
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

-- Libraries needed
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;
 
 
ENTITY simmod16_counter IS
END simmod16_counter;
 
ARCHITECTURE behavior OF simmod16_counter IS 
 
-- Declaration of the component that we are going to simulate
 
    COMPONENT Mod16_counter
    PORT(
         Rst, Count_up : IN  std_logic;
         Clk : IN  std_logic;
         Led : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

-- Inputs
    signal Rst, Count_up : std_logic;
    signal Clk : std_logic;
		
-- Outputs
    signal Led : std_logic_vector(3 downto 0);
   
-- The clock period is defined here 
    constant clk_period : time := 50 ns;
 
BEGIN
 
-- Instantiation of the unit under test (UUT)

   uut: Mod16_counter PORT MAP (
          Rst => Rst,
		  Count_up => Count_up,
          Clk => Clk,
          Led => Led
        );

-- Definition of the clk process
reloj_process :process
   begin
	Clk <= '0';
	wait for clk_period/2;
	Clk <= '1';
	wait for clk_period/2;
end process;
 

-- Stimuli process
stim_proc: process
   begin		
-- The reset is set to '1' for 45 ns.
	Rst<='1';
	Count_up <= '0';
      wait for 100 ns;
-- We stop reseting	
	Rst<='0';
	Count_up <= '1';
      wait for 50 ns;	
-- We load the value "1101" in the register
	Rst<='0';
	Count_up <= '1';
      wait for 50 ns;	
-- We keep that value for 100 ns
	Rst<='0';
	Count_up <= '1';
      wait for 50 ns;	
-- We load the value "0011" in the register
	Rst<='0';
	Count_up <= '1';
      wait for 50 ns;	
-- We keep that value forever
	Rst<='0';
	Count_up <= '1';
      wait;	
end process;

END;
