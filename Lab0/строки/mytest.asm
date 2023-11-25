section .data
    msg1 db "Enter the first number: ", 0
    msg2 db "Enter the second number: ", 0
    error_msg db "Error: Please enter a valid integer!", 0
    result_msg db "The result is: ", 0

section .bss
    num1 resd 1
    num2 resd 1
    input_buffer resb 5

section .text
    global main

main:
    ; Выводим сообщение для ввода первого числа
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 22
    int 0x80

    ; Читаем введенное первое число
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 5
    int 0x80
    mov dword[num1], eax

    ; Выводим сообщение для ввода второго числа
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 23
    int 0x80

    ; Читаем введенное второе число
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 5
    int 0x80
    mov dword[num2], eax

    ; Проверяем, являются ли числа целыми
    mov eax, dword[num1]
    test al, 0x0f  ; Проверяем младший байт
    jnz error       ; Если не целое, переходим к сообщению об ошибке
    mov eax, dword[num2]
    test al, 0x0f  ; Проверяем младший байт
    jnz error       ; Если не целое, переходим к сообщению об ошибке

    ; Отображаем результат
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 13
    int 0x80

    ; Выводим первое число
    mov eax, dword[num1]
    mov ebx, 1
    call print_integer

    ; Выводим пробел
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

    ; Выводим второе число
    mov eax, dword[num2]
    mov ebx, 1
    call print_integer

    ; Завершаем программу
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_integer:
    ; Рекурсивно выводим целое число в виде строки
    mov ecx, 10  ; Делитель
    xor edx, edx  ; Обнуляем edx для предотвращения ошибки деления
.loop:
    div ecx  ; Делим число на 10
    push dx  ; Сохраняем остаток от деления
    test eax, eax  ; Проверяем, закончили ли мы
    jnz .loop  ; Если нет, продолжаем
    mov eax, 4  ; Выводим остатки от деления (цифры числа)
.print_loop:
    pop dx
    add dl, '0'  ; Конвертируем цифру в символ
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Выводим пробел
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

    ret

error:
    ; Выводим сообщение об ошибке
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, 35
    int 0x80

    ; Завершаем программу
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    space db " ", 0
