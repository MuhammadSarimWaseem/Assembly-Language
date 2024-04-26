; Program to print a single character on screen

.model small          
.stack 100h           
.data

.code
Main Proc              

         Mov dl,'A'   
         Mov ah,2      
         INT 21h

         Mov ah,4ch
         INT 21h

Main endp             
End Main             