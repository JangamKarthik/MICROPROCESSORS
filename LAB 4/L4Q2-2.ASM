DATA SEGMENT
NUM1 DW 0A343H
NUM2 DB 0E4H
QUO DB ?
REM DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:MOV AX,DATA
MOV DS,AX
MOV AX,NUM1
MOV BX,NUM2
IDIV BX
MOV QUO,AL
MOV REM,DL
MOV AH,4CH
INT 21H
CODE ENDS
END START
