; 1.Program to ADD two numbers
;   2. Program to SUB two numbers
;   3. Input two numbers and ADD them.
dosseg

.model small
.stack 100h
.data
.code
Main proc

mov dl,4
mov bl,3

add dl,bl

add dl,48
mov ah,2

INT 21h

; mov dx,10
; mov ah,2
; INT 21h
; mov dx,13
; mov ah,2
; INT 21h

; sub dl,bl

; add dl,48
; mov ah,2

; INT 21h

mov ah ,4ch
INT 21h

Main endp
End Main