; Program to print a single character on screen

.model small          
.stack 100h           
.data

.code
Main Proc              ; Start of Main procedure

         Mov dl,'A'    ; Move ASCII value of character 'A' into dl register
         Mov ah,2      ; display character
         INT 21h

         Mov ah,4ch
         INT 21h

Main endp              ; End of Main procedure
End Main             
