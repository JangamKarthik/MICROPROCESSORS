DATA SEGMENT
    num1 DB 2
    num2 DB 3
    num3 DB 4
    num4 DB 5
    result DB ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

    ; function to calculate LCM of two numbers
    LCM PROC NEAR
        push ax
        push bx
        push cx
        push dx

        mov ax, word ptr [bp + 4]
        mov bx, word ptr [bp + 6]

    lcm_loop_internal:
        xor dx, dx
        mov cx, bx
        div cx
        test dx, dx
        jnz lcm_loop_internal

        mov ax, bx
        mov bx, word ptr [bp + 4]
        xor dx, dx
        div bx

        mov word ptr [bp + 8], ax
        pop dx
        pop cx
        pop bx
        pop ax
        ret
    LCM ENDP

    START:
        mov ax, DATA
        mov ds, ax

        ; calculate LCM of num1 and num2
        mov al, num1
        mov bl, num2
        push bx
        push ax
        call LCM
        add sp, 4
        mov result, al

        ; calculate LCM of num3 and result
        mov al, num3
        mov bl, result
        push bx
        push ax
        call LCM
        add sp, 4
        mov result, al

        ; calculate LCM of num4 and result
        mov al, num4
        mov bl, result
        push bx
        push ax
        call LCM
        add sp, 4
        mov result, al

        ; exit program
        mov ah, 4Ch
        int 21h

    CODE ENDS
END START