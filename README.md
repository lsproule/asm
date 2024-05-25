# ASM hello world plus makefile stuff

This is totally useless. I just wanted to see if I remembered how to do it.


```asm
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
```

```c
extern void helloWorld();

int main(){
  helloWorld();
  return 0;
}
```

```bash
nasm -f elf64 -o hello.o hello.asm
gcc -c -o main.o main.c
gcc -o helloWorld hello.o main.o
```



