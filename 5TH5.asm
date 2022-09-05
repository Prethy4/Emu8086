.MODEL small
.STACK 100h
.DATA
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
   mov ax, 450
   test ax, 0ffffh
   
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN
    