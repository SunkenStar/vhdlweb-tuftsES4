library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sevenseg is
  port(
	  S : in unsigned(3 downto 0);
	  segments : out std_logic_vector(6 downto 0)
  );
end sevenseg;

architecture synth of sevenseg is
begin
    process(S) begin
    case (S) is
        when "0000" =>   segments <= "0000001";
        when "0001" =>   segments <= "1001111";
        when "0010" =>   segments <= "0010010";
        when "0011" =>   segments <= "0000110";
        when "0100" =>   segments <= "1001100";
        when "0101" =>   segments <= "0100100";
        when "0110" =>   segments <= "0100000";
        when "0111" =>   segments <= "0001111";
        when "1000" =>   segments <= "0000000";
        when "1001" =>   segments <= "0000100";
        when others =>   segments <= "0000000";
    end case;
    end process;
end;