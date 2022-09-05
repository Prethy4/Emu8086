.MODEL small
.STACK 100h
.DATA
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
   mov ax, 0
   test ax, 0ffffh
   jmp zero
   jmp exit
   
zero:
    mov ah, 2
    mov dl, '0'
    int 21h
   
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN
    