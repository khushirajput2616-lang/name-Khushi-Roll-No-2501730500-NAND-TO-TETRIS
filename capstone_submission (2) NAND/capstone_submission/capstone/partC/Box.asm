
// Box.asm - Nand to Tetris Capstone, Part C
// Student: Khushi Singh
// Roll no: 2501730500
// K = 00

// Box starts at row 0
// Height = 20 rows
// Width = 16 * ((0 mod 4) + 1) = 16 pixels
// Starting address = SCREEN + (32 * 0) = 16384

(LOOP)
    @KBD
    D=M
    @PRESSED
    D;JNE

    @color
    M=0

    @DRAW
    0;JMP

(PRESSED)
    @color
    M=-1

(DRAW)
    // Calculate starting address using SCREEN
    @SCREEN
    D=A
    @addr
    M=D

    // Initialize row counter
    @20
    D=A
    @count
    M=D

(ROW)
    // Get drawing colour
    @color
    D=M

    // Draw one word (16 pixels)
    @addr
    A=M
    M=D

    // Move to next screen row (32 words)
    @32
    D=A
    @addr
    M=D+M

    // Decrease row counter
    @count
    M=M-1
    D=M

    @ROW
    D;JGT

    @LOOP
    0;JMP
