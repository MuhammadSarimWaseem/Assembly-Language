; print 4 variables

dosseg

.model small
.stack 100h
.data
var1 db "SARIM $"
var2 db 1
var3 db ?
var4 db 'A'
.code

Main proc

mov ax,@data
mov ds,ax

mov dl,var4
mov ah,2
int 21h 

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset var1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov ah,1
int 21h
mov var3,al
mov cl, var2
add cl,var3
mov dl,cl
mov ah,2
int 21h

mov ah,4ch
INT 21h

Main endp
end Main