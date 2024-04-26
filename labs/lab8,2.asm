dosseg
.model small
.stack 100h
.data

    msg1 db "Muhammad $"
    msg2 db "Sarim $"

.code
main proc
             mov  ax,@data
             mov  ds,ax
             call EnterKey
             mov  dx,offset msg1
             mov  ah,9
             int  21h
             call EnterKey
             mov  dx,offset msg2
             mov  ah,9
             int  21h

             mov  ah,4ch
             int  21h

main endp

Enterkey proc

             mov  dx,10
             mov  ah,2
             int  21h
             mov  dx,13
             mov  ah,2
             int  21h

             ret
EnterKey endp

end main