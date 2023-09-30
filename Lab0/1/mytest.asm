extern printf

section .data       

msg:    db "Hello World!", 0x0a     
len:    db $-msg           

msg1:    db "Hello World (syscall)!", 0x0a     
len1:    db $-msg1           

msg2:    db "Hello World (printf)!", 0x0a, 0     
fmt:     db "%s", 0           

section .text   

global main     
main:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    movzx edx, byte [len]
    int 80h

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    movzx rdx, byte [len1]
    syscall

    push rbx
	mov rdi,fmt
	mov rsi,msg2
	mov rax,0       
	call    printf
	pop rbx 

    ret        
