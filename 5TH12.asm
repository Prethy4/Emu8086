.MODEL small
.STACK 100h
.DATA   
str db 0dh, 0ah, 'The number is even', 0dh, 0ah,'$' 
odd db 0dh, 0ah, 'The number is odd', 0dh, 0ah,'$'
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 l1:  
    mov ah, 1
    int 21h
    
    mov bl, al
    xor bl, 00100000b  
    
    mov ah, 2
    mov dl, '_'
    int 21h
    mov dl, bl
    int 21h 
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    jmp l1
    
    
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN
    