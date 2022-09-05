.MODEL small
.STACK 100H
.DATA 
msg db 0ah, 0dh, '$'    
.CODE
MAIN PROC
    mov ax, @data  
    mov ds, ax  


again:   
    mov ah, 9
    lea dx, msg
    int 21h
a:
    mov ah, 1
    int 21h  
    mov bl, al    
    mov ah, 2  
    mov dl, '-'
    int 21h
    cmp bl, '0'   
    jl invalid
    cmp bl, '9'
    jg check2     

    mov dl, bl
    int 21h   
    jmp loopend

check2:
    cmp bl, 'A'
    jl invalid   
    cmp bl, 'F'
    jg invalid

    mov dl, '1'
    int 21h
    mov dl, bl
    sub dl, 'A'
    add dl, '0'
    int 21h  
    jmp loopend  
 invalid:   
    mov dl, 'i'
    int 21h
    inc bl
    cmp bl, 3
    je disp
    jmp again
    disp:
    mov ah, 9
    lea dx, msg
    int 21h
    jmp exit
 
 loopend:    
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    jmp a

exit:
    MOV AH, 4CH
    INT 21H

ENDP MAIN
END MAIN 

    