section .text
global goodbyeWorld 

goodbyeWorld:
    mov rax, 4  ; syscall number for sys_write
    mov rbx, 1  ; file descriptor 1 is stdout
    mov rcx, goodbye ; goodbye variable
    mov rdx, goodbyeLen ; length of goodbye variable
    int 0x80 ; call kernel
    ret ; return from function



section .data
    goodbye db "Goodbye World", 0xa
    goodbyeLen equ $-goodbye
