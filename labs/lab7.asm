dosseg

.model small
.stack 100h
.data

    msg1 db 'Enter a number $'
    msg2 db 'Number is even $'
    msg3 db 'Number is odd $'
    CRLF db 10, 13, '$'           ; Carriage return and line feed characters

.code
main proc

          mov ax,@data
          mov ds,ax

          mov dx,offset msg1
          mov ah,9
          int 21h
         
          mov dx,offset CRLF
          mov ah,9
          int 21h

          mov ah,1
          int 21h

          mov bl,2
          div bl

          cmp ah,0
          je  evens

          mov dx,offset CRLF
          mov ah,9
          int 21h

          mov dx,offset msg3
          mov ah,9
          int 21h
         
          mov ah,4ch
          int 21h

    evens:
    
          mov dx,offset CRLF
          mov ah,9
          int 21h

          mov dx,offset msg2
          mov ah,9
          int 21h

          mov ah,4ch
          int 21h

main endp
end main