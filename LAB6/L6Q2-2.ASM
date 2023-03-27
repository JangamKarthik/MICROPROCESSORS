; define data segment
DATA SEGMENT
    num1 DW 1234h ; first number
    num2 DW 5678h ; second number
    num3 DW 2468h ; third number
    num4 DW 8642h ; fourth number
    result1 DW ?   ; variable to store first GCD result
    result2 DW ?   ; variable to store second GCD result
DATA ENDS

; define code segment
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA ; set segment registers

    ; function to calculate GCD of two numbers
    GCD PROC NEAR
        push ax
        push bx
        push cx
        push dx

        mov ax, word ptr [bp + 4]
        mov bx, word ptr [bp + 6]

    gcd_loop_internal:
        xor dx, dx
        div bx
        test dx, dx
        jz gcd_done
        mov ax, bx
        mov bx, dx
        jmp gcd_loop_internal

    gcd_done:
        mov word ptr [bp + 8], bx
        pop dx
        pop cx
        pop bx
        pop ax
        ret
    GCD ENDP

    ; start of program
    START:
        mov ax, data ; initialize data segment
        mov ds, ax

        ; call function to calculate GCD of num1 and num2
        lea bx, num1
        push bx
        lea bx, num2
        push bx
        call GCD
        add sp, 4

        ; store result in temporary variable
        mov result1, bx

        ; call function to calculate GCD of num3 and num4
        lea bx, num3
        push bx
        lea bx, num4
        push bx
        call GCD
        add sp, 4

        ; store result in temporary variable
        mov result2, bx

        ; exit program
        mov ah, 4Ch
        int 21h

    ; end of program
CODE ENDS
END START
