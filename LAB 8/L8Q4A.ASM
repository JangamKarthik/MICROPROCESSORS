convert macro
mov dx,00h
mov ax,num
lea si,ans
L9:
        div divi
	 add dl,30h
        mov [si],dl
        dec si
        cmp ax,divi
        mov dx,00h
        JAE L9
add al,30h
mov [si],al
endm 

numc macro a,b
mov bh,10h
mov cl,b
mov al,a
mul bh
mov dx,0h
mov dx,cl
add ax,dx
endm

data segment
num dw 0h
first db 'Enter the Number:$'
res db 'Decimal Equivalent is:$'
ans dw 0h
divi dw 0ah
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov ax,0h
lea dx,first
mov ah,09
int 21h
call input
sub al,30h
cmp al,10h
jl L0
add al,0f9h
L0:

mov bl,al
call input
sub al,30h
cmp al,10h
jl L1
add al,0f9h
L1:
numc bl,al
mov num,ax
mov dl,10
mov ah,02
int 21h

lea dx,res
mov ah,09
int 21h

convert
lea di,ans
inc di
mov bl,'$'
mov [di],bl
mov dx,si
mov ah,09
int 21h


mov ah,4ch
int 21h

input proc
mov ah,01
int 21h
ret
input endp

code ends
end start
