.MODEL small
.STACK 100h
.DATA
    msg db 'Enter a character: $'
    msg1 DB 0AH,0DH,'THE ASCII CODE OF '
    output DB ?
    msg2 DB ' IN BINARRY IS $'
    count1 DB 0AH,0DH,'THE NUMBER OF 1 BIT IS '
    count DB ?
    count2 DB '$'
.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV AH,9
    LEA DX,msg
    INT 21H
 
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV output,AL
    MOV CL,0
    MOV CH,0
    MOV AH,9
    LEA DX,msg1
    INT 21H
 
    TOP:
        CMP CL,8
        JE END_
        INC CL
        SHL BL,1
        JC COUNTONE
        MOV AH,2
        MOV DL,30H
        INT 21H
     
        JMP TOP
    COUNTONE:
        MOV AH,2
        MOV DL,31H
        INT 21H
     
        INC CH
        JMP TOP
    END_:
    ADD CH,30H
    MOV count,CH
 
    MOV AH,9
    LEA DX,count1
    INT 21H
 
    MOV AH,4CH
    INT 21H
     
    MAIN ENDP
END MAIN