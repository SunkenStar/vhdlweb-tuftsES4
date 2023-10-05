library IEEE;
use IEEE.std_logic_1164.all;

entity adderlogic is
  port(
	  a : in std_logic_vector(2 downto 0);
	  b : in std_logic_vector(2 downto 0);
	  sum : out std_logic_vector(3 downto 0)
  );
end adderlogic;

architecture synth of adderlogic is
    signal carriage: std_logic_vector(2 downto 0);
begin
    sum(0) <= a(0) xor b(0);
    carriage(0) <= a(0) and b(0);
    sum(1) <= a(1) xor b(1) xor carriage(0);
    carriage(1) <= (a(1) and b(1)) or ( a(1) and carriage(0)) or (b(1) and carriage(0));
    sum(2) <= a(2) xor b(2) xor carriage(1);
    carriage(2) <= (a(2) and b(2)) or ( a(2) and carriage(1)) or (b(2) and carriage(1));
    sum(3) <= carriage(2);
end;