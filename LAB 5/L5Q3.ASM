data segment
hex dw 9FADh
divi dw 0Ah
bcd db 00h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov dx,00h
mov ax,hex
lea si,bcd
L1:
        div divi
        mov [si],dl
        inc si
        cmp ax,divi
        mov dx,00h
        JAE L1
mov [si],al
mov ah,4ch
int 21h
code ends
end start
