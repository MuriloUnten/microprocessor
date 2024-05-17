library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port (
        clk     : in std_logic;
        address : in unsigned(6 downto 0);
        data    : out unsigned(15 downto 0)
    );
end entity;

architecture rtl of ROM is

    type mem is array (0 to 127) of unsigned(15  downto 0);
    constant rom_data : mem := (
        0  => b"000000101_011_1000", -- ld r3, 5   (A)
        1  => b"000001000_100_1000", -- ld r4, 8   (B)
        2  => b"000000000_011_1101", -- movA r3    (C)
        3  => b"000000000_100_0001", -- add r4     (C)
        4  => b"000000000_101_1110", -- movR r5    (C)
        5  => b"111111110_101_1001", -- addi -1    (D)
        6  => b"000000000_101_1110", -- movR r5    (D)
        7  => b"010100_000_000_1111", -- jump 0x14 (E)
        8  => b"000000_000_101_1000", -- ld r5, 0  (F)
        9  => x"F009", 
        10  => x"F005",
        11 => x"F007",
        12  => x"9999",
        13 => x"F000",
        14 => x"0000",
        15 => x"0000",
        16 => x"0000",
        17 => x"F009", 
        18 => x"F005",
        19 => x"F007",
        20 => b"000000000_011_1101", -- movA r5    (G)
        21 => b"000000000_011_1110", -- movR r3    (G)
        22 => b"000010_000_011_1111", -- jump 0x02 (H)
        23 => b"000000_000_101_1000", -- ld r5, 0  (I) 
        others => (others => '0')
    );
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            data <= rom_data(to_integer(address));
        end if;
    end process;

end architecture;
