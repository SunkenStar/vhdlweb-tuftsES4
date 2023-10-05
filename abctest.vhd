--  Testbench for AB+!BC
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

entity abc_test is
-- No ports, since this is a testbench
end abc_test;

architecture test of abc_test is

component abc is
  port(
	  a : in std_logic;
	  b : in std_logic;
	  c : in std_logic;
	  y : out std_logic
  );
end component;

signal test_a : std_logic_vector(7 downto 0);
signal test_b : std_logic_vector(7 downto 0);
signal test_c : std_logic_vector(7 downto 0);
signal test_y : std_logic_vector(7 downto 0);
signal correct_y : std_logic_vector(7 downto 0);

begin
    test_a <= "00001111";
    test_b <= "00110011";
    test_c <= "01010101";
    correct_y <= (test_a and test_b) or (not test_b and test_c);
    g1: for i in 0 to 7 generate
        test_abc: abc port map(test_a(i), test_b(i), test_c(i), test_y(i));
    end generate;
    process begin
        wait for 1 ns;
        assert test_y = correct_y report "failed" severity note;
        wait;
    end process;
end test;