library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity saturatingadd is
  port(
	  a : in unsigned(7 downto 0);
	  b : in unsigned(7 downto 0);
	  result : out unsigned(7 downto 0)
  );
end saturatingadd;

architecture synth of saturatingadd is
    signal rolled: unsigned(7 downto 0);
begin
    rolled <= a + b;
    result <= "11111111" when (rolled < a or rolled < b) else rolled;
end;