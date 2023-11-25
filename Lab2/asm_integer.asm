section .data
extern a
extern b
extern c
extern result_asm_num

section .text
global calculate_expression_asm
calculate_expression_asm:
    cmp dword [a], dword [b]   ; Сравнение a и b
    jl less_than              ; Если a < b, переход к метке less_than
    je equal                  ; Если a = b, переход к метке equal
    jg greater_than           ; Если a > b, переход к метке greater_than

less_than:
    mov eax, dword [a]        ; Загрузка значения a в EAX
    imul eax, dword [b]       ; Умножение EAX на b
    sub eax, 20               ; Вычитание 20 из EAX
    mov [result_asm_num], eax ; Сохранение результата в result_asm_num
    ret

equal:
    mov eax, 20               ; Загрузка значения 20 в EAX
    mov [result_asm_num], eax ; Сохранение результата в result_asm_num
    ret

greater_than:
    mov eax, 9                ; Загрузка значения 9 в EAX
    imul eax, dword [a]       ; Умножение EAX на a
    cdq                       ; Расширение знака из EAX в EDX:EAX
    idiv dword [b]            ; Деление EDX:EAX на b
    mov [result_asm_num], eax ; Сохранение результата в result_asm_num
    ret
