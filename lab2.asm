section .bss
    initials resb 3

section .data
    newline db 10

section .text
    global _start

_start:
    ; Read up to three bytes from stdin.
    xor eax, eax            ; sys_read
    xor edi, edi            ; stdin
    lea rsi, [rel initials]
    mov edx, 3
    syscall
    test rax, rax
    jle .exit
    mov r12, rax            ; number of bytes read

    ; Ignore trailing line endings, if present.
.trim_line_ending:
    test r12, r12
    jz .print_setup
    lea rsi, [rel initials]
    mov r13, r12
    dec r13
    mov al, [rsi + r13]
    cmp al, 10              ; LF
    je .trim_last_byte
    cmp al, 13              ; CR
    jne .print_setup
.trim_last_byte:
    dec r12
    jmp .trim_line_ending

.print_setup:
    test r12, r12
    jz .exit
    mov r13, r12
    dec r13                ; index of last initial

.print_next:
    lea rsi, [rel initials]
    add rsi, r13
    mov eax, 1              ; sys_write
    mov edi, 1              ; stdout
    mov edx, 1
    syscall

    mov eax, 1
    mov edi, 1
    lea rsi, [rel newline]
    mov edx, 1
    syscall

    test r13, r13
    jz .exit
    dec r13
    jmp .print_next

.exit:
    mov eax, 60             ; sys_exit
    xor edi, edi
    syscall
