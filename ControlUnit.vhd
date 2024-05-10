library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
    port (
        clk   : in std_logic;
        instruction : in unsigned(15 downto 0);
        jump : out std_logic;
        jump_addr : out unsigned(6 downto 0);
        PCWrite : out std_logic
    );
end entity ControlUnit;

architecture rtl of ControlUnit is
    
    component stateMachine is
        port( clk      : in std_logic;
              rst      : in std_logic;
              state : out std_logic
        );
    end component;

    signal state : std_logic := '0';
    signal opcode : unsigned(3 downto 0);
begin
    stateMachine_component : stateMachine port map (
        clk => clk,
        rst => '0',
        state => state
    );

    opcode <= instruction(15 downto 12);
    jump <= '1' when opcode = "1111" else '0';
    jump_addr <= instruction(6 downto 0);
    
    PCWrite <= '1' when state = '1' else '0';

end architecture;
