library IEEE;
use IEEE.std_logic_1164.all;

entity onehot is
  port(
	  clk : in std_logic;
	  reset : in std_logic;
	  count : out std_logic_vector(7 downto 0)
  );
end onehot;

architecture synth of onehot is
begin
    process (clk) begin
    if (rising_edge(clk)) then 
        if (reset = '0') then
            case count is
                when "00000001" => count <= "00000010";
                when "00000010" => count <= "00000100";
                when "00000100" => count <= "00001000";
                when "00001000" => count <= "00010000";
                when "00010000" => count <= "00100000";
                when "00100000" => count <= "01000000";        
                when "01000000" => count <= "10000000";       
                when "10000000" => count <= "00000001";
                when others => count <= "00000001";
            end case;
        else
            count <= "00000001";
        end if;
    end if;
    end process;
    
end;