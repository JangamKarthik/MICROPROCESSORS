DATA SEGMENT
NUM1 DD 12345678
NUM2 DD 87654321
RESULT DD ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE , DS:DATA
START: MOV AX, DATA
MOV DS, AX
MOV EAX, DWORD PTR[NUM1]
ADD EAX, DWORD PTR[NUM2]
MOV DWORD PTR[RESULT], EAX
MOV AH, 4CH
INT 21H
CODE ENDS
END START