library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dddd is
  port(
    value : in unsigned(5 downto 0);    
    tensdigit : out std_logic_vector(6 downto 0);    
    onesdigit : out std_logic_vector(6 downto 0)
  );
end dddd;

architecture sim of dddd is

component sevenseg is
  port(
	  S : in unsigned(3 downto 0);
	  segments : out std_logic_vector(6 downto 0)
  );
end component;

signal highBCD: unsigned(3 downto 0);
signal lowBCD: unsigned(3 downto 0);
signal temp: unsigned(5 downto 0);
begin
    displayHigh: sevenseg port map(S => highBCD, segments => tensdigit);
    displayLow:  sevenseg port map(S => lowBCD, segments => onesdigit);
    
    lowBCD <= value mod 4d"10";
    temp <= value / 4d"10";    
    highBCD <= temp(3 downto 0);
-- Good luck!

end;