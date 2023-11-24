section .data

msg: db "Input number: ", 0x0a
len: db $-msg

section .bss
inp resb 2
li resb 1

section .text
global main
main:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	movzx edx, byte [len]
	int 80h

	mov eax, 3
	mov ebx, 1
	mov ecx, inp
	mov edx, 2
	int 80h
stop: 
	mov[li], eax
	mov rax, 1
	mov rdi, 1
	mov rsi, inp
	movzx rdx, byte [li]
	syscall
	ret
