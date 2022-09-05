.model small
.stack 100h
.data
msg1 db 10,13,'Type a binary number upto 8 digits:$'  
msg2 db 10,13,'The binary sum is:$'
.code  
main proc
    mov ax,@data    
    mov ds,ax    
    
    lea dx,msg1    
    mov ah,9     
    int 21h    
    
    mov ah,1    
    int 21h    
    xor bx,bx    
    mov cx,8   
    
input1:     
    mov ah,1    
    int 21h    
    cmp al,0dh    
    je break    
    and al,0fh 
    
     shl bl,1 
     or bl,al   
     loop input1 
     
break:    
    lea dx,msg1    
    mov ah,9    
    int 21h     
    mov cx,8       
    
input2:        
    mov ah,1        
    int 21h        
    cmp al,0dh        
    je break2        
    and al,0fh              
    shl bh,1        
    or bh,al           
    loop input2    
    
break2:    
    lea dx,msg2    
    mov ah,9    
    int 21h  
    
sum:   
    add bl,bh    
    jnc zero        
    mov dl,31h   
    mov ah,2   
    int 21h   
    
zero:       
    mov dl,30h 
    mov cx,8 
    
print:    
    shl bl,1    
    jnc z   
    mov dl,31h     
    jmp display
z:       
    mov dl,30h 
    
display:     
    mov ah,2     
    int 21h
    loop print
    
    
main endp
end main