.MODEL small
.STACK 100h
.DATA   
str db 'Ax contains zero$'
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
   mov ax, 0
   test ax, 0ffffh
   jz zero
   jmp exit
   
zero:
    mov ah, 9
    lea dx, str
    int 21h
   
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN
    