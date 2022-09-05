.MODEL small
.STACK 100h
.DATA  
msg db 'enter two letters: $'
msg1 db '?', 0dh,0ah, '$'
msg2 db '?', 0dh,0ah, '$'
.CODE

PROC MAIN  
    mov ax, @data
    mov ds, ax 
    
    mov ah, 2
    mov dl, '?'
    int 21h
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    mov msg1, al
    int 21h
    mov msg2, al
    cmp msg1, al
    jb level1
    ja level2
    jmp exit 
    
    
level1:
    mov ah, 2
    mov dl, msg1
    int 21h
    mov dl, msg2
    int 21h
    jmp exit  
    
level2:
    mov ah, 2
    mov dl, msg2
    int 21h
    mov dl, msg1
    int 21h
    jmp exit   
    
    
exit:
    mov ah, 4ch
    int 21h
    
ENDP MAIN
END MAIN

    