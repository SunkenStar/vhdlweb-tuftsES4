library IEEE;
use IEEE.std_logic_1164.all;

entity and4 is
  port(
	  a : in std_logic;
	  b : in std_logic;
	  c : in std_logic;
	  y : out std_logic
  );
end and4;


architecture synth of and4 is
component nand4
  port(
      a : in std_logic;
      b : in std_logic;
      c : in std_logic;
      y : out std_logic
  );
end component;
signal intermidiate_nand: std_logic;
begin
    nand_instance: nand4 port map(a, b, c, intermidiate_nand);
    y <= not intermidiate_nand;
end;

