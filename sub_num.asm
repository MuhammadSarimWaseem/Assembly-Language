; Program to SUB two numbers

.model small          
.stack 100h 
.data
.code
Main Proc              ; Main procedure starts

         Mov dl,4      ; Move the value 4 into DL register
         Sub dl,3      ; Subtract 3 from the value in DL register
         Mov cl,dl     ; Move the value in DL register to CL register
         Add dl,48     ; Convert the ASCII value of the result to its corresponding character
         Mov ah,2      ; Set AH register to 2 (to use DOS function for displaying a character)
         Int 21h

         Mov ah,4ch
         INT 21h

Main endp              ; End of main procedure
End Main              