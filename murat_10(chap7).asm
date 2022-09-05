.model small
.stack 100h
.data 
msg1 db 10,13,' Type a hex number (0 to FFFF):$' 
msg2 db 10,13,'Illegal hex digit,try again:$' 
msg3 db 10,13,'In Binary it is $'
.code 
main proc
     
    mov ax,@data  
    mov ds,ax     
    jmp input 
invalid:    
    lea dx, msg2    
    mov ah,9    
    int 21h
input:  
    lea dx,msg1  
    mov ah,9  
    int 21h    
    xor bx,bx      
    
    mov cl,4  
    mov ah,1  
    int 21h  
convert:      
    cmp al,0dh  
    je end_input   
    cmp al,'0'  
    jb invalid  
    cmp al,'F'  
    ja invalid   
    cmp al,39h  
    ja letter  
    and al,0fh  
    jmp left
letter:   
    sub al,55d  
left:    
    shl bx,cl    
    or bl,al    
    mov ah,1    
    int 21h    
    jmp convert 
end_input:     
    lea dx,msg3     
    mov ah,9     
    int 21h     
    xor dx,dx     
    mov cx,16
print_binary:
     shl bx,1     
     jc one     
     mov dl,30h     
     jmp display   
one:   
    mov dl,31h
display:    
    mov ah,2    
    int 21h
    loop print_binary

main endp
end main