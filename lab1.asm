section .data
    num1        db 4
    num2        db 3
    sum_res     db 0
    sub_res     db 0

    msg_num1    db 'First Number is: '
    len_num1    equ $ - msg_num1
    msg_num2    db 'Second Number is: '
    len_num2    equ $ - msg_num2
    msg_sum     db 'Sum is: '
    len_sum     equ $ - msg_sum
    msg_sub     db 'Subtraction is: '
    len_sub     equ $ - msg_sub
    newline     db 10

section .text
    global _start

_start:
    ; Calculate the sum and difference.
    mov al, [num1]
    add al, [num2]
    mov [sum_res], al

    mov al, [num1]
    sub al, [num2]
    mov [sub_res], al

    ; Print the first number.
    mov eax, 1
    mov edi, 1
    lea rsi, [rel msg_num1]
    mov edx, len_num1
    syscall

    mov al, [num1]
    add al, '0'
    mov [num1], al
    mov eax, 1
    mov edi, 1
    lea rsi, [rel num1]
    mov edx, 1
    syscall
    call print_newline

    ; Print the second number.
    mov eax, 1
    mov edi, 1
    lea rsi, [rel msg_num2]
    mov edx, len_num2
    syscall

    mov al, [num2]
    add al, '0'
    mov [num2], al
    mov eax, 1
    mov edi, 1
    lea rsi, [rel num2]
    mov edx, 1
    syscall
    call print_newline

    ; Print the sum.
    mov eax, 1
    mov edi, 1
    lea rsi, [rel msg_sum]
    mov edx, len_sum
    syscall

    mov al, [sum_res]
    add al, '0'
    mov [sum_res], al
    mov eax, 1
    mov edi, 1
    lea rsi, [rel sum_res]
    mov edx, 1
    syscall
    call print_newline

    ; Print the subtraction result.
    mov eax, 1
    mov edi, 1
    lea rsi, [rel msg_sub]
    mov edx, len_sub
    syscall

    mov al, [sub_res]
    add al, '0'
    mov [sub_res], al
    mov eax, 1
    mov edi, 1
    lea rsi, [rel sub_res]
    mov edx, 1
    syscall
    call print_newline

    ; Exit successfully.
    mov eax, 60
    xor edi, edi
    syscall

print_newline:
    mov eax, 1
    mov edi, 1
    lea rsi, [rel newline]
    mov edx, 1
    syscall
    ret
