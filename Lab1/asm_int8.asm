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
	mov al, [a]
	cbw
	mov bx, ax
	mov al, [b]
	cbw
	mov cx, ax
	mov al, [c]
	cbw
	mov dx, ax
	
	mov al, -3
	imul bx
	sub al, cl
	add al, 53
    	mov [numerator_asm], ax
    	
    	mov al, cl
    	cwd
    	idiv bx
    	inc ax
    	sub ax, dx
    	mov [denominator_asm], ax
    	
    	mov ax, [numerator_asm]
    	cwd
    	idiv word [denominator_asm]
    	mov [result_asm], ax

	ret

