; define data segment
DATA SEGMENT
    num1 DW 1234h ; first number
    num2 DW 5678h ; second number
    num3 DW 2468h ; third number
    num4 DW 8642h ; fourth number
    result1 DW ?   ; variable to store GCD result
    RESULT2 DW ?
DATA ENDS

; define code segment
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA ; set segment registers

    ; define macro to calculate GCD of two numbers
    MY MACRO num1_SUFFIX, num2_SUFFIX, res_SUFFIX
        push ax
        push bx
        push cx
        push dx

        mov ax, num1_SUFFIX
        mov bx, num2_SUFFIX

    UP:
        xor dx, dx
        div bx
        test dx, dx
        jz HOGAYA
        mov ax, bx
        mov bx, dx
        jmp UP

    HOGAYA:
        mov res_SUFFIX, bx
        pop dx
        pop cx
        pop bx
        pop ax
    ENDM

    ; start of program
    START:
        mov ax, DATA ; initialize data segment
        mov ds, ax

        ; call macro to calculate GCD of num1 and num2
        MY num1, num2, result1

        ; call macro to calculate GCD of num3 and num4
       ;MY num3, num4, RESULT2

        ; exit program
        mov ah, 4Ch
        int 21h

    ; end of program
CODE ENDS
END START
