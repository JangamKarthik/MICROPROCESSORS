print macro msg
lea dx,msg
mov ah,09
int 21h
endm

data segment 
pass db 'PASSWORD'
ct equ $-pass
msg1 db 'Enter the Password(8 characters): $'
right db 'Right Password$'
wrong db 'Wrong Password$'
enter db 0Ah
nln db 10,13,'$'
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov es,ax

cld
print msg1
print nln

lea bx,enter
mov dx,bx
mov ah,0Ah
int 21h

lea si,pass
mov di,dx
inc di

mov bx,ct
cmp bl,[di]
jne ncrt
mov cx,0h
mov cl,[di]
inc di
back:
	cmpsb
	jne ncrt
loop back
print right
jmp exit

ncrt:
print wrong
exit:
mov ah,4ch
int 21h

code ends
end start
