    .syntax     unified
	.cpu        cortex-m4
    .equ DISPLAY,             0xD0000000

	.text
	.global		rect
    .thumb_func
    .align
rect:
// Complete this function with your assembly code from Lab #7 and new modifications
   
    push {r4, r5, r6, lr}
    LDR r1, =#0xD0000000 
    LDR r6, =#100        //row
    loop:
        LDR r3, =#50    //col
        loop1:
            //row * 240 + col
            bl random       //will store in r0
            ORR r0, #0xFF000000
            MOV r5, #240  
            MUL r2, r6, r5
            ADD r2, r3        //r2 is i
            STR r0, [r1, r2, LSL #2]
            ADD r3, #1
            CMP r3, #199  
            
            blo loop1
        ADD r6, #1
        CMP r6, #249
        blo loop

    pop {r4, r5, r6, lr}
    
	.end