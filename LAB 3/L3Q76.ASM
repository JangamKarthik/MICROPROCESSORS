DATA SEGMENT
NUM1 DB 10,11,12,13,14,15,16,17,18,19
NUM2 DB 20,21,22,23,24,25,26,27,28,29
RESULT DB 10 DUP(0)
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE , DS:DATA
START: MOV AX, DATA
MOV CX, 10
MOV SI, OFFSET NUM1
MOV DI, OFFSET NUM2
MOV BX, OFFSET RESULT
UP:
MOV AL, [DI]
SUB AL, [DI]
MOV [BX], AL
INC SI
INC DI
INC BX
LOOP UP
MOV AH, 4CH
INT 21H
CODE ENDS
END START