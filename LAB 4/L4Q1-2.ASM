DATA SEGMENT
NUM1 DB 7AH
NUM2 DB 0F5H
RES DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:MOV AX,DATA
MOV DS,AX
MOV AX,0000H
MOV AL,NUM1
MOV BL,NUM2
IMUL BL
MOV RES,AX
MOV AH,4CH
INT 21H
CODE ENDS
END START
