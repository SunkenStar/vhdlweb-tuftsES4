--  Testbench for 4-bit adder
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

entity adder_test is
-- No ports, since this is a testbench
end adder_test;

architecture test of adder_test is

component adder is
  port(
	  a : in unsigned(3 downto 0);
	  b : in unsigned(3 downto 0);
	  sum : out unsigned(3 downto 0)
  );
end component;
signal a_test: unsigned(3 downto 0);
signal b_test: unsigned(3 downto 0);
signal sum_test: unsigned(3 downto 0);
begin
adderx: adder port map(a_test, b_test, sum_test);
process begin
    outer: for a_test_index in 0 to 15 loop
        inner: for b_test_index in 0 to 15 loop
            a_test <= to_unsigned(a_test_index, 4);
            b_test <= to_unsigned(b_test_index, 4);
            wait for 1 ns;
            assert a_test+b_test=sum_test report "failed" severity failure;
        end loop inner;
    end loop outer;
    wait;
end process;
end test;
