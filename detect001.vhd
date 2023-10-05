library IEEE;
use IEEE.std_logic_1164.all;

entity detect001 is
  port(
    clk : in std_logic;
    input : in std_logic;
    result : out std_logic
  );
end detect001;

architecture synth of detect001 is

type state is (start, prepar1, prepar2, launch);
signal s: state := start;

begin
    process(clk) begin
        if (rising_edge(clk)) then
            case s is
                when start => s <= prepar1 when input = '0' else start;
                when prepar1 => s <= prepar2 when input = '0' else start;
                when prepar2 => s <= launch when input = '1' else prepar2;
                when launch => s <= prepar1 when input = '0' else start;
                when others => s <= start;
            end case;
        end if;
    end process;
    result <= '1' when s = launch else '0';
end;
