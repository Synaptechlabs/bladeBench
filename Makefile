all: blade_c blade_cpp blade_rs blade_zig

blade_c: blade_core.c
	gcc -O2 blade_core.c -o blade_c

blade_cpp: blade_core.cpp
	g++ -O2 blade_core.cpp -o blade_cpp

blade_rs: blade_core.rs
	rustc blade_core.rs -o blade_rs

blade_zig: blade_core.zig
	zig build-exe blade_core.zig

clean:
	rm -f blade_c blade_cpp blade_rs blade_zig