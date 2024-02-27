; Program to input a character and print on screen.

.model small          
.stack 100h           
.data
.code
Main Proc

         Mov ah,1      ; Set AH to 1 (for character input)
         INT 21h

         Mov dl,al     ; Move input character to DL register
         Mov ah,2      ; Set AH to 2 (for character output)
         INT 21h

         Mov ah,4ch    ; Set AH to 4Ch (for program termination)
         INT 21h

Main endp
End Main
