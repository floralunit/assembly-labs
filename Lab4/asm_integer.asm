section .data
extern N
extern L
extern c
extern d
extern result_asm
extern arr

section .text
global asmArrayFunc

asmArrayFunc:
xor eax, eax
 movzx ebx, byte [len] ; условие выхода из цикла
 mov ecx, 0 ; счетчик цикла
@lab:
mov [arrByte + ecx], cl ; *(arrByte + ecx) = cl – инициализируем значением младшего байта счетчика
 inc ecx ; увеличиваем счетчик
 cmp ecx, ebx ; проверяем условие выхода из цикла
 jb @lab
 ret
