PICO_TOOLCHAIN_PATH?=/usr/local/bin
CPP=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-cpp

main.i: main.c
	$(CPP) main.c > main.i

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f main.i hello.txt