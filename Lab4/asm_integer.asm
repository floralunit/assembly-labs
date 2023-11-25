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
    vor eax, eax
    movzx ebx, byte [N]
    mov ecx, 0

@lab:
    
    loop_end:
        ret
