;%include        'asm_calc.asm'


section .data
    promptA db "Enter a: ", 0
    promptB db "Enter b: ", 0
    promptError db "Error!", 0
    result_msg db "The sum is: %d", 10, 0
    num dd 0
    a dd 0
    b dd 0
    result_asm_num dd 0

section .bss
    buffer resb 16

section .text
    global main

main:
    ; вывод приветствия и ввод первого числа
    mov eax, 4
    mov ebx, 1
    mov ecx, promptA
    mov edx, 8
    int 0x80
    
    call read_num
    mov [a], eax
    call write_eax
    
    mov eax, 4
    mov ebx, 1
    mov ecx, promptB
    mov edx, 8
    int 0x80
    
    call read_num
    mov [b], eax
    call write_eax
    
    call calculate_expression_asm

    ; завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80   
    ret
    
write_eax:
    lea edi, [buffer + 15]
    mov byte [edi], 0x0A   ; newline character

convert_write:
    dec edi
    xor edx, edx
    mov ecx, 10
    div ecx
    add dl, '0'
    mov [edi], dl
    test eax, eax
    jnz convert_write

    ; Write to console
    mov eax, 4
    mov ebx, 1
    lea ecx, [edi]
    lea edx, [buffer + 16]
    sub edx, ecx
    int 0x80
    ret
    
read_num:
    ; Read from console
    mov eax, 3
    mov ebx, 0
    lea ecx, [buffer]
    mov edx, 16
    int 0x80

    ; Convert string to number
    xor eax, eax
    lea esi, [buffer]

convert_read:
    movzx edx, byte [esi]
    cmp dl, 0x0A   ; newline character
    je done
    imul eax, 10
    sub edx, '0'
    add eax, edx
    inc esi
    jmp convert_read

done:
    cmp eax, 0
    jl error
    cmp eax, 65000
    jg error
    ret
    
error:
    mov eax, 4
    mov ebx, 1
    mov ecx, promptError
    mov edx, 8
    int 0x80
    ret
    
; b*a-20, если a<b 	20, если a=b 	9*a/b, если a>b

calculate_expression_asm:
    mov eax, [a]
    mov ebx, [b]
    cmp eax, ebx   ; Сравнение a и b
    jl less_than              ; Если a < b, переход к метке less_than
    je equal                  ; Если a = b, переход к метке equal
    jg greater_than           ; Если a > b, переход к метке greater_than

less_than:
    mov eax, dword [a]        ; Загрузка значения a в EAX
    imul eax, dword [b]       ; Умножение EAX на b
    sub eax, 20               ; Вычитание 20 из EAX
    mov [result_asm_num], eax ; Сохранение результата в result_asm_num
    call write_eax
    ret

equal:
    mov eax, 20               ; Загрузка значения 20 в EAX
    mov [result_asm_num], eax ; Сохранение результата в result_asm_num
    call write_eax
    ret

greater_than:
    cmp ebx, 0
    je error_calc	
    mov eax, 9                ; Загрузка значения 9 в EAX
    imul eax, dword [a]       ; Умножение EAX на a
    cdq                       ; Расширение знака из EAX в EDX:EAX
    idiv dword [b]            ; Деление EDX:EAX на b
    call write_eax
    mov [result_asm_num], eax ; Сохранение результата в result_asm_num
    ret

error_calc:
    ret
    
