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
	.global		line
    .thumb_func
    .align
line:
// Your assembly code goes here
    //#0x3C0 for vertical line
    //row 100, col 10-229
    LDR r1, =#0xD0000000
    LDR r2, =#0x5DCA //offset
	LDR r4, =COLOR_BLUE  //red
    LDR r0, =#0xA

    loop:
        ADDS r2, #0x1
        STR r4, [r1, r2, LSL #2]
        
        ADDS r0, #0x1
        CMP  r0, #0xE5
        blo  loop

    LDR r2, =#0x2EF9
    LDR r4, =COLOR_RED
    LDR r0, =#0x32
    LDR r5,  =#0x12B
    
    loop1:
        ADDS r2, #0xF0
        STR r4, [r1, r2, LSL #2]
        ADDS r0, #0x1
        CMP r0, r5
        blo loop1

	bx		lr



	.end
