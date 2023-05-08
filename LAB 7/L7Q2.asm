print macro msg
lea dx,msg
mov ah,09
int 21h
endm

printele macro 
mov ah,02h
int 21h
endm

data segment
arr db 12h,15h,17h,18h,52h,85h,69h,48h,19h,05h
smlele db 0h
msg1 db 'SMALLEST ELEMENT IS : $'
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

lea si,arr
mov ax,0h
mov al,[si]
mov smlele,al
mov cx,10
back:
        mov al,[si]
        cmp al,smlele
        jnb F
	 mov smlele,al
	F:
        inc si
loop back
print msg1
mov al,smlele
and al,0f0h
mov cl,04h
shr al,cl
cmp al,09h
jg l1
add al,30h
jmp l2
l1:
add al,37h
l2:
mov dl,al
printele
mov al,smlele
and al,0fh
cmp al,09h
jg l0
add al,30h
jmp l3
l0:
add al,37h
l3:
mov dl,al
printele

mov ah,4ch
int 21h

code ends
end start
