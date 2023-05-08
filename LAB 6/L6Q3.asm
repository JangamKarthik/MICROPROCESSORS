DATA SEGMENT
Num1 Db 96h
Num2 Db 3Ch
lcm DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: 
MOV AX, DATA
MOV DS, AX

mov ax,0h
MOV Al, Num1 
MOV Bl, Num2 
call GCD
mov al,Num1
mul Num2
mov bh,0h
mov dx,0h
div bx
mov lcm,ax

MOV AH, 4CH
INT 21H

GCD Proc
FIRST: 
	CMP Al, Bl
	JA NEXT 
	XCHG Al, Bl
NEXT:
	DIV Bl 
	CMP ah, 00h 
	JE LAST 
	MOV al, ah 
	mov ah,0h
	JMP FIRST
LAST: 
RET
GCD ENDP

CODE ENDS
END START
