.model small
.stack 100h
.data
Menu db 10, 13, 'Enter a choice (1 or 2):'
     db 10, 13, '1) Convert 1 to 5 Decimal values to Hex'
     db 10, 13, '2) Quit Program', 10, 13, '$'

MenuInputError db 10, 13, 'Choice must be a 1, 2, or 3!'
               db 10, 13, 'Try again!', 10, 13, '$'

Decimal db 10, 13, 'Enter a number with 1 to 5 digits: ', 10, 13, '$'

.code
    Main proc
    mov ax,@data
    mov ds,ax
    
    DisplayMenu:
    mov dx,OFFSET Menu
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    
    CMP al,'1'
    JL DisplayError
    
    CMP al, '3'
    JG DisplayError
    
    CMP al,'1'
    JE Dec2Hex
    
    CMP al,'2'
    JE Quit
    
    DisplayError:
    mov dx, OFFSET MenuInputError
    mov ah,9
    int 21h
    JMP DisplayMenu
    
    Dec2Hex:
    CALL DEC2HEXA
    JMP DisplayMenu
    
    Quit:
    mov ah,4CH
    int 21h
    
    Main endp
    
DEC2HEXA proc
    mov dx,OFFSET Decimal
    mov ah,09h
    int 21h
    mov ax,0
    PUSH ax
    
    Again:
    mov ah,1
    int 21h
    
    CMP al,13 ; If Return is entered, start division.
    JE StartDivision
    
    CMP al,'0'
    JL Again
    
    CMP al,'9'
    JG Again
    
    mov ah,0
    SUB al,30h  ;30h = 48
    mov cx,ax
    POP ax
    
    mov bx,10
    MUL bx
    
    ADD ax,cx
    PUSH ax
    JMP Again
    
    StartDivision:
    mov cx,0
    mov bx,16
    POP ax
    
    Div1:
    div bx 
    PUSH dx 
    ADD cx,1 
    mov dx,0 
    CMP ax,0 
    JNE Div1
    
    HEXA:
    mov dx,0
    POP dx
    ADD dl,30h
    
    CMP dl,39h
    JG MoreHexa
    
    DisplayHexa:
    mov ah,2
    int 21h
    LOOP Hexa
    JMP Skip
    
    MoreHexa:
    ADD dl, 7h
    JMP DisplayHexa
    
    Skip:
    ret
    
    DEC2HEXA endp

End Main