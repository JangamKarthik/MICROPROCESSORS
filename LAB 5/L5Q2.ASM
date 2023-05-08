data segment
hex db 0ADh
divi db 0Ah
bcd db 00h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ax,00h
mov al,hex
lea si,bcd
L1:
        div divi
        mov [si],ah
        inc si
        cmp al,divi
        mov ah,00h
        JAE L1
mov [si],al
mov ah,4ch
int 21h
code ends
end start
        
