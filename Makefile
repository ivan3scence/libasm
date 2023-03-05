.PHONY: all

all:
	nasm -f elf64 -F dwarf -g src/lol.asm
	ld src/lol.o -o lol
