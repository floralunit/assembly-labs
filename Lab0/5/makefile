all:
	gcc -c -g -ggdb -o ctest.o ctest.c    
	nasm -f elf64 -F dwarf -g mytest.asm
	gcc -m64 -o mytest ctest.o mytest.o -g -ggdb -fno-pie -no-pie

