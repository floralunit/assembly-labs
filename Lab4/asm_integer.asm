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
    mov dword [result_asm], eax  
    cmp eax, [d]
    jg next_iteration
    cmp eax, [c]
    jl next_iteration
    mov dword [result_asm], eax    

next_iteration:   
    inc ecx
    cmp ecx, [N] ; условие выхода из цикла
    jng cycle
    end_loop
    
end_loop:
    ret

