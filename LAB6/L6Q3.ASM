DATA SEGMENT
    NUM1 DB 2
    NUM2 DB 3
    RESULT DB ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
    MOV AL, NUM1
    MOV BL, NUM2
    MUL BL
    MOV BX, AX ; store the product of NUM1 and NUM2 in BX
    MOV CX, BX ; initialize CX to the product
    MOV DX, 0 ; clear DX

UP:
    ADD CX, BX ; add the product to CX
    ADC DX, 0 ; add carry to DX
    CMP DX, 0 ; check if DX is zero
    JNE UP ; if not, repeat the loop

    ; store the LCM in RESULT
    MOV RESULT, CL

    ; exit program
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
