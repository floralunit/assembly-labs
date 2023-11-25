section .data
    input_msg db 'Enter value for a (0-9): ', 0
    input_msg_len equ $ - input_msg
    error_msg db 'Error: invalid input', 0
    result_msg db 'Result: ', 0
    result_msg_len equ $ - result_msg

section .bss
    input_buffer resb 10
    result resb 10

section .text
global _start

extern calculate_expression_asm
extern a
extern b
extern result_asm_num

_start:
    ; Ввод значения для a
    mov eax, 4
    mov ebx, 1
    mov ecx, input_msg
    mov edx, input_msg_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 10
    int 0x80

    ; Проверка ввода для a
    mov eax, input_buffer
    cmp eax, '0'
    jl input_error
    cmp eax, '9'
    jg input_error

    mov [a], eax

    ; Ввод значения для b
    mov eax, 4
    mov ebx, 1
    mov ecx, input_msg
    mov edx, input_msg_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 10
    int 0x80

    ; Проверка ввода для b
    mov eax, input_buffer
    cmp eax, '0'
    jl input_error
    cmp eax, '9'
    jg input_error

    mov [b], eax

    ; Вызов функции calculate_expression_asm
    call calculate_expression_asm

    ; Проверка результата на допустимые значения
    cmp dword [result_asm_num], 100   ; Проверка на значение больше 100
    jg result_error
    cmp dword [result_asm_num], -100  ; Проверка на значение меньше -100
    jl result_error

    ; Вывод результата
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result_asm_num
    mov edx, 10
    int 0x80

exit:
    ; Выход из программы
    mov eax, 1
    xor ebx, ebx
    int 0x80

input_error:
    ; Вывод сообщения об ошибке ввода для a или b
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, error_msg_len
    int 0x80

result_error:
    ; Вывод сообщения об ошибке результата вычисления
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, error_msg_len
    int 0x80

    jmp exit
