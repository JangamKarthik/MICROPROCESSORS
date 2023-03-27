; define data segment
DATA SEGMENT
    num1 DW 1234h ; first number
    num2 DW 5678h ; second number
    result DW ?   ; variable to store GCD result
DATA ENDS

; define code segment
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA ; set segment registers

    ; define procedure to calculate GCD
    gcd proc
        push ax
        push bx
        push cx
        push dx

        mov ax, num1
        mov bx, num2

    gcd_loop:
        xor dx, dx
        div bx
        test dx, dx
        jz gcd_done
        mov ax, bx
        mov bx, dx
        jmp gcd_loop

    gcd_done:
        mov result, bx
        pop dx
        pop cx
        pop bx
        pop ax
        ret
      gcd endp

START:
    ; set DS register to point to DATA segment
    mov ax, DATA
    mov ds, ax

    ; call procedure to calculate GCD of num1 and num2
    call GCD

    ; exit program
    mov ah, 4Ch
    int 21h

CODE ENDS
END START
