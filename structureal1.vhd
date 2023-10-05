library IEEE;
use IEEE.std_logic_1164.all;

entity funinabox is
  port(
	  a : in std_logic;
	  b : in std_logic;
	  result : out std_logic_vector(3 downto 0)
  );
end funinabox;

architecture synth of funinabox is
    component thing1 is 
        port(
            s : in std_logic;
            t : in std_logic;
            y : out std_logic_vector(3 downto 0)
        );
    end component thing1;
    component thing2 is
      port(
          e : in std_logic_vector(3 downto 0);
          f : in std_logic;
          g : out std_logic_vector(3 downto 0)
      );
    end component thing2;
    signal y1: std_logic_vector(3 downto 0);
begin
    th1: thing1 port map(a, b, y1);
    th2: thing2 port map(f=>a, e=>y1, g=>result);
end architecture synth;