.MODEL
.STACK 100H
 
 .DATA
    msg     DB  0DH,0AH,'$'
    msg1  DB  '***********',0DH,0AH,'$'
    msg2  DB  0DH,0AH,"$"
 
 .CODE
   MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX
 
     MOV AH, 2                   
     MOV DL, "?"
     INT 21H
 
     LEA DX, msg               
     MOV AH, 9
     INT 21H
 
     MOV AH, 1               
     INT 21H
 
     MOV BL, AL                   
 
     INT 21H                      
 
     MOV BH, AL                 
 
     INT 21H                     
 
     MOV CL, AL                
 
     LEA DX, msg2          
     MOV AH, 9
     INT 21H
     INT 21H
 
     LEA DX, msg1        
     MOV AH, 9                                           
 
     INT 21H                  
     INT 21H
     INT 21H
     INT 21H
 
     MOV msg1+4, BL
     INT 21H          
     MOV msg1+4, BH
     INT 21H         
     MOV msg1+4, CL
 
     INT 21H                   
 
     MOV msg1+4, "*"        
     MOV msg1+5, "*"      
     MOV msg1+6, "*"
 
     INT 21H                    
     INT 21H
     INT 21H
     INT 21H
 
     MOV AH, 2                 
     MOV DL, 7H
     INT 21H
 
     MOV AH, 4CH                
     INT 21H
   MAIN ENDP
 END MAIN