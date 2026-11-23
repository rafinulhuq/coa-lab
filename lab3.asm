.MODEL SMALL
.STACK 100H

.DATA
    MSG1        DB 'First Message Printed$'
    MSG2        DB 'Second Message Skipped$'
    MSG_RES     DB 'Final Result = $'
    RESULT      DB ?

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; 1. Print the first message
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    CALL PRINT_NEWLINE

    ; 2. Skip the second message using JMP
    JMP SKIP_SECOND

PRINT_SECOND:
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    CALL PRINT_NEWLINE

SKIP_SECOND:
    ; 3. Calculate 5 + 3 - 2 + 1 using ADD, SUB, and INC
    MOV AL, 5
    ADD AL, 3           ; 5 + 3 = 8
    SUB AL, 2           ; 8 - 2 = 6
    INC AL              ; 6 + 1 = 7
    MOV RESULT, AL

    ; 4. Print the calculated result
    LEA DX, MSG_RES
    MOV AH, 09H
    INT 21H

    MOV DL, RESULT
    ADD DL, 30H         ; Convert integer to ASCII
    MOV AH, 02H
    INT 21H

    CALL PRINT_NEWLINE

    ; Terminate program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; Procedure to print Carriage Return and Line Feed
PRINT_NEWLINE PROC
    MOV AH, 02H
    MOV DL, 0DH         ; Carriage Return (CR)
    INT 21H
    MOV DL, 0AH         ; Line Feed (LF)
    INT 21H
    RET
PRINT_NEWLINE ENDP

END MAIN

