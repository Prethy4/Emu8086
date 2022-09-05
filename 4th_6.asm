.MODEL small
.STACK 100h
.DATA    
o db 'number is Odd: ', 0dh, 0ah,'$' 
e db 'number is Even: ', 0dh, 0ah,'$'
.CODE

MAIN PROC           
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    
    mov bl, al
    
    cmp bl, 'A'
    jl Print
    cmp bl, 'Z'
    jg noPrint
    
    Print:
    mov ah, 2
    mov dl, bl
    int 21h
    
    noPrint:   
    
    exit:
    mov ah, 4ch
    int 21h
    
    
ENDP MAIN
END MAIN
    