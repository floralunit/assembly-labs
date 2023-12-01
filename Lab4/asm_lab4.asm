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
    mov dword [result_asm], 1 ; инициализируем произведение единицей

cycle:
    mov eax, dword [arr + ecx * 4]
    cmp eax, 0
    jl check_conditions
    jmp next_iteration

next_iteration:  
    inc ecx
    cmp ecx, [N] ; условие выхода из цикла
    jng cycle
    ret

check_conditions:
    cmp eax, [d]
    jg next_iteration
    cmp eax, [c]
    jl next_iteration
    mov ebx, dword [result_asm]
    imul ebx, eax
    mov dword [result_asm], ebx
    jmp next_iteration  


