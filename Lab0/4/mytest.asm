section .data
extern var
;extern result

; y = x2 + 4x - 5

section .text
global asmfunc
asmfunc:
	mov ax, [var]
	imul ax		;dx:ax = var * var
	mov bx, [var]
	sal bx, 2	; умножение на 4, по факту сдвиг
	add ax, bx
	sub ax, 5
	; mov [result], ax
	ret
