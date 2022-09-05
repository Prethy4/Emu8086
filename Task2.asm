.MODEL small
.STACK 100h
.DATA
msg db 0DH, 0AH, '$'
.CODE

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 9
    LEA DX, msg
    INT 21H
    
    MOV CX, 10
    
LEVEL1:
    
    MOV DL, '*'
    MOV AH, 2
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H  
    
    
    LOOP LEVEL1
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    
    
ENDP MAIN
END MAIN
    
    
    