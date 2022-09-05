.MODEL small
.STACK 100h 
.DATA
.CODE

MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H 
    MOV BL, AL
    INT 21H
    MOV BH, AL  ; 2 ASCII are stored in bh & bl
    
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    CMP BL,BH
    JG PRINT2

    MOV DL, BL
    INT 21H
    
PRINT2:
    MOV DL, BH
    INT 21H
      
    
    
    
    
EXIT:
    MOV AH, 4CH
    INT 21H  
    
    
    
    
    
ENDP MAIN
END MAIN