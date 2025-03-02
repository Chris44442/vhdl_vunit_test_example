library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.example_record_pkg.all;
use std.textio.all;
use ieee.std_logic_textio.all;
library vunit_lib;
context vunit_lib.vunit_context;

entity dut_tb is
  generic (runner_cfg : string);
end entity;

architecture sim of dut_tb is
  signal slv_1 : std_logic_vector(15 downto 0);
  signal slv_2 : std_logic_vector(15 downto 0);
  signal rec_1 : example_record;
  file f : text;
begin

process
  variable l : line;
  variable value : std_logic_vector(15 downto 0);
  variable space : character;
begin
  test_runner_setup(runner, runner_cfg);

  file_open(f, "stm.txt",  read_mode);
  readline(f, l);
  read(l, space);
  read(l, space);
  read(l, space);
  read(l, space);
  read(l, space);
  read(l, space);
  hex_read(l, value);

  wait for 10 ns;
  slv_1 <= value;
  slv_2 <= 16x"1234";
  wait for 1 ns;
  assert (rec_1.foo = 16x"affe");
  assert (rec_1.bar = 16x"1234");

  wait for 10 ns;
  file_close(f);
  test_runner_cleanup(runner);
end process;

dut_1 : entity work.dut port map (
  in1 => slv_2 & slv_1,
  out1 => rec_1
);

end architecture;

