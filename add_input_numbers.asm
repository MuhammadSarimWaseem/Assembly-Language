; Input two numbers and ADD them.

.model small          
.stack 100h        
.data
.code
Main Proc              ; Main procedure starts

         Mov ah,1      ; Set AH register to 1 (to read a character from standard input)
         INT 21h

         Mov bl,al     ; Move the ASCII value of the first character to BL register
         Mov ah,1      ; Set AH register to 1 (to read a character from standard input)
         INT 21h

         Add bl,al     ; Add the ASCII values of the two characters (convert them to integers)
         Sub bl,48     ; Convert the ASCII value of the result to its corresponding character
         Mov dl,bl     ; Move the result to DL register
         Mov ah,2      ; Set AH register to 2 (to use DOS function for displaying a character)
         INT 21h

         Mov ah,4ch
         INT 21h

Main endp              ; End of main procedure
End Main              