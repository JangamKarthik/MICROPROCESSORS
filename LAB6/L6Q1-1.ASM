; define data segment
DATA SEGMENT
    num1 DW 1234h ; first number
    num2 DW 5678h ; second number
    result DW ?   ; variable to store GCD result
DATA ENDS

; define code segment
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA ; set segment registers

    ; define a macro to calculate GCD
    GCD MACRO num1reg, num2reg, resultreg
        push ax
        push bx
        push cx
        push dx

        mov ax, num1reg
        mov bx, num2reg

    gcd_loop:
        xor dx, dx
        div bx
        test dx, dx
        jz gcd_done
        mov ax, bx
        mov bx, dx
        jmp gcd_loop

    gcd_done:
        mov resultreg, bx
        pop dx
        pop cx
        pop bx
        pop ax
    ENDM

START:
    ; set DS register to point to DATA segment
    mov ax, DATA
    mov ds, ax

    ; call macro to calculate GCD of num1 and num2
    GCD num1, num2, result

    ; store result in result variable in DATA segment
    mov ax, result
    mov result, ax

    ; exit program
    mov ah, 4Ch
    int 21h

CODE ENDS
END START