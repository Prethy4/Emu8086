.MODEL small
.STACK 100h
.DATA
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    mov ax, 01010101b
    mov bx, 10101010b
    
    mov cx, ax
    and cx, bx
    
    mov ax, 01110111b
    mov cx, ax
    xor cx, bx 
    
    mov cx, ax
    not cx 
    
    mov cx, ax
    test cx, bx 
    
    mov ax, 00001111b
    and ax, 11110011b
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN
    