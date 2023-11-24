section .data
extern var
;extern result

; y = x2 + 4x - 5

section .text
global asmfunc
asmfunc:
	mov al, [var]
	mul al		;dx:ax = var * var
	mov dx, ax
	mov bl, [var]
	movsx bx, bl
	imul bx, bx, 4
	add dx, bx
	sub dx, 5
	mov ax, dx
	; mov [result], ax
	ret
