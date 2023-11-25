section .data
    prompt1 db 'Enter the first integer: ', 0
    prompt2 db 'Enter the second integer: ', 0
    invalid_message db 'Invalid input. Please enter a valid integer.', 0
    format db '%d', 0

section .bss
    num1 resd 1
    num2 resd 1
    input_buffer resb 8

section .text
    global _start

_start:
    ; Выводим приглашение для ввода первого числа
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 25
    int 0x80

    ; Вводим первое число с клавиатуры
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 8
    int 0x80

    ; Преобразуем введенную строку в целое число
    mov eax, input_buffer
    call atoi
    mov [num1], eax

    ; Выводим приглашение для ввода второго числа
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 24
    int 0x80

    ; Вводим второе число с клавиатуры
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 8
    int 0x80

    ; Преобразуем введенную строку во второе целое число
    mov eax, input_buffer
    call atoi
    mov [num2], eax

    ; Проверяем, что оба числа являются допустимыми целыми числами (например, проверяем деление на 0)
    cmp dword [num2], 0
    je divide_by_zero_error

    ; Выводим результат на экран
    mov eax, [num1]
    mov ebx, [num2]
    call print_integers

    ; Завершаем программу
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Процедура для преобразования строки в целое число
atoi:
    push ebx
    push ecx
    push edx
    push eax
    mov eax, 0
    mov edi, 10

atoi_loop:
    xor edx, edx
    lodsb
    cmp al, 0
    je atoi_done
    cmp al, 0x30
    jb atoi_error
    cmp al, 0x39
    ja atoi_error
    sub al, 0x30
    imul eax, edi
    add eax, edx
    jmp atoi_loop

atoi_error:
    mov eax, 0
    jmp atoi_exit

atoi_done:
    pop edx
    pop ecx
    pop ebx
    ret

atoi_exit:
    pop edx
    pop ecx
    pop ebx
    ret

; Процедура для вывода двух целых чисел на экран
print_integers:
    push ebp
    mov ebp, esp
    push eax
    push ebx
    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    call print_integer
    pop ebx
    pop eax
    call print_newline
    pop ebp
    ret

; Процедура для вывода целого числа на экран
print_integer:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ebx, 10
    sub esp, 1
    xor edx, edx

print_digit:
    div ebx
    add dl, '0'
    mov [esp], dl
    inc esp
    test eax, eax
    jnz print_digit

print_loop:
    sub esp, 1
    movzx eax, byte [esp]
    push eax
    mov eax, 4
    mov ebx, 1
    lea ecx, [esp]
    mov edx, 1
    int 0x80
    add esp, 2
    inc esp
    test esp, esp
    jnz print_loop

    pop ebp
    ret

; Процедура для вывода символа новой строки
print_newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    ret

; Обработка ошибки деления на 0
divide_by_zero_error:
    mov eax, 4
    mov ebx, 2
    mov ecx, divide_by_zero_message
    mov edx, 32
    int 0x80
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    newline resb 1
    divide_by_zero_message db 'Error: Division by zero.', 10