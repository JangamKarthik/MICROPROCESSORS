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
Num DW 0096h,003Ch,0086h,0056h
Ans DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: 
MOV AX, DATA
 MOV DS, AX

lea si,Num
MOV AX, [si]
inc si
inc si
mov cx,3
L:
MOV BX,[si] 
GCD
mov ax,Ans
inc si
inc si
loop L

MOV AH, 4CH
INT 21H


CODE ENDS
END START
