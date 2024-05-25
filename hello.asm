section .text
global helloWorld 

helloWorld:
    mov rax, 4  ; syscall number for sys_write
    mov rbx, 1  ; file descriptor 1 is stdout
    mov rcx, hello ; hello variable
    mov rdx, helloLen ; length of hello variable
    int 0x80 ; call kernel
    ret ; return from function



section .data
    hello db "Hello World", 0xa
    helloLen equ $-hello
