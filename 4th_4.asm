.MODEL small
.STACK 100h 
.DATA
.CODE

MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, 2
    
    CMP AL, 1
    JE ODD   
    
    CMP AL, 3  
    JE ODD
    
    CMP AL, 2 
    JE EVEN
    
    CMP AL, 4
    JE EVEN
  
ODD:
    MOV AH, 2
    MOV DL,'o'
    INT 21H
    JMP EXIT
    
EVEN:
    MOV AH, 2
    MOV DL, 'e'
    INT 21H
    
    
    
EXIT:
    MOV AH, 4CH
    INT 21H  
    
    
    
    
    
ENDP MAIN
END MAIN