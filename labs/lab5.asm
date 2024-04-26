dosseg
.model small
.stack 100h
.data

msg1 db "number is equal $"
msg2 db "number is not equal $"

.code
main proc
mov ax,@data
mov ds,ax

mov dl,'3'   ;we use 3 in commas because when we take input there is 
mov ah,1     ;ascii code of it but the ascii code of 3 is not there so we take it in commas
int 21h

cmp dl,al
je l1

mov dx, offset msg2
mov ah,9
int 21h

mov ah,4ch     ; we need to end it there because if the num is not same then msg2 print and 
int 21h         ;without these two lines code it will go on the loop and print msg1. 
                ;That's why we end it there also

l1:
mov dx, offset msg1
mov ah,9
int 21h
mov ah,4ch
int 21h

main endp
end main