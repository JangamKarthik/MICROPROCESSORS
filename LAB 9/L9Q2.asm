print macro msg
lea dx,msg
mov ah,09
int 21h
endm

data segment 
msg1 db 'Enter the String: $'
right db 'Palindrome$'
wrong db 'Not Palindrome$'
nln db 10,13,'$'
enter db 0Ah
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

mov si,dx
inc si

mov ax,0h
mov al,[si]
mov bl,02h
div bl
mov cx,0h
mov cl,al
mov di,si
mov dx,0h
mov dl,[si]
add di,dx
inc si
back:
	mov al,[si]
	cmp al,[di]
	jne last
	inc si
	dec di
loop back
print right
jmp exit

last:
print wrong
exit:
mov ah,4ch
int 21h

code ends
end start