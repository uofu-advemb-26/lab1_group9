PICO_TOOLCHAIN_PATH?=/usr/local
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp

CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

.PHONY: all
all: firmware.elf

firmware.elf: $(OBJS)
	$(LD) -o $@ $^
	
# main.s: main.i
# 	$(CC) -S main.i
	
# main.o: main.s
# 	$(AS) main.s -o main.o

# main.i: main.c
# 	$(CPP) main.c > main.i

# second.o: second.c

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

%.i: %.c
	$(CPP) $< > $@

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f main.i main.o main.s second.o firmware.elf hello.txt