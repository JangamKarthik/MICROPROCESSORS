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
num1 dw 0h
num2 dw 0h
sum dw 0h
first db 'Input First Number:$'
second db 'Input Second Number:$'
res db 'Sum is:$'
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
cmp al,41h
jl L0
sub al,37h
jmp E0
L0:
sub al,30h
E0:
mov bl,al
call input
cmp al,41h
jl L1
sub al,37h
jmp E1
L1:
sub al,30h
E1:
numc bl,al
mov num1,ax
mov dl,10
mov ah,02
int 21h


lea dx,second
mov ah,09
int 21h
call input
cmp al,41h
jl L2
sub al,37h
jmp E2
L2:
sub al,30h
E2:
mov bl,al
call input
cmp al,41h
jl L3
sub al,37h
jmp E3
L3:
sub al,30h
E3:
numc bl,al
mov num2,ax
mov dl,10
mov ah,02
int 21h


mov ax,num1
add ax,num2
mov sum,ax

lea dx,res
mov ah,09
int 21h

lea si,sum
mov ax,sum
mov dx,sum
and ax,0f000h
mov cl,0ch
shr ax,cl
cmp ax,000ah
jl L4
add ax,37h
mov [si],al
inc si
jmp L5
L4:
add ax,30h
mov [si],al
inc si
L5:
mov ax,dx
and ax,0f00h
mov cl,08h
shr ax,cl
cmp ax,000ah
jl L6
add ax,37h
mov [si],al
inc si
jmp L7
L6:
add ax,30h
mov [si],al
inc si
L7:
mov ax,dx
and ax,00f0h
mov cl,04h
shr ax,cl
cmp ax,000ah
jl L8
add ax,37h
mov [si],al
inc si
jmp L9
L8:
add ax,30h
mov [si],al
inc si
L9:
mov ax,dx
and ax,000fh
cmp ax,000ah
jl L10
add ax,37h
mov [si],al
inc si
jmp L11
L10:
add ax,30h
mov [si],al
inc si
L11:
mov bl,'$'
mov [si],bl
lea dx,sum
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
