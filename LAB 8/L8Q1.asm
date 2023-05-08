print macro msg
mov dx,offset msg
mov ah,09
int 21h
endm

printc macro
mov ah,02
int 21h
endm

data segment
msg1 db 'Enter character without echo:$'
msg2 db 'Character without echo is: $'
msg3 db 'Enter character with echo:$'
msg4 db 'Character with echo is: $'
newline db 10,13,'$'
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

print msg1
call inputwoe
print newline
print msg2
mov dl,al
printc 
print newline
print newline
print msg3
call inputwe
print newline
print msg4
mov dl,al
printc


mov ah,4ch
int 21h

inputwoe proc
mov ah,08
int 21h
ret
inputwoe endp

inputwe proc
mov ah,01
int 21h
ret
inputwe endp

code ends
end start
