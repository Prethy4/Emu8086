.MODEL small
.STACK 100h
.DATA    
o db 'number is Odd: ', 0dh, 0ah,'$' 
e db 'number is Even: ', 0dh, 0ah,'$'
.CODE

MAIN PROC           
    mov ax, @data
    mov ds, ax   
    
a: 
    mov ah, 1
    int 21h
    mov bl, al
    mov ah, 2
    mov dl, '_'
    int 21h
    cmp bl, '0'
    jl invalid
    cmp bl, '9'
    jg check2
    
    mov dl, bl
    int 21h
    jmp loopend
    
check2:
    cmp bl,'A'
    jl invalid
    cmp bl, 'F'
    jg invalid
    
    mov dl, 'l'
    int 21h
    mov dl, bl
    sub dl, 'A'
    add dl, '0'
    int 21h
    
    jmp loopend
    
    
invalid:
    mov dl, 'i'
    int 21h 
    
loopend:
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    jmp a
    
      
    
    exit:
    mov ah, 4ch
    int 21h
    
    
ENDP MAIN
END MAIN
    