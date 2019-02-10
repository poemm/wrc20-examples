.PHONY: all

#LLVM_BUILD_DIR=/path/to/llvm-build
LLVM_BUILD_DIR=/home/user/repos/benchmarking/wasmception/build/llvm

all:
	$(LLVM_BUILD_DIR)/bin/clang -cc1 -Ofast -emit-llvm -triple=wasm32-unknown-unknown-wasm wrc20.c
	$(LLVM_BUILD_DIR)/bin/llc -O3 -filetype=obj wrc20.ll -o wrc20.o
	$(LLVM_BUILD_DIR)/bin/wasm-ld --no-entry wrc20.o -o wrc20.wasm --strip-all -allow-undefined-file=wrc20.syms -export=_main
	rm wrc20.ll wrc20.o

