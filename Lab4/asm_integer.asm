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
    movzx ebx, byte [N] ; условие выхода из цикла
    mov ecx, 0 ; счетчик цикла
    mov dword [result_asm], 1 ; инициализируем произведение единицей

@lab:
    cmp ecx, ebx ; проверяем условие выхода из цикла
    jge @end_loop ; если ecx >= N, выходим из цикла

    mov eax, [arr + ecx*4] ; загружаем значение элемента массива в eax
    cmp eax, [d] ; сравниваем с d
    jg @next_iteration ; если a[i] > d, переходим к следующей итерации

    cmp eax, [c] ; сравниваем с c
    jl @next_iteration ; если a[i] < c, переходим к следующей итерации

    test eax, eax ; проверяем отрицательное ли число a[i]
    js @negative_number ; если отрицательное, переходим к обработке отрицательного числа

@next_iteration:
    inc ecx ; увеличиваем счетчик
    jmp @lab ; повторяем цикл

@negative_number:
    imul dword [result_asm], eax ; умножаем произведение на a[i]
    inc ecx ; увеличиваем счетчик
    cmp ecx, [L] ; сравниваем с L
    jl @lab ; если ecx < L, повторяем цикл

@end_loop:
    ret

