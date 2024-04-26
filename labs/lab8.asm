dosseg

.model small
.stack 100h
.data
.code
main proc

mov ax,@data
mov ds,ax


    mov bx,1
    mov cx,5
     
    L1:
    push cx
    mov cx,bx

    L2:
    mov dl,'*'
    mov ah,2
    int 21h
    
loop L2
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

inc bx
pop cx

loop L1

    mov ah,4ch
    int 21h

main endp
end main