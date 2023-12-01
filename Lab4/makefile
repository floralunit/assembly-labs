all:
	gcc -c -g -ggdb -o lab4.o lab4.c    
	nasm -f elf64 -F dwarf -g asm_lab4.asm
	gcc -m64 -o lab4 lab4.o asm_lab4.o -g -ggdb -fno-pie -no-pie

