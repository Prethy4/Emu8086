.MODEL small
.STACK 100h 
.DATA
.CODE

MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
; AX = +VE, BX = 1
;AX=_VE, BX = -1
;AX=0, BX = 0

    MOV AX, 50
    
    CMP AX, 0 
    JG GREATER
    JL LESS
    JE EQUAL
    
GREATER: 
    MOV BX, 1
    JMP EXIT
LESS:
    MOV BX, -1
    JMP EXIT
EQUAL:
    MOV BX, 0
    
    
    
    
EXIT:
    MOV AH, 4CH
    INT 21H  
    
    
    
    
    
ENDP MAIN
END MAIN