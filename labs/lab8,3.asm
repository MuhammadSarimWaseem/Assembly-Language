dosseg
Enterkey macro

             mov dx,10
             mov ah,2
             int 21h
             mov dx,13
             mov ah,2
             int 21h

endm

print macro p1
          mov dx,offset p1
          mov ah,9
          int 21h

endm

.model small
.stack 100h
.data

    msg1 db "Muhammad $"
    msg2 db "Sarim $"

.code
main proc
         mov      ax,@data
         mov      ds,ax

         EnterKey
         print    msg1

         EnterKey
         print    msg2

         mov      ah,4ch
         int      21h

main endp

end main