;   3. Input two numbers and ADD them.

.model small
.stack 100h
.data
.code

Main proc

mov ah,1
INT 21h
mov dl,al

mov ah,1
INT 21h

add dl,al

sub dl,48

mov ah,2
INT 21h

mov ah ,4ch
INT 21h

Main endp
end main