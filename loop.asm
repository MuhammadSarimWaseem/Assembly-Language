.model small
.stack 100h
.data
.code

main proc

    ; Initialize loop counter (CX) to 4
    mov cx, 4
    
    ; Perform bitwise AND operation between binary values 101 and 011
    mov bl, 101b    ; Load binary value 101 into BL
    mov dl, 011b    ; Load binary value 011 into DL
    and dl, bl      ; Perform bitwise AND operation, store result in DL
    add dl, 48      ; Convert result to ASCII ('0' + result)
    
REPEAT:
    ; Output character in DL
    mov ah, 2       ; Function to output character
    int 21h         ; DOS interrupt
    
    ; Increment character value in DL for next output
    add dl, 1
    
    ; Repeat loop until CX becomes 0
    LOOP REPEAT
    
    ; Move to the next line (newline)
    mov dx, 10      ; ASCII code for newline
    mov ah, 2       ; Function to output character
    int 21h         ; DOS interrupt
    
    ; Move to the next line (carriage return)
    mov dx, 13      ; ASCII code for carriage return
    mov ah, 2       ; Function to output character
    int 21h         ; DOS interrupt
    
    ; Repeat the process for the second time
    
    ; Reinitialize loop counter (CX) to 4
    mov cx, 4
    
    ; Perform bitwise AND operation again between binary values 101 and 011
    mov bl, 101b    ; Load binary value 101 into BL
    mov dl, 011b    ; Load binary value 011 into DL
    and dl, bl      ; Perform bitwise AND operation, store result in DL
    add dl, 48      ; Convert result to ASCII ('0' + result)
    
AGAIN:
    ; Output character in DL
    mov ah, 2       ; Function to output character
    int 21h         ; DOS interrupt
    
    ; Increment character value in DL for next output
    add dl, 1
    
    ; Repeat loop until CX becomes 0
    LOOP AGAIN
    
    ; Exit program
    
    ; Function to terminate program
    mov ah, 4ch
    int 21h
         
main endp
end main