DATA SEGMENT
Num1 Db 0Ah
Num2 Db 3Ch
Num3 db 1Eh
Num4 db 5Ah
lcm DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: 
MOV AX, DATA
MOV DS, AX

mov ax,0h
mov bx,0h
MOV Al, Num1 
MOV Bl, Num2 
call LCMB
mov cx,ax
mov al,Num3
mov bl,Num4
call LCMB
mov bx,cx
call LCMW

MOV AH, 4CH
INT 21H

LCMB Proc
push ax
push bx
FIRST1: 
	CMP Al, Bl
	JA NEXT1 
	XCHG Al, Bl
NEXT1:
	DIV Bl 
	CMP ah, 00h 
	JE LAST1 
	MOV al, ah 
	mov ah,0h
	JMP FIRST1
LAST1: 
	mov ax,0h
	mov dx,0h
	pop dx
	pop ax
	mul dl
	mov bh,0h
	mov dx,0h
	div bx
RET
LCMB ENDP

LCMW Proc
push ax
push bx
FIRST: 
	CMP AX, BX 
	JA NEXT 
	XCHG AX, BX
NEXT:
	 MOV DX, 0000h
	DIV BX 
	CMP DX, 0000h 
	JE LAST 
	MOV AX, DX 
	JMP FIRST
LAST: 
mov ax,0h
	mov dx,0h
	pop dx
	pop ax
	mul dx
	div bx
mov lcm,ax
RET
LCMW ENDP

CODE ENDS
END START
