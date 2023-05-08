data segment
arr dw 9A52h,0524h,0FA85h,8654h,9999h
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

lea si,arr
mov cx,04h
loop1:
        mov bx,cx
        loop2:
                mov ax,[si]
                cmp ax,[si+2]
                jng L1
                mov dx,[si+2]
                mov [si],dx
                mov [si+2],ax
                L1:
                inc si
                inc si
        loop loop2
        mov cx,bx
        lea si,arr
loop loop1
mov ah,4ch
int 21h
code ends
end start

