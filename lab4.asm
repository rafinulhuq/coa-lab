.MODEL SMALL
.STACK 100H

.DATA
    ; Initial numbers
    NUM1        DB 5
    NUM2        DB 3
    NUM3        DB 2

    ; Variables to store results
    SUM_RES     DB ?
    NEG_NUM3    DB ?
    FINAL_RES   DB ?

    ; Output messages
    MSG_FIRST   DB 'First Number: $'
    MSG_SECOND  DB 'Second Number: $'
    MSG_THIRD   DB 'Third Number: $'
    MSG_SUM     DB 'Sum of First Two: $'
    MSG_NEG     DB 'Negative of Third: $'
    MSG_FINAL   DB 'Final Result: $'

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Direct flow to calculation block
    JMP OP_ADD

; 1. Add first two numbers (5 + 3 = 8)
OP_ADD:
    MOV AL, NUM1
    ADD AL, NUM2
    MOV SUM_RES, AL
    JMP OP_NEG

; 2. Find 2's complement of the third number using NEG
OP_NEG:
    MOV BL, NUM3
    NEG BL                  ; BL = -2 (0FEH in 2's complement)
    MOV NEG_NUM3, BL
    JMP OP_FINAL

; 3. Add negative value to previous sum (8 + (-2) = 6)
OP_FINAL:
    MOV AL, SUM_RES
    ADD AL, NEG_NUM3        ; 8 + (-2) = 6
    MOV FINAL_RES, AL
    JMP DISP_FIRST

; 4. Display first number (5)
DISP_FIRST:
    LEA DX, MSG_FIRST
    MOV AH, 09H
    INT 21H

    MOV DL, NUM1
    ADD DL, 30H             ; Convert integer to ASCII character
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE
    JMP DISP_SECOND

; 5. Display second number (3)
DISP_SECOND:
    LEA DX, MSG_SECOND
    MOV AH, 09H
    INT 21H

    MOV DL, NUM2
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE
    JMP DISP_THIRD

; 6. Display third number (2)
DISP_THIRD:
    LEA DX, MSG_THIRD
    MOV AH, 09H
    INT 21H

    MOV DL, NUM3
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE
    JMP DISP_SUM

; 7. Display sum of first two numbers (8)
DISP_SUM:
    LEA DX, MSG_SUM
    MOV AH, 09H
    INT 21H

    MOV DL, SUM_RES
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE
    JMP DISP_NEG

; 8. Display negative of third number (2)
DISP_NEG:
    LEA DX, MSG_NEG
    MOV AH, 09H
    INT 21H

    MOV DL, NUM3
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE
    JMP DISP_FINAL

; 9. Display final result (6)
DISP_FINAL:
    LEA DX, MSG_FINAL
    MOV AH, 09H
    INT 21H

    MOV DL, FINAL_RES
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE
    JMP EXIT_PROG

; 10. Terminate program
EXIT_PROG:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; Procedure to print Carriage Return and Line Feed
PRINT_NEWLINE PROC
    MOV AH, 02H
    MOV DL, 0DH             ; Carriage Return (CR)
    INT 21H
    MOV DL, 0AH             ; Line Feed (LF)
    INT 21H
    RET
PRINT_NEWLINE ENDP

END MAIN

