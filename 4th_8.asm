.MODEL small
.STACK 100h
.DATA    
o db 'number is Odd: ', 0dh, 0ah,'$' 
e db 'number is Even: ', 0dh, 0ah,'$'
.CODE

MAIN PROC           
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    mov ah, 1
    
    
a: 
    int 21h
    cmp al, 0dh
    je exit
    inc cx
    jmp a
      
    
    exit:
    mov ah, 4ch
    int 21h
    
    
ENDP MAIN
END MAIN
    