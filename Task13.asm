.MODEL
.STACK 100H
.DATA
msg db '$'
.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, msg
    MOV AH, 9
    INT 21H 

level: 

    MOV AH, 1
    INT 21H
    
    CMP AL, '*'
    JE last
    CMP AL, 'A'
    JB level 
    CMP AL, 'Z' 
    JA level
    mov dl, al
    mov dh, al


level1: 
    MOV AH, 1
    INT 21H
    
    CMP AL, '*'
    JE level2
    CMP AL, 'A'
    JB level1 
    CMP AL, 'Z' 
    JA level1
    mov dh, al
    jmp level1

level2:
   mov ah, 2
   int 21h
   mov dl, dh
   mov ah, 2
   int 21h 

last:
    mov ax, 4ch
    int 21h


MAIN ENDP 
END MAIN
    