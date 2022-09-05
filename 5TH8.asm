.MODEL small
.STACK 100h
.DATA   
str db 0dh, 0ah, 'The number is even', 0dh, 0ah,'$' 
odd db 0dh, 0ah, 'The number is odd', 0dh, 0ah,'$'
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
   mov ah, 1
   int 21h
   
   test al, 1
   jz even
   
    mov ah, 9
    lea dx, odd
    int 21h
    jmp exit    
    
even:
    mov ah, 9
    lea dx, str 
    int 21h
   
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN
    