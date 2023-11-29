----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2023 09:49:28
-- Design Name: 
-- Module Name: Mod-16_counter - Behavioral
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

entity Mod16_counter is
  Port ( Rst, clk, Count_up: in std_logic;
         Led: out std_logic_vector(3 downto 0));
end Mod16_counter;

architecture structure of Mod16_counter is
    component adder4b
    port ( a, b: in std_logic_vector(3 downto 0);
           c: out std_logic_vector(3 downto 0));
    end component ;
    component clock_divider
    port ( clk_in: in std_logic;
           clk_out: out std_logic);
    end component;
    component parallel_reg
    port ( clk, rst, load: in std_logic;
           I : in std_logic_vector(3 downto 0);
           O : out std_logic_vector(3 downto 0));
    end component;
    signal reg_out, c_reg: std_logic_vector(3 downto 0); 
    signal clk_out_reg: std_logic;

begin
    mod_adder4b: adder4b port map (
                          a => "0001",
                          b => reg_out,
                          c => c_reg );
    mod_clock_divider: clock_divider port map (
                                      clk_in => clk,
                                      clk_out => clk_out_reg);
    mod_parallel_reg: parallel_reg port map (
                                      clk => clk_out_reg,
                                      rst => Rst,
                                      load => Count_up,
                                      I => c_reg,
                                      O => reg_out);     

    Led <= reg_out;
end structure;
