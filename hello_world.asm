# Build using gnu assembler:
#
# as hello_world.asm -o hello_world.o   # assemble
#
# Generate executable using linker:
#
# ld hello_world.o -o hello_world 
#
.global _start

.section .data
message: .ascii "Hello World\n"

.section .text
_start:
    mov $1, %rax
    mov $1, %rdi
    mov $message, %rsi
    mov $15, %rdx
    syscall
        
    mov $60, %rax
    mov $0, %rdi
    syscall
