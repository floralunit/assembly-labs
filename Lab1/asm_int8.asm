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
	movsx eax, byte [a]
    	imul eax, -3         ; Умножение EAX на -3
    	movsx ebx, byte [b]          ; Вычитание b из EAX
    	sub eax, ebx
    	add eax, 53          ; Добавление 53 к EAX
    	mov [numerator_asm], eax
    	
    	movsx ebx, byte [a]    ; Загрузка значения a в AX
    	sar ebx, 1           ; Половинное деление значения a, т.е. побитовый сдвиг
    	movsx ecx, byte [c]          ; Вычитание a/2 из с
    	sub ecx, ebx
    	inc ecx
    	mov [denominator_asm], ecx
    	
    	mov eax, dword [numerator_asm]
    	cdq
    	idiv dword [denominator_asm]
    	mov dword [result_asm], eax
    	mov dword [remainder_asm], edx

	ret

