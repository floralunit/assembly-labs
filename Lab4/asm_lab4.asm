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
    mov ecx, 0 ; счетчик цикла
    mov ebx, 1 ; инициализируем произведение единицей
    mov edx, 0 ; 

cycle:
    mov eax, dword [arr + ecx * 4]
    cmp eax, 0
    jl check_conditions
    jmp next_iteration

next_iteration:  
    inc ecx
    cmp ecx, [N] ; условие выхода из цикла
    jng cycle
    jmp exit

check_conditions:
    cmp edx, [L]
    je exit
    cmp eax, [d]
    jg next_iteration
    cmp eax, [c]
    jl next_iteration
    imul ebx, eax
    inc edx
    jmp next_iteration

exit:
    mov dword [result_asm], ebx
    ret  


