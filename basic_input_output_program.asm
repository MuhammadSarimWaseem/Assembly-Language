; Program to demonstrate basic input and output operations in Assembly language

.model small
.stack 100h

.data
     var1 db ?            ; Variable to store user input
     var2 db 6            ; Constant value
     var3 db 'A'          ; Character to display
     var4 db 'SARIM$'     ; String to display

.code
main proc
          mov ax, @data           ; Load data segment address into AX
          mov ds, ax              ; Set DS to point to data segment

     ; Input operation
          mov ah, 1h              ; Function to read character from standard input
          int 21h                 ; Call DOS interrupt

          mov var1, al            ; Store the input character in VAR1
          mov cl, var2            ; Move constant VAR2 to CL
          add cl, var1            ; Add VAR1 to CL
          mov dl, cl              ; Move result to DL for output

     ; Output operation
          mov ah, 2h              ; Function to display character in DL
          int 21h                 ; Call DOS interrupt

     ; Output newline characters
          mov dx, 10              ; ASCII code for newline
          mov ah, 2h              ; Function to display character in DL
          int 21h                 ; Call DOS interrupt
          mov dx, 13              ; ASCII code for carriage return
          mov ah, 2h              ; Function to display character in DL
          int 21h                 ; Call DOS interrupt

     ; Display character from VAR3
          mov dl, var3            ; Move character from VAR3 to DL
          mov ah, 2h              ; Function to display character in DL
          int 21h                 ; Call DOS interrupt

     ; Output newline characters
          mov dx, 10              ; ASCII code for newline
          mov ah, 2h              ; Function to display character in DL
          int 21h                 ; Call DOS interrupt
          mov dx, 13              ; ASCII code for carriage return
          mov ah, 2h              ; Function to display character in DL
          int 21h                 ; Call DOS interrupt

     ; Display string VAR4
          mov dx, offset var4     ; Load address of VAR4 into DX
          mov ah, 9h              ; Function to display string at DS:DX
          int 21h                 ; Call DOS interrupt

     ; Exit program
          mov ah, 4Ch             ; Function to terminate program
          int 21h                 ; Call DOS interrupt

main endp
end main