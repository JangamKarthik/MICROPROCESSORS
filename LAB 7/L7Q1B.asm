print macro msg
lea dx,msg
mov ah,09
int 21h
endm

data segment
arr dw 1252h,1544h,1007h,1844h,5882h,7585h,6259h,4658h,1959h,0565h
ele dw 0565h
fnd db 'FOUND$'
nfnd db 'NOT FOUND$'
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

lea si,arr
mov cx,10
back:
        mov ax,[si]
        cmp ele,ax
        je F
        inc si
inc si
loop back
print nfnd
jmp exit
F:
print fnd
exit:
mov ah,4ch
int 21h

code ends
end start
