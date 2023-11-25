all:
	gcc -c -g -ggdb -o integer.o integer.c
	gcc -c -g -ggdb -o word.o word.c      
	nasm -f elf64 -F dwarf -g asm_integer.asm
	gcc -m64 -o integer integer.o asm_integer.o -g -ggdb -fno-pie -no-pie
	gcc -m64 -o word word.o asm_integer.o -g -ggdb -fno-pie -no-pie

