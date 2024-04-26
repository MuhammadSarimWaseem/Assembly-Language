PRINTST macro p1                        ;16-BIT RGISTER USED
                mov dx,offset p1
                mov ah,9
                int 21h
endm

GRAPHICS MACRO p1
                 MOV AH,6
                 MOV AL,2
                 mov bh,10000111b
                 MOV CH,0
                 MOV CL,17
                 MOV DH,25
                 MOV DL,45
                 INT 10h
                 LEA DX, p1
                 MOV AH, 9
                 INT 21h
ENDM

DOSSEG
.MODEL Small
.STACK 100H
.DATA
        M1       DB '                 WELCOME TO ONE STOP MEDICOS $',10,13
        M2       DB 10,13,10,13,'Enter your Choise: $',10,13

        M3       DB 10,13,'  **                1.cardio-Vascular                   **$'
        M4       DB 10,13,'  **                2.Central Nervous System            **$'
        MS5      DB 10,13,'  **                3.Circulatory System                **$'
        M5       DB 10,13,'  **                4.Eyes,Nose,Ear                     **$'
               
        M8       DB 10,13,10,13,'        *  Choise your medicine from menu  *$'
        ;caedio-vascular
        P1       DB 10,13,'  **          0.Return to main menu                     **$'
        M9       DB 10,13,'  **          1.ascard                  20/-            **$'
        M11      DB 10,13,'  **          3.norvasc                 30/-            **$'
        M10      DB 10,13,'  **          2.concor                  10/-            **$'
        M12      DB 10,13,'  **          4.lipiget                 10/-            **$'
        P2       DB 10,13,'  **          5.EXIT                                    **$'

        ;central nervous system

        P3       DB 10,13,'  **          0.Return to main menu                     **$'
        M25      DB 10,13,'  **          1.sert                          40/-      **$'
        M26      DB 10,13,'  **          2.zeegap                        40/-      **$'
        M27      DB 10,13,'  **          3.qusel                         30/-      **$'
        M28      DB 10,13,'  **          4.flux capsules                 30/-      **$'
        P4       DB 10,13,'  **          5.EXIT                                    **$'

        ;circulatory system

        P5       DB 10,13,'  **         0.Return to main menu                      **$'
        M18      DB 10,13,'  **         1.flagyl                  20/-             **$'
        M19      DB 10,13,'  **         2.augmentin               30/-             **$'
        M20      DB 10,13,'  **         3.azomax                  10/-             **$'
        M21      DB 10,13,'  **         4.travocort               40/-             **$'
        P6       DB 10,13,'  **         5.EXIT                                     **$'

        ;eyes,nose,ear

        P7       DB 10,13,'  **         0.Return to main menu                      **$'
        M41      DB 10,13,'  **         1.tobradex         20/-                    **$'
        M42      DB 10,13,'  **         2.betnesol         40/-                    **$'
        M43      DB 10,13,'  **         3.tears plus       20/-                    **$'
        M44      DB 10,13,'  **         4.curine           30/-                    **$'
        P8       DB 10,13,'  **         5.EXIT                                     **$'

        ;INVALID
        M55      DB 10,13,10,13,'INVALID ENTRY$'
        M56      DB 10,13,'TRY AGAIN$'

        M57      DB 10,13,10,13,'Enter your order: $'
        M58      DB 10,13,'Quantity: $'
        M59      DB 10,13,'Total Price: $'

        QUANTITY DB ?

        M60      DB 10,13,10,13,'1.Go Back to Main Menu$'
        M61      DB 10,13,'2.EXIT$'

        ;STAR RESIZE

        MR1      DB 10,13,'  **                                                    **$'
        MR2      DB 10,13,'  ********************************************************$'

        MR3      DB 10,13,'  **                                                    **$'

        MR4      DB 10,13,'  **                                                    **$'
        MR5      DB 10,13,'  ********************************************************$'

        MR6      DB 10,13,'  *                                          *$'
        MR7      DB 10,13,'  ****************$'

        SEJ      DB 10,13,10,13,' $'
        EXIT1    DB '                           THANK YOU FOR SHOPPING $'
        k        DB 10,13,10,13,'PRESS ANY KEY TO PRINT MAIN MENU$'

.CODE
MAIN PROC
                MOV      AX,@DATA
                MOV      DS,AX
                GRAPHICS M1
                PRINTST  k
                MOV      AH, 8
                INT      21H
                JMP      TOP
        TOP:    
                CALL     NEWLINE         ;NEWLINE
                PRINTST  MR2
                PRINTST  MR2             ;BOARDER
                PRINTST  MR3
                PRINTST  M3
                PRINTST  M4
                PRINTST  MS5
                PRINTST  M5
                PRINTST  MR1
                PRINTST  MR2
                PRINTST  MR2
                PRINTST  M2

                MOV      AH, 1
                INT      21h
                MOV      BH, AL
                SUB      BH, 48

                CMP      BH, 1
                JE       CV              ;cv

                CMP      BH, 2
                JE       CNS             ;CNS

                CMP      BH, 3
                JE       CIS             ;CIS

                CMP      BH, 4
                JE       ENS             ;ENS

                JMP      INVALID

        CNS:    
                JMP      CNS1
        CIS:    
                JMP      CIS1
        ENS:    
                JMP      ENS1

        CV:     
                PRINTST  M8              ;CV START
                CALL     NEWLINE         ;NEWLINE
                PRINTST  MR5
                PRINTST  MR5
                PRINTST  MR4
                PRINTST  p1
                PRINTST  M9              ; OPT1
                PRINTST  M10             ; OPT2
                PRINTST  M11             ; OPT3
                PRINTST  M12             ; OPT4
                PRINTST  p2
                PRINTST  MR4
                PRINTST  MR5
                PRINTST  MR5
                PRINTST  M57

                MOV      AH, 1
                INT      21h
                MOV      BL, AL
                SUB      BL, 48

                CMP      BL, 1
                JE       TWENTY2

                CMP      BL, 2
                JE       TEN

                CMP      BL, 3
                JE       THIRTY2

                CMP      BL, 4
                JE       TEN

                CMP      BL, 0
                JE       TOP5

                CMP      BL, 5
                JE       EXIT2

                JMP      INVALID         ; TILL LINE 349

        TWENTY2:
                JMP      TWENTY
        THIRTY2:
                JMP      THIRTY

        TOP5:   
                JMP      TOP

        EXIT2:  
                JMP      EXIT

        TEN:    
                mov      BL, 1
                PRINTST  M58

                MOV      AH, 1
                INT      21h
                SUB      AL, 48

                MUL      BL
                AAM

                MOV      CX, AX
                ADD      CH, 48
                ADD      CL, 48

                PRINTST  M59
                MOV      DL, CH
                MOV      AH, 2
                INT      21h
                
                MOV      DL, CL
                MOV      AH, 2
                INT      21h

                MOV      DL,'0'
                MOV      AH,2
                INT      21H

        ;FOR /- PRINT
                MOV      DL,47
                MOV      AH,2
                INT      21H
                MOV      DL,45
                MOV      AH,2
                INT      21H

        ;GO BACK TO MAIN MENU
                PRINTST  M60
                PRINTST  M61
                PRINTST  M2              ; MAIN MENU
                
                MOV      AH,1
                INT      21H
                SUB      AL,48

                CMP      AL,1
                JE       TOP1

                JMP      EXIT

        TOP1:   
                JMP      TOP

        CNS1:   
                PRINTST  M8              ;CNS START
                CALL     NEWLINE         ;NEWLINE

                PRINTST  MR5
                PRINTST  MR5             ;STAR BORDER
                PRINTST  MR4

                PRINTST  p3
                PRINTST  M25             ; OPT1
                PRINTST  M26             ; OPT2
                PRINTST  M27             ; OPT3
                PRINTST  M28             ; OPT4
                PRINTST  p4
                
                PRINTST  MR4
                PRINTST  MR5             ;STAR BORDER
                PRINTST  MR5

                PRINTST  M57

                MOV      AH,1
                INT      21H
                MOV      BL,AL
                SUB      BL,48


                CMP      BL,1
                JE       FOURTY
    
                CMP      BL,2
                JE       FOURTY
    
                CMP      BL,3
                JE       THIRTY
    
                CMP      BL,4
                JE       THIRTY

                CMP      BL, 0
                JE       TOP6

                CMP      BL, 5
                JE       EXIT3

                JMP      INVALID
            
        TOP6:   
                JMP      TOP

        EXIT3:  
                JMP      EXIT

        FOURTY: 
                mov      BL, 4
                PRINTST  M58

                MOV      AH, 1
                INT      21h
                SUB      AL, 48

                MUL      BL
                AAM

                MOV      CX, AX
                ADD      CH, 48
                ADD      CL, 48
                PRINTST  M59

                MOV      DL, CH
                MOV      AH, 2
                INT      21h
                
                MOV      DL, CL
                MOV      AH, 2
                INT      21h

                MOV      DL,'0'
                MOV      AH,2
                INT      21H

        ;FOR /- PRINT
                MOV      DL,47
                MOV      AH,2
                INT      21H
                MOV      DL,45
                MOV      AH,2
                INT      21H

        ;GO BACK TO MAIN MENU
                PRINTST  M60
                PRINTST  M61
                PRINTST  M2              ; MAIN MENU
                
                MOV      AH,1
                INT      21H
                SUB      AL,48

                CMP      AL,1
                JE       TOP4
                JMP      EXIT

        TOP4:   
                JMP      TOP

        THIRTY: 
                mov      BL, 3
                PRINTST  M58

                MOV      AH, 1
                INT      21h
                SUB      AL, 48

                MUL      BL
                AAM

                MOV      CX, AX
                ADD      CH, 48
                ADD      CL, 48
                PRINTST  M59

                MOV      DL, CH
                MOV      AH, 2
                INT      21h
                
                MOV      DL, CL
                MOV      AH, 2
                INT      21h

                MOV      DL,'0'
                MOV      AH,2
                INT      21H

        ;FOR /- PRINT
                MOV      DL,47
                MOV      AH,2
                INT      21H
                MOV      DL,45
                MOV      AH,2
                INT      21H

        ;GO BACK TO MAIN MENU
                PRINTST  M60
                PRINTST  M61
                PRINTST  M2              ; MAIN MENU
                
                MOV      AH,1
                INT      21H
                SUB      AL,48

                CMP      AL,1
                JE       TOP3

                JMP      EXIT

        TOP3:   
                JMP      TOP
            
        CIS1:   
                PRINTST  M8              ;CNS START
                PRINTST  SEJ             ;NEWLINE

                PRINTST  MR5
                PRINTST  MR5             ;STAR BORDER
                PRINTST  MR4

                PRINTST  p5
                PRINTST  M18             ; OPT1
                PRINTST  M19             ; OPT2
                PRINTST  M20             ; OPT3
                PRINTST  M21             ; OPT4
                PRINTST  p6
                
                PRINTST  MR4
                PRINTST  MR5             ;STAR BORDER
                PRINTST  MR5

                PRINTST  M57

                MOV      AH,1
                INT      21H
                MOV      BL,AL
                SUB      BL,48


                CMP      BL,1
                JE       TWENTY
    
                CMP      BL,2
                JE       THIRTY1
    
                CMP      BL,3
                JE       TEN1
    
                CMP      BL,4
                JE       FOURTY1

                CMP      BL, 0
                JE       TOP7

                CMP      BL, 5
                JE       EXIT4

                JMP      INVALID

        TOP7:   
                JMP      TOP

        EXIT4:  
                JMP      EXIT

        THIRTY1:
                JMP      THIRTY
        TEN1:   
                JMP      TEN
        FOURTY1:
                JMP      FOURTY

        TWENTY: 
                mov      BL, 2
                PRINTST  M58

                MOV      AH, 1
                INT      21h
                SUB      AL, 48

                MUL      BL
                AAM

                MOV      CX, AX
                ADD      CH, 48
                ADD      CL, 48
                PRINTST  M59

                MOV      DL, CH
                MOV      AH, 2
                INT      21h
                
                MOV      DL, CL
                MOV      AH, 2
                INT      21h

                MOV      DL,'0'
                MOV      AH,2
                INT      21H

        ;FOR /- PRINT
                MOV      DL,47
                MOV      AH,2
                INT      21H
                MOV      DL,45
                MOV      AH,2
                INT      21H

        ;GO BACK TO MAIN MENU
                PRINTST  M60
                PRINTST  M61
                PRINTST  M2              ; MAIN MENU
                
                MOV      AH,1
                INT      21H
                SUB      AL,48

                CMP      AL,1
                JE       TOP2

                JMP      EXIT

        TOP2:   
                JMP      TOP

        ENS1:   
                PRINTST  M8              ;CNS START
                PRINTST  SEJ             ;NEWLINE

                PRINTST  MR5
                PRINTST  MR5             ;STAR BORDER
                PRINTST  MR4

                PRINTST  p7
                PRINTST  M41             ; OPT1
                PRINTST  M42             ; OPT2
                PRINTST  M43             ; OPT3
                PRINTST  M44             ; OPT4
                PRINTST  p8
                
                PRINTST  MR4
                PRINTST  MR5             ;STAR BORDER
                PRINTST  MR5

                PRINTST  M57

                MOV      AH,1
                INT      21H
                MOV      BL,AL
                SUB      BL,48


                CMP      BL,1
                JE       TWENTY1
    
                CMP      BL,2
                JE       FOURTY2
    
                CMP      BL,3
                JE       TWENTY1
    
                CMP      BL,4
                JE       THIRTY3

                CMP      BL, 0
                JE       TOP8

                CMP      BL, 5
                JE       EXIT5

                JMP      INVALID

        TOP8:   
                JMP      TOP

        EXIT5:  
                JMP      EXIT

        TWENTY1:
                JMP      TWENTY
        THIRTY3:
                JMP      THIRTY
        FOURTY2:
                JMP      FOURTY
        INVALID:
                PRINTST  M55
                PRINTST  M56
                jmp      TOP

        EXIT:   
                PRINTST  SEJ
                PRINTST  EXIT1
                MOV      AH,4CH
                INT      21H
MAIN ENDP

        ;PROCEDURE TO PRINT NEW LINE.
NEWLINE PROC
                MOV      DX, 10
                MOV      AH, 2
                INT      21h
                MOV      DX, 13
                MOV      AH, 2
                INT      21h
                RET
NEWLINE ENDP
END MAIN