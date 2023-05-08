data segment
fact dw 0005h
res dw 00h
data ends
code segment 
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ax,0001h
mov dx,00h
call factorial 
mov si,offset res
mov [si],dx
mov [si+2],ax
mov ah,4ch
int 21h

factorial proc
mov bx,fact
mul bx
dec fact
cmp fact,0000h
je L1
call factorial
L1:
ret
factorial endp

code ends
end start

