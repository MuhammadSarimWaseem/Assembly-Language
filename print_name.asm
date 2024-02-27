; Program to print name with Character.

.model small          
.stack 100h           
.data
.code
Main Proc
           
         Mov dl,'A'    ; Move ASCII value of character 'A' into dl register
         Mov ah,2      ; display character
         INT 21h
                     
         Mov dl,'B'    ; Move ASCII value of character 'B' into dl register
         Mov ah,2      ; display character
         INT 21h
                    
         Mov dl,'C'    ; Move ASCII value of character 'C' into dl register
         Mov ah,2      ; display character
         INT 21h
         Mov ah,4ch
         INT 21h

Main endp              ; End of Main procedure
End Main