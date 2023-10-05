--  Testbench for 4:1 multiplexer
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

entity mux41_test is
-- No ports, since this is a testbench
end mux41_test;

architecture test of mux41_test is

component mux41 is
  port(
	  d : in std_logic_vector(3 downto 0); -- Data port
	  s : in std_logic_vector(1 downto 0); -- Select
	  y : out std_logic -- Result
  );
end component;
signal test_d1: std_logic_vector(3 downto 0);
signal test_d2: std_logic_vector(3 downto 0);

signal test_y1: std_logic_vector(3 downto 0);
signal test_y2: std_logic_vector(3 downto 0);

signal test_s: std_logic_vector(7 downto 0);
begin
    test_d1 <= "1101";
    test_d2 <= "1010";
    test_s <= "11100100";
    instantiation1: for i in 0 to 3 generate
        mux1: mux41 port map(d=>test_d1, s=>test_s(2*i+1 downto 2*i), y=>test_y1(i));
    end generate instantiation1;
    
    instantiation2: for i in 0 to 3 generate
        mux2: mux41 port map(d=>test_d2, s=>test_s(2*i+1 downto 2*i), y=>test_y2(i));
    end generate instantiation2;
    
    process begin
        wait for 1 ns;
        assert test_y1 = "1101" report "failed" severity note;
        assert test_y2 = "1010" report "failed" severity note;
        wait;
    end process;
  -- Good luck!

end test;