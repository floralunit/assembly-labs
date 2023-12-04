%include        'asm_calc.asm'

section .data
    promptA db "Enter a: ", 0
    promptB db "Enter b: ", 0
    promptError db "Error! Not unsigned int! ", 0
    promptTask db "b*a-20, если a<b 	20, если a=b 	9*a/b, если a>b ", 0
    a dd 0
    b dd 0
    result_asm_num dd 0

section .bss
    buffer resb 16

section .text
    global main

main:
    mov eax, 4
    mov ebx, 1
    mov ecx, promptTask
    mov edx, 60
    int 0x80

    ; вывод приветствия и ввод первого числа
    mov eax, 4
    mov ebx, 1
    mov ecx, promptA
    mov edx, 8
    int 0x80
    
    call read_num
    mov [a], eax
    
    mov eax, 4
    mov ebx, 1
    mov ecx, promptB
    mov edx, 8
    int 0x80
    
    call read_num
    mov [b], eax
    
    call calculate_expression_asm

    ; завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80   
    ret
    
write_eax:
    lea edi, [buffer + 15]
    mov byte [edi], 0x0A   ; newline character
    test eax, eax,
    jns convert_write
    mov byte [edi], '-'
    neg eax

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
    ;lea ecx, [edi]
    ;lea edx, [buffer + 16]
    mov ecx, edi
    mov edx, buffer
    add edx, 16
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
    cmp eax, 65535
    jg error
    ret
    
error:
    mov eax, 4
    mov ebx, 1
    mov ecx, promptError
    mov edx, 25
    int 0x80
    jmp exit
    
exit:
mov ah, 0x4C
int 0x21
ret
    

    
