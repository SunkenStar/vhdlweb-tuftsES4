library IEEE;
use IEEE.std_logic_1164.all;

entity majority is
  port(
	  votes : in std_logic_vector(2 downto 0);
	  y : out std_logic
  );
end majority;

architecture synth of majority is
begin
    process(votes)
        begin
            case votes is
                when "011" | "101" | "110" | "111" =>   y <= '1';
                when others =>  y <= '0';
            end case;
        end process;
end;
