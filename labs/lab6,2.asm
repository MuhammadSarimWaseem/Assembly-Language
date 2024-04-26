dosseg
.model small
.stack 100h
.data

    array db 23 DUP ('$')

.code
main proc
            mov ax,@data
            mov ds,ax

            mov SI ,offset array
    L1:     
            mov ah,1
            int 21h
            cmp al,13
            je  endprog
            mov [SI],al
            inc SI
            jmp L1

    endprog:
            mov dx,offset array
            mov ah,9
            int 21h
         
            mov ah,4ch
            int 21h

main endp
end main