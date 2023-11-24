all:
	gcc -c -g -ggdb -o uint16.o uint16.c    
	nasm -f elf64 -F dwarf -g asm_uint16.asm
	gcc -m64 -o uint16 uint16.o asm_uint16.o -g -ggdb -fno-pie -no-pie
	gcc -c -g -ggdb -o int8.o int8.c    
	nasm -f elf64 -F dwarf -g asm_int8.asm
	gcc -m64 -o int8 int8.o asm_int8.o -g -ggdb -fno-pie -no-pie

