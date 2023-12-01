all:
	gcc -c -g -ggdb -o lab5.o lab5.c    
	nasm -f elf64 -F dwarf -g asm_lab5.asm
	gcc -m64 -o lab5 lab5.o asm_lab5.o -g -ggdb -fno-pie -no-pie

