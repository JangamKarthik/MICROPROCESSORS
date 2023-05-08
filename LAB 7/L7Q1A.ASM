print macro msg
lea dx,msg
mov ah,09
int 21h
endm

data segment
arr db 12h,15h,17h,18h,52h,85h,69h,48h,19h,05h
ele db 52h
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
        mov al,[si]
        cmp ele,al
        je F
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
