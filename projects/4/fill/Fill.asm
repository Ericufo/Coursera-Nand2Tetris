// Program: Fill.asm
//Project: Fill.asm
//usage: press the keyboard and the screen will turn black,
//       leave the keyboard and the screen will return white.

(LOOP)
    //relocate the rendering address every time
    @SCREEN
    D=A
    @address
    M=D

    //detect whether the keyboard is pressing or not
    @KBD
    D=M
    @WHITE
    D;JEQ
    @BLACK
    D;JGT

    //set the color to white
(WHITE)
    @color
    M=0
    @FILL
    0;JMP

    //set the color to black
(BLACK)
    @color
    M=-1
    0;JMP

    //fill the screen with the set colorA
(FILL)
    @color
    D=M
    @address
    A=M
    M=D
    
    A=A+1
    D=A
    @address
    M=D

    //detect whether reach to the end of screen area in the ram
    @KBD
    D=A-D
    @FILL
    D;JGT

    @LOOP
    0;JMP