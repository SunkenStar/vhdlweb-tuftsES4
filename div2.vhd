library IEEE;
use IEEE.std_logic_1164.all;

entity div2 is
  port(
	  operand : in std_logic_vector(7 downto 0);
	  result : out std_logic_vector(7 downto 0)
  );
end div2;

architecture synth of div2 is
begin
    
  result <= '0' & operand(operand'length-1 downto 1);
end;

