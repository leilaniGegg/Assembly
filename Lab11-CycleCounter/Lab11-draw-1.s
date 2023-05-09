    .syntax     unified
	.cpu        cortex-m4
    .equ COLOR_BLUE,          0xFF0000FF
    .equ COLOR_GREEN,         0xFF00FF00
    .equ COLOR_RED,           0xFFFF0000
    .equ COLOR_CYAN,          0xFF00FFFF
    .equ COLOR_MAGENTA,       0xFFFF00FF
    .equ COLOR_YELLOW,        0xFFFFFF00
    .equ COLOR_LIGHTBLUE,     0xFF8080FF
    .equ COLOR_LIGHTGREEN,    0xFF80FF80
    .equ COLOR_LIGHTRED,      0xFFFF8080
    .equ COLOR_LIGHTCYAN,     0xFF80FFFF
    .equ COLOR_LIGHTMAGENTA,  0xFFFF80FF
    .equ COLOR_LIGHTYELLOW,   0xFFFFFF80
    .equ COLOR_DARKBLUE,      0xFF000080
    .equ COLOR_DARKGREEN,     0xFF008000
    .equ COLOR_DARKRED,       0xFF800000
    .equ COLOR_DARKCYAN,      0xFF008080
    .equ COLOR_DARKMAGENTA,   0xFF800080
    .equ COLOR_DARKYELLOW,    0xFF808000
    .equ COLOR_WHITE,         0xFFFFFFFF
    .equ COLOR_LIGHTGRAY,     0xFFD3D3D3
    .equ COLOR_GRAY,          0xFF808080
    .equ COLOR_DARKGRAY,      0xFF404040
    .equ COLOR_BLACK,         0xFF000000
    .equ COLOR_BROWN,         0xFFA52A2A
    .equ COLOR_ORANGE,        0xFFFFA500
    .equ DISPLAY,             0xD0000000

    .text
	.global		rect
    .thumb_func
    .align
rect:
// Your assembly code goes here
    push {r4, r5}
    //change r4 to r0 and r0 r4
    //r0 is now the color input
    LDR r1, =#0xD0000000
    //LDR r4, =COLOR_RED  
    LDR r4, =#150        //row
    loop:
        LDR r3, =#50    //col
        loop1:
            //row * 240 + col
            MOV r5, #240  
            MUL r2, r4, r5
            ADD r2, r3        //r2 is i
            STR r0, [r1, r2, LSL #2]
            ADD r3, #1
            CMP r3, #150  
            blo loop1
        ADD r4, #1
        CMP r4, #250  
        blo loop

    pop {r4, r5}

	bx		lr
	.end
