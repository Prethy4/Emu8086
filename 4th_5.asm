.MODEL small
.STACK 100h 
.DATA
o db 'Number is odd', 0dh, 0ah, '$' 
e db 'Number is even', 0dh, 0ah, '$'
.CODE

MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 1
    INT 21H
   
    mov bl, al
    sub bl, '0'
       
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h   
    
    cmp bl, 0
    je even
    
    cmp bl, 1
    je odd
    
    cmp bl, 2
    je even
     
    cmp bl, 3
    je odd
     
    cmp bl, 4
    je even
     
    cmp bl, 5
    je odd
     
    cmp bl, 6
    je even
    
    cmp bl, 7
    je odd
     
    cmp bl, 8
    je even
    
    cmp bl, 9
    je odd
    
    
   
  
odd:
    MOV AH, 9
   lea dx, o
    INT 21H
    JMP EXIT
    
even:
    MOV AH, 9
    lea dx, e
    INT 21H
    
    
    
EXIT:
    MOV AH, 4CH
    INT 21H  
    
    
    
    
    
ENDP MAIN
END MAIN