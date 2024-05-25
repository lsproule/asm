.PHONY: all clean

CC=gcc

OUTPUT_DIR=build
SRCS=$(wildcard *.c)
ASM=$(wildcard *.asm)


%.o: %.asm
	nasm -f elf64 -o $(OUTPUT_DIR)/$@ $^

%.o: %.c
	$(CC) -c -o $(OUTPUT_DIR)/$@ $^

build: $(ASM:.asm=.o) $(SRCS:.c=.o)
	$(CC) -o $(OUTPUT_DIR)/hello $(OUTPUT_DIR)/*.o -z execstack -no-pie

all: $(ASM:.asm=.o) $(SRCS:.c=.o) build

clean:
	rm -f build/*


