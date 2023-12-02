all:
	nasm -f elf64 -F dwarf -g program.asm
	gcc -m64 -o program  program.o  -no-pie
