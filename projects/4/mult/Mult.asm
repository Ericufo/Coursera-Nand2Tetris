//program: MULT.asm
//computes: RAM[2] = RAM[0] * RAM[1]
//usage: put values in RAM[0] and RAM[1]
    //initialize
    @R2
    M=0

    //D = RAM[0]
    @R0
    D=M
    @END
    D;JEQ
(LOOP)
    @R1
    D=M
    @R2
    M=D+M
    @R0
    DM=M-1
    @LOOP
    D;JGT
    
(END)
    @END
    0;JMP