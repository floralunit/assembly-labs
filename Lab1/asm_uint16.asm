section .data
extern a
extern b
extern c
extern numerator_asm
extern denominator_asm
extern result_asm
extern remainder_asm

; y = (-3*a-b+53)/(c-a/2+1)

section .text
global asmfunc
asmfunc:
	mov ax, [a]    ; Загрузка значения a в AX
    	shr ax, 1           ; Половинное деление значения a, т.е. побитовый сдвиг
    	mov bx, [c]
    	sub bx, ax          ; Вычитание a/2 из с
    	inc bx
    	mov [denominator_asm], bx

   	mov eax, [a]
    	imul eax, -3         ; Умножение EAX на -3
    	sub eax, [b]          ; Вычитание b из EAX
    	add eax, 53          ; Добавление 53 к EAX
    	mov [numerator_asm], eax
    	
    	mov eax, dword [numerator_asm]
    	cdq
    	idiv dword [denominator_asm]
    	mov dword [result_asm], eax
    	mov dword [remainder_asm], edx

	ret

