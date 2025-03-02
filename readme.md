# Vunit unit-test example

You can run unit-tests on HDL designs with [Vunit](https://github.com/VUnit/vunit). This is a minimalist example which runs a test on a very simple VHDL design and outputs a standard xunit .xml test result, which you can use in your CI/CD chain. In this example [NVC](https://github.com/nickg/nvc) is used to simulate the VHDL design.

To run this example, all you need is Docker.

## Run the Vunit tests

- Run the test with Docker. Clone or download this repo, cd into it and then run:

```bash
docker build -t unit_test .
docker run -v $(pwd):/home --rm unit_test python3 run.py --xunit-xml xunit_output.xml
```

The result should look like this:

```txt
...
Compiling into lib:       dut.vhd       passed
Compiling into lib:       dut_tb.vhd    passed
Compile passed

Starting lib.dut_tb.all
Output file: /home/vunit_out/test_output/lib.dut_tb.all_a3f3e53ad9df369e9b2ace3d7dfe67df35187a81/output.txt
pass (P=1 S=0 F=0 T=1) lib.dut_tb.all (0.1 seconds)

==== Summary ==========================
pass lib.dut_tb.all (0.1 seconds)
=======================================
pass 1 of 1
=======================================
Total time was 0.1 seconds
Elapsed time was 0.1 seconds
=======================================
All passed!
```

There will also be a generated test result .xml file.

- Run the test locally. Read the Dockerfile to find out how. Depending on your OS, the necessary steps can vary a bit.

