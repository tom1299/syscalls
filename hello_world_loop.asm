.global _start
.section .text
_start:
.loop:
    # write(1, msg, 14)
    mov $1, %rax        # syscall: write
    mov $1, %rdi        # fd: stdout
    lea msg(%rip), %rsi
    mov $14, %rdx       # length
    syscall

    # sleep 5 seconds using nanosleep
    lea ts(%rip), %rdi  # pointer to timespec struct
    mov $35, %rax       # syscall: nanosleep
    xor %rsi, %rsi      # NULL for remaining time
    syscall

    jmp .loop           # repeat endlessly

.section .rodata
msg:
    .ascii "Hello, World!\n"

ts:
    .quad 5             # tv_sec = 5 seconds
    .quad 0             # tv_nsec = -1
