section .data
    input_msg db 'Enter the first number: ', 0
    input_msg_len equ $ - input_msg
    error_msg db 'Error: invalid input', 0 
    result_msg db 'The numbers you entered are: ', 0
    result_msg_len equ $ - result_msg

section .bss
    input_buffer resb 10
    result resb 10

section .text
global _start

extern atoi
extern printf

_start:
    ; Ввод первого числа
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

    ; Проверка ввода для первого числа
    mov eax, input_buffer
    call atoi
    test eax, eax
    jz input_error

    ; Сохранение первого числа в результирующей строке
    mov [result], eax

    ; Ввод второго числа
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

    ; Проверка ввода для второго числа
    mov eax, input_buffer
    call atoi
    test eax, eax
    jz input_error

    ; Сохранение второго числа в результирующей строке
    mov [result+4], eax

    ; Вывод результатов на экран
    mov eax, result_msg
    call printf

exit:
    ; Выход из программы
    mov eax, 1
    xor ebx, ebx
    int 0x80

input_error:
    ; Вывод сообщения об ошибке ввода чисел
    mov eax, error_msg
    call printf

    jmp exit
