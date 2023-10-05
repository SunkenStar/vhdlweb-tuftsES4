library IEEE;
use IEEE.std_logic_1164.all;

entity gray2 is
  port(
	  clk : in std_logic;
	  reset : in std_logic;
	  count : out std_logic_vector(1 downto 0)
  );
end gray2;

architecture synth of gray2 is
type state is (one, two, three, four);
signal s : state := one;
begin
    process(clk, reset) begin
        if (rising_edge(clk)) then
            if (reset = '0') then
                case s is 
                    when one => s <= two; count <= "00";
                    when two => s <= three; count <= "01";
                    when three => s <= four; count <= "11";
                    when four => s <= one; count <= "10";
                    when others => null;
                end case;
            else 
                s <= two; count <= "00";
            end if;
        end if;
    end process;
end;