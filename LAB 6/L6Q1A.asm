GCD macro
FIRST: 
        CMP AX, BX 
        ja NEXT 
        XCHG AX, BX
NEXT:
        MOV DX, 0000h 
        DIV BX
        CMP DX, 0000h
        je LAST
        MOV AX, DX
        JMP FIRST
LAST:
        MOV Ans, BX
endm

DATA SEGMENT
Num1 DW 0096h
Num2 DW 003Ch
Ans DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: 
MOV AX, DATA
 MOV DS, AX

 MOV AX, Num1
MOV BX, Num2

GCD

MOV AH, 4CH
INT 21H


CODE ENDS
END START
