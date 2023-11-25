all:
	gcc -c -g -ggdb -o integer.o integer.c    
	nasm -f elf64 -F dwarf -g asm_integer.asm
	gcc -m64 -o lab4 integer.o asm_integer.o -g -ggdb -fno-pie -no-pie

