all:
	gcc -c -g -ggdb -o int8.o int8.c    
	nasm -f elf64 -F dwarf -g asm_int8.asm
	gcc -m64 -o int8 int8.o asm_int8.o -g -ggdb -fno-pie -no-pie

