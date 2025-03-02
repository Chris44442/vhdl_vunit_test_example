library ieee;
use ieee.std_logic_1164.all;
 
package example_record_pkg is
  type example_record is record
    foo : std_logic_vector(15 downto 0);
    bar : std_logic_vector(15 downto 0);
  end record;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.example_record_pkg.all;

entity dut is port(
  in1 : in std_logic_vector(31 downto 0);
  out1 : out example_record);
end entity;

architecture rtl of dut is
begin

out1.foo <= in1(15 downto 0);
out1.bar <= in1(31 downto 16);

end architecture;

