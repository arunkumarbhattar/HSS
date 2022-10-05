TARGETS=sanity easy easy2 path path2 path3

all: ${TARGETS}

%: %.c
	clang -emit-llvm -S -fno-discard-value-names -c -o $@.ll $< -g
	opt -load ../../build/Fuzzer/libInstrumentPass.so -Instrument -S $@.ll > $@.instrumented.ll
	clang -o $@ -L${PWD}/../../build/Fuzzer -lruntime -lm $@.instrumented.ll

clean:
	rm -f *.ll *.cov ${TARGETS}
