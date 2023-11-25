section .bss
    input_string resb 10
    result resb 10

section .data
    a_msg db "Введите значение для a: ", 0
    b_msg db "Введите значение для b: ", 0
    error_msg db "Ошибка: Неверный ввод", 0
    result_msg db "Результат: ", 0
    newline db 10, 0

section .text
    global _start

_start:
    ; ввод a
    mov eax, 4
    mov ebx, 1
    mov ecx, a_msg
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, input_string
    mov edx, 10
    int 0x80
    call validate_input
    mov [a], eax

    ; ввод b
    mov eax, 4
    mov ebx, 1
    mov ecx, b_msg
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, input_string
    mov edx, 10
    int 0x80
    call validate_input
    mov [b], eax

    ; вызов ассемблерной функции calculate_expression_asm
    call calculate_expression_asm

    ; вывод результата
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    int 0x80

    ; завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80

; функция для проверки корректности ввода
validate_input:
    ; ваш код здесь для проверки корректности ввода и возврата значения
    ret