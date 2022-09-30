TARGETS=sanity easy easy2 path path2 path3

all: ${TARGETS}

%: %.c
	clang-12 -emit-llvm -S -fno-discard-value-names -c -o $@.ll $< -g
	opt-12 -load ../../build/Fuzzer/libInstrumentPass.so -Instrument -S $@.ll > $@.instrumented.ll
	clang-12 -o $@ -L${PWD}/../../build/Fuzzer -lruntime -lm $@.instrumented.ll

clean:
	rm -f *.ll *.cov ${TARGETS}
