TARGETS=sanity easy easy2 path path2 path3

all: ${TARGETS}

%: %.c
	clang-12 -emit-llvm -S -fno-discard-value-names -c -o $@.ll $< -g
	opt-12 -load ../../cmake-build-debug/Fuzzer/libInstrumentPass.so -Instrument -S $@.ll > $@.instrumented.ll
	clang-12 -o $@ -L${PWD}/../../cmake-build-debug/Fuzzer -lruntime -lm $@.instrumented.ll

clean:
	rm -f *.ll *.cov ${TARGETS}
