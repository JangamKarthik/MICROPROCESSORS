CODE SEGMENT
ASSUME CS:CODE
START:MOV AL,08H
MOV BL,ALMOV AH,4CH
INT 21H
CODE ENDS 
END STARTS