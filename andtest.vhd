--  Testbench for AND gate
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

entity and_test is
-- No ports, since this is a testbench
end and_test;

architecture test of and_test is

component andgate is
  port(
	  a : in std_logic;
	  b : in std_logic;
	  y : out std_logic
  );
end component;

signal test_a: std_logic_vector(3 downto 0);
signal test_b: std_logic_vector(3 downto 0);
signal test_y: std_logic_vector(3 downto 0);
signal error_indicator: std_logic;

begin
    g1: for i in 0 to 3 generate
        test_gate: andgate port map(test_a(i), test_b(i), test_y(i));
    end generate g1;
    test_a <= "0011";
    test_b <= "0101";
process begin
    wait for 20 ns;
    assert test_y = "0001"
        report "failed"
        severity note;
    wait;
end process;
end test;