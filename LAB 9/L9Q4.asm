print macro msg
lea dx,msg
mov ah,09
int 21h
endm

data segment 
msg1 db 'Enter the String: $'
msg2 db 'After Toggle Case: $'
nln db 10,13,'$'
enter db 20 dup(0ffh)
final db 0h

data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov es,ax

lea di,final
cld
print msg1
print nln

lea bx,enter
mov dx,bx
mov ah,0Ah
int 21h
mov si,dx

print msg2
print nln

inc si
mov cx,0h
mov cl,[si]
inc si
back:
	mov al,[si]
	cmp al,60h
	jl l0
	sub al,20h
	jmp l1
	l0:
	add al,20h
	l1:
	mov [di],al
	inc di
	inc si
loop back

mov bl,'$'
mov [di],bl
print final

mov ah,4ch
int 21h

code ends
end start