section .data
    prompt db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    result_msg db "The sum is: %d", 10, 0

section .bss
    num1 resd 1
    num2 resd 1
    sum resd 1
    buffer resb 16

section .text
    global main

main:
    ; вывод приветствия и ввод первого числа
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    mov eax, 3
    mov ebx, 0
    lea ecx, [num1]
    mov edx, 4
    int 0x80
    
    jmp read_num1

    ; вывод приветствия и ввод второго числа
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 24
    int 0x80

    mov eax, 3
    mov ebx, 0
    lea ecx, [num2]
    mov edx, 4
    int 0x80

    ; сложение двух чисел и вывод результата
    mov eax, [num1]
    add eax, [num2]
    mov [sum], eax

    mov eax, 4
    mov ebx, 1
    lea ecx, [result_msg]
    mov edx, 16
    int 0x80

    mov eax, 1
    mov ebx, [sum]
    int 0x80

    ; завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
    
read_num1:
    ; Convert number to string
    mov eax, [num1]
    lea edi, [buffer + 15]
    mov byte [edi], 0x0A   ; newline character

convert:
    dec edi
    xor edx, edx
    mov ecx, 10
    div ecx
    add dl, '0'
    mov [edi], dl
    test eax, eax
    jnz convert

    ; Write to console
    mov eax, 4
    mov ebx, 1
    lea ecx, [edi]
    lea edx, [buffer + 16]
    sub edx, ecx
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
