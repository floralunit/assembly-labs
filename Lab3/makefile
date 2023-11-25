all:
	nasm -f elf64 -F dwarf -g calculate_expression_asm.asm
	nasm -f elf64 -F dwarf -g vvod.asm
	gcc -c -g -ggdb -o word.o word.c      
	gcc -m64 -o lab3 word.o calculate_expression_asm.o vvod.o -g -ggdb -fno-pie -no-pie
