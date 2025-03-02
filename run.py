from vunit import VUnit

vu = VUnit.from_argv(compile_builtins=False)
vu.add_vhdl_builtins()
lib = vu.add_library("lib")
lib.add_source_files("*.vhd")
vu.main()

