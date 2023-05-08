print macro msg
lea dx,msg
mov ah,09
int 21h
endm

data segment 
msg1 db 'Enter the String: $'
msg2 db 'Enter the SubString: $'
right db 'Found$'
wrong db 'Not Found$'
nln db 10,13,'$'
String db 15 dup(0Ah)
SubString db 0Fh
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

lea bx,String
mov dx,bx
mov ah,0Ah
int 21h

mov si,dx

print msg2
print nln

lea bx,SubString
mov dx,bx
mov ah,0Ah
int 21h

mov di,dx
inc si
inc di

mov dl,[si]
mov dh,[di]

mov cx,0h
mov cl,dl
sub cl,dh
inc cx
inc si
inc di

loop1:
	push cx
	push si
	push di
	mov al,[si]
	cmp al,[di]
	jne endl
		mov cx,0h
		mov cl,dh
		loop2:
		mov al,[si]
		cmp al,[di]
		jne endl
		inc si
		inc di
		loop loop2
		print right
		jmp exit
	endl:
	pop di
	pop si
	pop cx
	inc si
loop loop1
print wrong
exit:
mov ah,4ch
int 21h

code ends
end start