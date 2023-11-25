section .text
global asmArrayProduct

asmArrayProduct:
    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]  ; адрес массива A
    mov ecx, [ebp+12] ; длина массива N
    mov edx, [ebp+16] ; количество первых отрицательных элементов L
    mov esi, [ebp+20] ; значение c
    mov edi, [ebp+24] ; значение d

    xor eax, eax      ; обнуляем регистр, в котором будет храниться произведение
    mov ebp, 0        ; счетчик отрицательных элементов

    loop_start:
        movzx edx, word [ebx] ; загружаем элемент массива
        cmp edx, esi          ; проверяем, больше ли или равен элемент значения c
        jl skip_condition     ; переход, если меньше
        cmp edx, edi          ; проверяем, меньше ли или равен элемент значения d
        jg skip_condition     ; переход, если больше
        test edx, edx         ; проверяем, отрицательное ли число
        js process_negative   ; переход, если отрицательное
    skip_condition:
        add ebx, 2            ; переходим к следующему элементу массива
        loop loop_start       ; повторяем для остальных элементов
        jmp loop_end          ; выходим из цикла

    process_negative:
        imul eax, edx         ; перемножаем элемент на текущее значение произведения
        inc ebp               ; увеличиваем счетчик отрицательных элементов
        cmp ebp, edx          ; сравниваем счетчик с количеством первых отрицательных элементов
        je loop_end           ; если счетчик равен L, выходим из цикла

    loop_end:
        pop ebp
        ret
