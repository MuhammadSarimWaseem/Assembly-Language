dosseg
.model small
.stack 100h
.data

    msg1 db "number is greater $"
    msg2 db "number is lesser $"

.code
main proc
            mov ax,@data
            mov ds,ax

            mov dl,'5'
            mov ah,1
            int 21h

            cmp dl,al
            jg  greater
            jl  lesser

    lesser: 
            mov dx,offset msg1
            mov ah,9
            int 21h

            mov ah,4ch
            int 21h
    greater:
            mov dx,offset msg2
            mov ah,9
            int 21h

            mov ah,4ch
            int 21h

main endp
end main