; print array from 1 to 4

dosseg
.model small
.stack 100h
.data

    array db '1234'

.code
main proc
         mov  ax,@data
         mov  ds,ax
         mov  SI ,offset array
         mov  cx, 5

    L1:  
         mov  dx,[SI]
         mov  ah,2
         int  21h
        
         mov  dx,10
         mov  ah,2
         int  21h
         mov  dx,13
         mov  ah,2
         int  21h

         inc  SI
         LOOP L1
        
         mov  ah,4ch
         int  21h

main endp
end main