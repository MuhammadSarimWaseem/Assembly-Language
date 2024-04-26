dosseg

.model small
.stack 100h
.data
.code
Main proc

mov cx,5  ;it is for how many numbers you want top print

mov dl, 1   ;binary
; mov dl,011B   ;binary
; AND bl,dl     ;solving in binary
add dl,48

LOOP1:          ; loop name
mov ah,2
INT 21h
add dl,1        ; increase one
LOOP LOOP1       ;loop end

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov cx,3  ;it is for how many numbers you want top print

mov bl, 101B   ;binary
mov dl,011B   ;binary
OR bl,dl     ;solving in binary
add dl,48

LOOP2:          ; loop name
mov ah,2
INT 21h
add dl,1        ; increase one
LOOP LOOP2       ;loop end

mov ah,4ch
INT 21h

main endp
end main